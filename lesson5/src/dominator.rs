use std::collections::{HashMap, HashSet};

use graphviz_rust::dot_structures::{
    Attribute, Edge, EdgeTy, Id, Node, NodeId, Stmt, Subgraph, Vertex,
};
use lesson2::ControlFlow;

pub struct DomBuilder<'a> {
    pub cfg: &'a ControlFlow,
    pub dom_map: HashMap<usize, HashSet<usize>>,
    pub dom_frontier: HashMap<usize, HashSet<usize>>,
    pub paths: HashSet<Vec<usize>>,
}

impl<'a> DomBuilder<'a> {
    pub fn new(cfg: &'a ControlFlow) -> Self {
        // initialize dom_map with every blk mapped to all other blks
        let mut dom_map = HashMap::new();
        let mut dom_frontier = HashMap::new();

        let set_of_all_blks: HashSet<usize> =
            cfg.blocks.iter().enumerate().map(|(idx, _)| idx).collect();
        cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            dom_map.insert(idx, set_of_all_blks.clone());
            dom_frontier.insert(idx, HashSet::new());
        });

        // dom_map[entry] = {entry}
        dom_map.insert(0, HashSet::from([0]));

        Self {
            cfg,
            dom_map,
            dom_frontier,
            paths: HashSet::new(),
        }
    }

    fn find_all_paths_recur(
        &mut self,
        src: usize,
        dst: usize,
        visited: &mut Vec<bool>,
        cur_path: &mut Vec<usize>,
    ) {
        visited[src] = true;
        cur_path.push(src);

        if src == dst {
            self.paths.insert(cur_path.to_vec());
        }
        let edges = &self.cfg.edges[src].get_dests();
        edges.iter().for_each(|adj_dst| {
            if !visited[*adj_dst] {
                self.find_all_paths_recur(*adj_dst, dst, visited, cur_path);
            }
        })
    }

    fn find_all_paths(&mut self, dst: usize) {
        let mut visited = Vec::new();
        self.cfg.blocks.iter().for_each(|_| {
            visited.push(false);
        });

        let mut cur_path = Vec::new();

        self.find_all_paths_recur(0, dst, &mut visited, &mut cur_path);
    }

    pub fn compare_blk(&mut self, blk: usize) {
        self.find_all_paths(blk);
        // self.build();

        // to brute force the dominator, take the intersection of all the paths we found
        let brute_force: HashSet<usize> = self.paths.iter().fold(HashSet::new(), |acc, vec| {
            // turn vec into set
            let mut path_set: HashSet<usize> = HashSet::new();
            vec.iter().for_each(|elt| {
                path_set.insert(*elt);
            });

            acc.intersection(&path_set).map(|idx| *idx).collect()
        });

        let smart = &self.dom_map[&blk];

        let diff: Vec<usize> = brute_force.difference(smart).map(|idx| *idx).collect();
        if !diff.is_empty() {
            println!("dom for {blk} in {} is not correct", self.cfg.name);
        };
    }

    pub fn compare_all(&mut self) {
        self.build();
        self.cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            self.compare_blk(idx);
        })
    }

    /// given a blk idx, find which blks it immediately dominates. requires that the dom set for `src` be constructed
    fn idoms(&self, src: usize) -> HashSet<usize> {
        let mut idom_set = HashSet::new();
        let dom_set = &self.dom_map[&src];
        dom_set.iter().for_each(|dominee| {
            // check if dominee is in the dom set of anything else in dom_set
            let in_other_set = dom_set
                .iter()
                .filter(|idx| *idx != dominee && **idx != src)
                .fold(false, |acc, intervening_idx| {
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

    /// requires the dom_map to be built
    pub fn build_frontier(&mut self) {
        self.cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            // the successors of all the things `idx` dominates
            let dom_nodes = &self.dom_map[&idx];
            let mut all_dom_succs: HashSet<usize> = HashSet::new();
            dom_nodes.iter().for_each(|node| {
                let node_succs = self.cfg.succs(*node);
                node_succs.iter().for_each(|node_succ| {
                    all_dom_succs.insert(*node_succ);
                })
            });

            // filter so its only things not dom by `idx`
            let not_dom: HashSet<usize> = all_dom_succs
                .into_iter()
                .filter(|dom_succ| !self.dom_map[&idx].contains(dom_succ))
                .collect();
            self.dom_frontier.insert(idx, not_dom);
        })
    }

    pub fn print_frontier(&self) {
        self.dom_frontier
            .iter()
            .for_each(|(idx, frontier)| println!("blk {idx} frontier set: {:#?}", frontier))
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
