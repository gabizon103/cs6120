use std::collections::{HashMap, HashSet};

use graphviz_rust::dot_structures::{
    Attribute, Edge, EdgeTy, Id, Node, NodeId, Stmt, Subgraph, Vertex,
};
use lesson2::ControlFlow;

pub struct DomBuilder<'a> {
    pub cfg: &'a ControlFlow,
    pub dom_map: HashMap<usize, HashSet<usize>>,
}

impl<'a> DomBuilder<'a> {
    pub fn new(cfg: &'a ControlFlow) -> Self {
        // initialize dom_map with every blk mapped to all other blks
        let mut dom_map = HashMap::new();
        let set_of_all_blks: HashSet<usize> =
            cfg.blocks.iter().enumerate().map(|(idx, _)| idx).collect();
        cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            dom_map.insert(idx, set_of_all_blks.clone());
        });

        // dom_map[entry] = {entry}
        dom_map.insert(0, HashSet::from([0]));

        Self { cfg, dom_map }
    }

    /// given a blk idx, find which blks it immediately dominates. requires that the dom set for `src` be constructed
    fn idoms(&self, src: usize) -> HashSet<usize> {
        let mut idom_set = HashSet::new();
        let dom_set = &self.dom_map[&src];
        dom_set.iter().for_each(|dominee| {
            // check if dominee is in the dom set of anything else in dom_set
            let in_other_set =
                dom_set
                    .iter()
                    .filter(|idx| *idx != dominee && **idx != src)
                    .fold(false, |acc, intervening_idx| {
                        println!("{src} < {intervening_idx}");
                        let intervening_set = &self.dom_map[intervening_idx];
                        intervening_set.contains(dominee) || acc
                    });
            if !in_other_set {
                idom_set.insert(*dominee);
            }
        });

        idom_set
    }

    fn body(&mut self) {
        self.cfg
            .blocks
            .iter()
            .enumerate()
            .filter(|(idx, _)| *idx != 0)
            .for_each(|(idx, _)| {
                let init_set: HashSet<usize> = self
                    .cfg
                    .blocks
                    .iter()
                    .enumerate()
                    .map(|(idx, _)| idx)
                    .collect();

                let preds = self.cfg.preds(idx);
                let pred_intersect = preds.iter().fold(init_set, |acc: HashSet<usize>, pred| {
                    let dom_pred = &self.dom_map[pred];
                    let intersection = acc.intersection(&dom_pred).map(|idx| *idx).collect();
                    intersection
                });
                let vert_set = HashSet::from([idx]);
                let union = vert_set.union(&pred_intersect).map(|idx| *idx).collect();
                self.dom_map.insert(idx, union);
            });
    }

    pub fn build(&mut self) {
        let mut old_map = self.dom_map.clone();
        self.body();
        while old_map != self.dom_map {
            old_map = self.dom_map.clone();
            self.body();
        }
    }

    /// Dominator tree in dot format
    pub fn to_dot(&self, sg_idx: usize) -> Subgraph {
        let mut graph = Subgraph {
            id: Id::Plain(format!("G_{sg_idx}")),
            stmts: vec![],
        };

        self.dom_map.keys().for_each(|idx| {
            let name = &self.cfg.blocks[*idx].name;
            let mut node = Node {
                id: NodeId(Id::Plain(format!("sg_{sg_idx}_node_{idx}")), None),
                attributes: vec![],
            };
            let shape = Attribute(
                Id::Plain("shape".to_string()),
                Id::Plain(r#""oval""#.to_string()),
            );
            let lbl = Attribute(Id::Plain("label".to_string()), Id::Plain(name.clone()));
            node.attributes.push(shape);
            node.attributes.push(lbl);
            graph.stmts.push(Stmt::Node(node));
        });

        self.dom_map.iter().for_each(|(src, _)| {
            let dests = self.idoms(*src);
            let edges = dests.iter().filter(|dest| src != *dest).map(|dest| {
                let edge = Edge {
                    ty: EdgeTy::Pair(
                        Vertex::N(NodeId(Id::Plain(format!("sg_{sg_idx}_node_{dest}")), None)),
                        Vertex::N(NodeId(Id::Plain(format!("sg_{sg_idx}_node_{src}")), None)),
                    ),
                    attributes: vec![],
                };
                edge
            });
            edges.for_each(|edge| {
                graph.stmts.push(Stmt::Edge(edge));
            });
        });

        graph
    }
}
