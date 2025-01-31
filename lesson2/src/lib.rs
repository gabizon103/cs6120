pub mod stat;
use bril_rs::{Code, Function, Instruction, Program};
use graphviz_rust::dot_structures::{
    Attribute, Edge as VizEdge, EdgeTy, Id, Node, NodeId, Stmt, Subgraph, Vertex,
};
use itertools::Itertools;
use serde_json;
use std::collections::HashMap;

#[derive(Default, Clone, Debug)]
pub struct BasicBlock {
    pub name: String,
    pub instrs: Vec<Instruction>,
}

impl BasicBlock {
    pub fn to_node(&self, idx: usize) -> String {
        let oval = "oval";
        let node = self.to_string();
        format!(
            r##"
            node_{idx} [shape="{oval}"][label="{node}"]
        "##
        )
    }
}

impl std::fmt::Display for BasicBlock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let sep = r"\l";
        let instrs = &self
            .instrs
            .iter()
            .map(|instr| format!("{instr}"))
            .collect_vec()
            .join(sep);
        write!(f, "{} {} {}", self.name, sep, instrs)?;
        Ok(())
    }
}

fn is_terminator_or_label(code: &Code) -> bool {
    match code {
        Code::Label { .. } => true,
        Code::Instruction(instruction) => match instruction {
            Instruction::Constant { .. } => false,
            Instruction::Value { .. } => false,
            Instruction::Effect { op, .. } => match op {
                bril_rs::EffectOps::Jump
                | bril_rs::EffectOps::Branch
                | bril_rs::EffectOps::Return => true,
                _ => {
                    false
                }
            },
        },
    }
}

/// Takes a function and returns its basic blocks
fn build_blocks(func: Function) -> (String, Vec<BasicBlock>, HashMap<String, usize>) {
    let name = func.name;
    let mut block = BasicBlock::default();
    block.name = name.clone();
    let mut blocks = Vec::new();
    let mut label_to_block = HashMap::new();

    for code in &func.instrs {
        match code {
            Code::Label { label, .. } => {
                if !block.instrs.is_empty() {
                    blocks.push(block.clone());
                    block = BasicBlock::default();
                }
                block.name = format!("{}_{}", name.clone(), label.to_string());
                let idx = blocks.len();
                label_to_block.insert(label.to_string(), idx);
            }
            Code::Instruction(instruction) => {
                block.instrs.push(instruction.clone());
                if is_terminator_or_label(code) {
                    blocks.push(block.clone());
                    block = BasicBlock::default();
                }
            }
        };
    }
    if blocks.is_empty() || block.name != "" {
        blocks.push(block.clone())
    }
    (name, blocks, label_to_block)
}

pub fn form_blocks_from_read<R: std::io::Read>(
    mut input: R,
    // file_name: Option<PathBuf>,
) -> Vec<(String, Vec<BasicBlock>, HashMap<String, usize>)> {
    let mut buf = String::new();
    input.read_to_string(&mut buf).unwrap();

    let program: Program =
        serde_json::from_str(&buf).expect("couldn't parse json into bril program");

    program
        .functions
        .into_iter()
        .map(|func| build_blocks(func))
        .collect()
}

#[derive(Clone)]
pub enum Edge {
    Uncond(usize),
    Cond { true_targ: usize, false_targ: usize },
    None,
}

impl std::fmt::Display for Edge {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Edge::Uncond(idx) => write!(f, "{idx}")?,
            Edge::Cond {
                true_targ,
                false_targ,
            } => write!(f, "{true_targ} (true), {false_targ} (false)")?,
            Edge::None => write!(f, "none")?,
        };
        Ok(())
    }
}

impl std::fmt::Display for ControlFlow {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for block in &self.blocks {
            write!(f, "{block}")?;
        }
        Ok(())
    }
}

#[derive(Default)]
pub struct ControlFlow {
    pub name: String,
    pub blocks: Vec<BasicBlock>,
    pub edges: Vec<Edge>,
    pub lbl_to_block: HashMap<String, usize>,
}

impl ControlFlow {
    pub fn new(
        name: String,
        blocks: Vec<BasicBlock>,
        lbl_to_block: HashMap<String, usize>,
    ) -> Self {
        let mut edges = vec![];
        for _ in 0..blocks.len() {
            edges.push(Edge::None)
        }
        Self {
            name,
            blocks,
            edges,
            lbl_to_block,
        }
    }

    pub fn build(&mut self) {
        for (idx, block) in self.blocks.iter().enumerate() {
            if let Some(last) = block.instrs.last() {
                match last {
                    Instruction::Constant { .. } |
                    Instruction::Value { .. } => {
                        if idx == self.blocks.len() - 1 {
                            self.edges.insert(idx, Edge::None);
                        } else {
                            self.edges.insert(idx, Edge::Uncond(idx + 1))
                        }
                    },
                    Instruction::Effect { labels, op, .. } => match op {
                        bril_rs::EffectOps::Jump => {
                            let targ = labels.get(0).unwrap();
                            let targ = self.lbl_to_block.get(targ).unwrap();
                            let edge = Edge::Uncond(*targ);
                            self.edges.insert(idx, edge);
                        }
                        bril_rs::EffectOps::Branch => {
                            let true_br = labels.get(0).unwrap();
                            let true_targ = self.lbl_to_block.get(true_br).unwrap();
                            let false_br = labels.get(1).unwrap();
                            let false_targ = self.lbl_to_block.get(false_br).unwrap();

                            let edge = Edge::Cond {
                                true_targ: *true_targ,
                                false_targ: *false_targ,
                            };
                            self.edges.insert(idx, edge);
                        }
                        bril_rs::EffectOps::Return => {
                            self.edges.insert(idx, Edge::None);
                        },
                        _ => {
                            // if there are no blocks after this one
                            if idx == self.blocks.len() - 1 {
                                self.edges.insert(idx, Edge::None);
                            } else {
                                self.edges.insert(idx, Edge::Uncond(idx + 1))
                            }
                        }
                    },
                }
            }
        }
    }

    pub fn to_dot(&self, sg_idx: usize) -> Subgraph {
        let mut graph = Subgraph {
            id: Id::Plain(format!("G_{sg_idx}")),
            stmts: vec![],
        };
        for (idx, block) in self.blocks.iter().enumerate() {
            let mut node = Node {
                id: NodeId(Id::Plain(format!("sg_{sg_idx}_node_{idx}")), None),
                attributes: vec![],
            };
            let shape = Attribute(
                Id::Plain("shape".to_string()),
                Id::Plain(r#""oval""#.to_string()),
            );
            let block = format!(r#""{}""#, block.to_string());
            let lbl = Attribute(Id::Plain("label".to_string()), Id::Plain(block));
            node.attributes.push(shape);
            node.attributes.push(lbl);
            graph.stmts.push(Stmt::Node(node));
        }
        for (idx, edge) in self.edges.iter().enumerate() {
            match edge {
                Edge::Uncond(to_idx) => {
                    let viz_edge = VizEdge {
                        ty: EdgeTy::Pair(
                            Vertex::N(NodeId(Id::Plain(format!("sg_{sg_idx}_node_{idx}")), None)),
                            Vertex::N(NodeId(
                                Id::Plain(format!("sg_{sg_idx}_node_{to_idx}")),
                                None,
                            )),
                        ),
                        attributes: vec![],
                    };
                    graph.stmts.push(Stmt::Edge(viz_edge));
                }
                Edge::Cond {
                    true_targ,
                    false_targ,
                } => {
                    let true_edge = VizEdge {
                        ty: EdgeTy::Pair(
                            Vertex::N(NodeId(Id::Plain(format!("sg_{sg_idx}_node_{idx}")), None)),
                            Vertex::N(NodeId(
                                Id::Plain(format!("sg_{sg_idx}_node_{true_targ}")),
                                None,
                            )),
                        ),
                        attributes: vec![Attribute(
                            Id::Plain("color".to_string()),
                            Id::Plain("green".to_string()),
                        )],
                    };
                    let false_edge = VizEdge {
                        ty: EdgeTy::Pair(
                            Vertex::N(NodeId(Id::Plain(format!("sg_{sg_idx}_node_{idx}")), None)),
                            Vertex::N(NodeId(
                                Id::Plain(format!("sg_{sg_idx}_node_{false_targ}")),
                                None,
                            )),
                        ),
                        attributes: vec![Attribute(
                            Id::Plain("color".to_string()),
                            Id::Plain("red".to_string()),
                        )],
                    };
                    graph.stmts.push(Stmt::Edge(true_edge));
                    graph.stmts.push(Stmt::Edge(false_edge));
                }
                Edge::None => (),
            }
        }
        graph
    }
}
