use std::{
    collections::{HashMap, HashSet, VecDeque},
    usize,
};

use lesson2::ControlFlow;
use utils;

pub type InstrIdx = (usize, usize);

pub struct ReachingDefs {
    pub cfg: ControlFlow,
    pub worklist: VecDeque<usize>, // indices into cfg.blocks
    // ins and outs are mappings from var names to sets of definitions
    pub ins: Vec<HashMap<String, HashSet<InstrIdx>>>, // indexed by block index, set of defs that reach that block
    pub outs: Vec<HashMap<String, HashSet<InstrIdx>>>,
}

impl ReachingDefs {
    pub fn new(cfg: ControlFlow) -> Self {
        let mut worklist = VecDeque::default();
        let mut ins = Vec::default();
        let mut outs = Vec::default();
        // fill worklist with blocks
        // set all block inputs/outputs to empty set
        cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            worklist.push_back(idx);
            if idx == 0 {
                let mut map = HashMap::new();
                cfg.args.iter().for_each(|arg| {
                    let arg = &arg.name;
                    map.insert(arg.clone(), HashSet::from([(usize::MAX, usize::MAX)]));
                });
                ins.push(map);
            } else {
                ins.push(HashMap::new());
            }
            outs.push(HashMap::new());
        });

        Self {
            cfg,
            worklist,
            ins,
            outs,
        }
    }

    // applies the transfer function to the input, `blk_idx`, to produce the output
    pub fn transfer(&self, blk_idx: usize) -> HashMap<String, HashSet<InstrIdx>> {
        // let mut out_blk = HashMap::new();
        let mut in_map = self.ins.get(blk_idx).unwrap().clone();
        let blk = self.cfg.blocks.get(blk_idx).unwrap();
        blk.instrs
            .iter()
            .enumerate()
            .for_each(|(instr_idx, instr)| {
                if let Some(kills) = utils::cfg::get_dest(instr) {
                    let mut set = HashSet::new();
                    set.insert((blk_idx, instr_idx));
                    in_map.insert(kills, set);
                }
            });

        in_map
    }

    // updates the ins and outs, which is what we care about
    pub fn worklist(&mut self) {
        while !self.worklist.is_empty() {
            let b = self.worklist.pop_front().unwrap();
            self.ins[b] = if b == 0 {
                self.ins[b].clone()
            } else {
                HashMap::new()
            };
            let b_preds = self.cfg.preds(b);
            b_preds.iter().for_each(|pred| {
                let out_pred = self.outs.get(*pred).unwrap();
                out_pred.iter().for_each(|(dest, pred_set)| {
                    let def = HashSet::new();
                    let set = &self.ins[b].get(dest).unwrap_or(&def);
                    let set: HashSet<_> = set
                        .union(pred_set)
                        .map(|(blk_idx, instr_idx)| (*blk_idx, *instr_idx))
                        .collect();
                    self.ins[b].insert(dest.to_string(), set);
                })
            });
            let out_b = self.transfer(b);
            let cur_out_b = self.outs.get_mut(b).unwrap();
            if out_b != *cur_out_b {
                self.outs[b] = out_b;
                let b_succs = self.cfg.succs(b);
                b_succs.iter().for_each(|succ| {
                    self.worklist.push_back(*succ);
                });
            }
        }
    }
}
