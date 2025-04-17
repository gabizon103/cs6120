use std::collections::{HashMap, HashSet, VecDeque};

use itertools::Itertools;
use lesson2::{BasicBlock, ControlFlow};
use utils::cfg::{get_dest, get_uses};

use crate::reaching_defs::InstrIdx;
use std::fmt::Debug;

pub enum Direction {
    Forward,
    Backward,
}

pub trait DataFlowAnalysis<ValType>
where
    ValType: Default + Clone + PartialEq,
{
    fn transfer(&self, input: &ValType, blk: &BasicBlock, blk_idx: usize) -> ValType;

    fn merge(&self, input: &ValType, preds: Vec<ValType>) -> ValType;

    fn direction(&self) -> Direction;
}

pub struct ReachingDefsGeneric;

impl ReachingDefsGeneric {
    pub fn new() -> Self {
        Self
    }
}

impl DataFlowAnalysis<HashMap<String, HashSet<InstrIdx>>> for ReachingDefsGeneric {
    fn transfer(
        &self,
        input: &HashMap<String, HashSet<InstrIdx>>,
        blk: &BasicBlock,
        blk_idx: usize,
    ) -> HashMap<String, HashSet<InstrIdx>> {
        let mut in_map = input.clone();
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

    fn merge(
        &self,
        input: &HashMap<String, HashSet<InstrIdx>>,
        preds: Vec<HashMap<String, HashSet<InstrIdx>>>,
    ) -> HashMap<String, HashSet<InstrIdx>> {
        let mut map = HashMap::new();
        preds.iter().for_each(|pred_map| {
            pred_map.iter().for_each(|(dest, pred_set)| {
                let def = HashSet::new();
                let in_set = input.get(dest).unwrap_or(&def);
                let set: HashSet<_> = in_set
                    .union(pred_set)
                    .map(|(blk_idx, instr_idx)| (*blk_idx, *instr_idx))
                    .collect();
                map.insert(dest.to_string(), set);
            });
        });

        map
    }

    fn direction(&self) -> Direction {
        Direction::Forward
    }
}

pub struct LiveVars;

impl LiveVars {
    pub fn new() -> Self {
        Self
    }
}

impl DataFlowAnalysis<HashSet<String>> for LiveVars {
    fn transfer(&self, input: &HashSet<String>, blk: &BasicBlock, _: usize) -> HashSet<String> {
        let mut in_set = input.clone();
        blk.instrs.iter().rev().for_each(|instr| {
            // remove the def from the set
            if let Some(dest) = get_dest(instr) {
                in_set.remove(&dest);
            };

            // add the uses to the set
            let uses = get_uses(instr);
            uses.iter().for_each(|arg| {
                in_set.insert(arg.clone());
            });
        });

        in_set
    }

    fn merge(&self, _: &HashSet<String>, preds: Vec<HashSet<String>>) -> HashSet<String> {
        // println!("merging {:#?}", preds);
        let set = preds.iter().fold(HashSet::new(), |acc, elt| {
            acc.union(elt).map(|elt| elt.clone()).collect()
        });
        // println!("{:#?}", set);
        set
    }

    fn direction(&self) -> Direction {
        Direction::Backward
    }
}

pub struct AnalysisFramework<ValType>
where
    ValType: Default + Clone + PartialEq + Debug,
{
    pub cfg: ControlFlow,
    pub worklist: VecDeque<usize>,
    pub ins: Vec<ValType>,
    pub outs: Vec<ValType>,
}

impl<ValType> std::fmt::Debug for AnalysisFramework<ValType> where ValType : Default + Clone + PartialEq + Debug {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        writeln!(f, "INS: {}", self.cfg.name)?;
        self.ins.iter().enumerate().for_each(|(idx, map)| {
            let name = &self.cfg.blocks.get(idx).unwrap().name;
            let _ = writeln!(f, "block{idx} ({name}):");
            let _ = writeln!(f, "{:?}", map);
        });
        writeln!(f, "OUTS: {}", self.cfg.name)?;
        self.outs.iter().enumerate().for_each(|(idx, map)| {
            let name = &self.cfg.blocks.get(idx).unwrap().name;
            let _ = writeln!(f, "block{idx} ({name}):");
            let _ = writeln!(f, "{:#?}", map);
        });

        Ok(())
    }
}

impl<ValType> AnalysisFramework<ValType>
where
    ValType: Default + Clone + PartialEq + Debug,
{
    pub fn new(cfg: ControlFlow, init: ValType) -> Self {
        let mut worklist = VecDeque::default();
        let mut ins = Vec::default();
        let mut outs = Vec::default();
        cfg.blocks.iter().enumerate().for_each(|(idx, _)| {
            worklist.push_back(idx);
            if idx == 0 {
                ins.push(init.clone());
            } else {
                ins.push(ValType::default())
            }
            outs.push(ValType::default())
        });

        Self {
            cfg,
            worklist,
            ins,
            outs,
        }
    }

    pub fn worklist(&mut self, analysis: &impl DataFlowAnalysis<ValType>) {
        match analysis.direction() {
            Direction::Forward => {
                while !self.worklist.is_empty() {
                    let b = self.worklist.pop_front().unwrap();
                    self.ins[b] = if b == 0 {
                        self.ins[b].clone()
                    } else {
                        ValType::default()
                    };
                    let b_preds = self.cfg.preds(b);
                    let incoming_values = b_preds
                        .iter()
                        .map(|pred_idx| self.outs[*pred_idx].clone())
                        .collect_vec();

                    self.ins[b] = analysis.merge(&self.ins[b], incoming_values);
                    let out = analysis.transfer(&self.ins[b], self.cfg.blocks.get(b).unwrap(), b);
                    if out != self.outs[b] {
                        self.outs[b] = out;
                        let b_succs = self.cfg.succs(b);
                        b_succs.iter().for_each(|succ| {
                            self.worklist.push_back(*succ);
                        })
                    }
                }
            }
            Direction::Backward => {
                let exit_idx = self.cfg.blocks.len() - 1;
                while !self.worklist.is_empty() {
                    let b = self.worklist.pop_front().unwrap();
                    let b_succs = self.cfg.succs(b);
                    let incoming_values = b_succs
                        .iter()
                        .map(|pred_idx| self.ins[*pred_idx].clone())
                        .collect_vec();
                    self.outs[b] = analysis.merge(&self.outs[b], incoming_values);
                    let in_ = analysis.transfer(&self.outs[b], self.cfg.blocks.get(b).unwrap(), b);
                    if in_ != self.ins[b] {
                        self.ins[b] = in_;
                        let b_preds = self.cfg.preds(b);
                        b_preds.iter().for_each(|succ| {
                            self.worklist.push_back(*succ);
                        })
                    }
                }
            }
        }
    }
}
