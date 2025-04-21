pub mod stat;
use bril_rs::{Argument, Code, Function, Instruction, Program, Type};
use graphviz_rust::dot_structures::{
    Attribute, Edge as VizEdge, EdgeTy, Id, Node, NodeId, Stmt, Subgraph, Vertex,
};
use itertools::Itertools;
use serde::{Deserialize, Serialize};
use serde_json;
use std::collections::{HashMap, HashSet};

#[derive(Default, Clone, Debug, Serialize, Deserialize)]
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

    pub fn to_json(&self) -> String {
        serde_json::to_string(&self.instrs).unwrap()
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
                _ => false,
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
                // if !block.instrs.is_empty() {
                //     blocks.push(block.clone());
                //     block = BasicBlock::default();
                // }
                if block.name != "" {
                    blocks.push(block.clone());
                    block = BasicBlock::default();
                }
                block.name = format!("{}", label.to_string());
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
) -> (
    Vec<(
        String,
        Vec<BasicBlock>,
        HashMap<String, usize>,
        Vec<Argument>,
        Option<Type>,
    )>,
    Program,
) {
    let mut buf = String::new();
    input.read_to_string(&mut buf).unwrap();

    let program: Program =
        serde_json::from_str(&buf).expect("couldn't parse json into bril program");

    (
        program
            .clone()
            .functions
            .into_iter()
            .map(|func| {
                let (name, blocks, lbl_to_block) = build_blocks(func.clone());
                (name, blocks, lbl_to_block, func.args, func.return_type)
            })
            .collect(),
        program,
    )
}

#[derive(Clone)]
pub enum Edge {
    Uncond(usize),
    Cond { true_targ: usize, false_targ: usize },
    None,
}

impl Edge {
    pub fn get_dests(&self) -> Vec<usize> {
        match self {
            Edge::Uncond(idx) => vec![*idx],
            Edge::Cond {
                true_targ,
                false_targ,
            } => vec![*true_targ, *false_targ],
            Edge::None => vec![],
        }
    }
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

#[derive(Default, Serialize, Deserialize)]
pub struct CFGProgram {
    pub functions: Vec<ControlFlow>,
}

impl CFGProgram {
    pub fn to_json(&self) -> String {
        serde_json::to_string(&self).unwrap()
    }

    pub fn flatten_blocks(&self) -> Vec<FlatFunction> {
        self.functions
            .iter()
            .map(|func| FlatFunction {
                name: func.name.clone(),
                instrs: func.flatten_blocks(),
                args: func.args.clone(),
                return_type: func.ret_type.clone(),
            })
            .collect()
    }
}

#[derive(Serialize, Deserialize)]
pub struct FlatProgram {
    pub functions: Vec<FlatFunction>,
}

impl FlatProgram {
    pub fn to_json(&self) -> String {
        serde_json::to_string(&self).unwrap()
    }
}

#[derive(Serialize, Deserialize)]
pub struct FlatFunction {
    pub name: String,
    pub instrs: Vec<Code>,
    pub args: Vec<Argument>,
    #[serde(rename = "type")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub return_type: Option<Type>,
}

#[derive(Default, Serialize, Deserialize, Clone)]
pub struct ControlFlow {
    pub name: String,
    pub blocks: Vec<BasicBlock>,
    #[serde(skip_serializing)]
    #[serde(skip_deserializing)]
    pub edges: Vec<Edge>,
    #[serde(skip_serializing)]
    #[serde(skip_deserializing)]
    pub lbl_to_block: HashMap<String, usize>,
    pub args: Vec<Argument>,
    pub ret_type: Option<Type>,
}

impl ControlFlow {
    pub fn new(
        name: String,
        blocks: Vec<BasicBlock>,
        lbl_to_block: HashMap<String, usize>,
        args: Vec<Argument>,
        ret_type: Option<Type>,
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
            args,
            ret_type,
        }
    }

    /// Returns a set of the predecessors of blk
    pub fn preds(&self, blk: usize) -> HashSet<usize> {
        let mut preds = HashSet::new();
        self.edges.iter().enumerate().for_each(|(src_idx, edge)| {
            match edge {
                Edge::Uncond(dst_idx) => {
                    if *dst_idx == blk {
                        preds.insert(src_idx);
                    }
                }
                Edge::Cond {
                    true_targ,
                    false_targ,
                } => {
                    if *true_targ == blk || *false_targ == blk {
                        preds.insert(src_idx);
                    }
                }
                Edge::None => (),
            };
        });

        preds
    }

    pub fn succs(&self, blk: usize) -> Vec<usize> {
        match self.edges.get(blk).unwrap() {
            Edge::Uncond(idx) => vec![*idx],
            Edge::Cond {
                true_targ,
                false_targ,
            } => vec![*true_targ, *false_targ],
            Edge::None => vec![],
        }
    }

    pub fn create_single_exit(&mut self) {
        let mut exit = BasicBlock::default();
        exit.name = "exit".to_string();
        self.blocks.push(exit);
        let exit_idx = self.blocks.len() - 1;
        self.edges.push(Edge::None);
        self.edges.iter_mut().enumerate().for_each(|(idx, edge)| {
            if matches!(edge, Edge::None) && idx != exit_idx {
                *edge = Edge::Uncond(exit_idx);
            }
        });
    }

    pub fn add_rets(&mut self) {
        if self.ret_type.is_none() {
            self.edges.iter().enumerate().for_each(|(idx, edge)| {
                if matches!(edge, Edge::None) && idx < self.blocks.len() {
                    let blk = &mut self.blocks[idx];
                    blk.instrs.push(Instruction::Effect {
                        args: vec![],
                        funcs: vec![],
                        labels: vec![],
                        op: bril_rs::EffectOps::Return,
                        pos: None,
                    });
                }
            });
        }
    }

    pub fn flatten_blocks(&self) -> Vec<Code> {
        let mut instrs = vec![];
        self.blocks.iter().for_each(|block| {
            let lbl = Code::Label {
                label: block.name.clone(),
                pos: None,
            };
            instrs.push(lbl);
            block.instrs.iter().for_each(|instr| {
                instrs.push(Code::Instruction(instr.clone()));
            });
        });
        instrs
    }

    pub fn build(&mut self) {
        for (idx, block) in self.blocks.iter().enumerate() {
            if let Some(last) = block.instrs.last() {
                match last {
                    Instruction::Constant { .. } | Instruction::Value { .. } => {
                        if idx == self.blocks.len() - 1 {
                            self.edges.insert(idx, Edge::None);
                        } else {
                            self.edges.insert(idx, Edge::Uncond(idx + 1))
                        }
                    }
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
                        }
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
        // self.create_single_exit();
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
