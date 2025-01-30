use bril_rs::{ConstOps, EffectOps, ValueOps};
use linked_hash_map::LinkedHashMap;
use std::collections::HashMap;

use crate::{BasicBlock, ControlFlow};

#[derive(Default)]
pub struct StatCounter {
    const_instrs: HashMap<ConstOps, u32>,
    val_instrs: HashMap<ValueOps, u32>,
    effect_instrs: HashMap<EffectOps, u32>,
    pub lbl_map: LinkedHashMap<String, u32>,
}

impl StatCounter {
    pub fn new() -> Self {
        Self {
            ..Default::default()
        }
    }

    pub fn count_instrs_block(&mut self, block: &BasicBlock) {
        block.instrs.iter().for_each(|instr| match instr {
            bril_rs::Instruction::Constant { op, .. } => {
                let count = self.const_instrs.get(op).unwrap_or(&0);
                self.const_instrs.insert(*op, count + 1);
            }
            bril_rs::Instruction::Value { op, .. } => {
                let count = self.val_instrs.get(op).unwrap_or(&0);
                self.val_instrs.insert(*op, count + 1);
            }
            bril_rs::Instruction::Effect { op, .. } => {
                let count = self.effect_instrs.get(op).unwrap_or(&0);
                self.effect_instrs.insert(*op, count + 1);
            }
        });
    }

    pub fn count_instrs_blocks(&mut self, cfg: ControlFlow) {
        let blocks = &cfg.blocks;
        blocks
            .iter()
            .for_each(|block| self.count_instrs_block(block));
    }

    pub fn count_targets_blocks(&mut self, cfg: &ControlFlow) {
        let blocks = &cfg.blocks;
        blocks.iter().for_each(|block| {
            if let Some(last_instr) = block.instrs.last() {
                match last_instr {
                    bril_rs::Instruction::Constant { .. } => (),
                    bril_rs::Instruction::Value { .. } => (),
                    bril_rs::Instruction::Effect { op, labels, .. } => match op {
                        EffectOps::Jump => {
                            let lbl = labels.get(0).unwrap();
                            let count = self.lbl_map.get(lbl).unwrap_or(&0);
                            self.lbl_map.insert(lbl.to_string(), count + 1);
                        }
                        EffectOps::Branch => {
                            let true_lbl = labels.get(0).unwrap();
                            let false_lbl = labels.get(1).unwrap();

                            let true_count = self.lbl_map.get(true_lbl).unwrap_or(&0);
                            self.lbl_map.insert(true_lbl.to_string(), true_count + 1);

                            let false_count = self.lbl_map.get(false_lbl).unwrap_or(&0);
                            self.lbl_map.insert(false_lbl.to_string(), false_count + 1);
                        }
                        _ => {
                            ()
                        }
                    },
                }
            } else {
                panic!("empty block!")
            }
        })
    }

    pub fn count_targets_edges(&mut self, cfg: &ControlFlow) {
        let blocks = &cfg.blocks;
        println!("{}", cfg.name);
        println!("{} blocks", blocks.len());
        let edges = &cfg.edges;
        edges.iter().for_each(|edge| match edge {
            crate::Edge::Uncond(idx) => {
                let targ_name = blocks.get(*idx).unwrap().name.clone();
                let count = self.lbl_map.get(&targ_name).unwrap_or(&0);
                self.lbl_map.insert(targ_name, count + 1);
            }
            crate::Edge::Cond {
                true_targ,
                false_targ,
            } => {
                let true_name = blocks.get(*true_targ).unwrap().name.clone();
                println!("{false_targ}");
                let false_name = blocks.get(*false_targ).unwrap().name.clone();

                let true_count = self.lbl_map.get(&true_name).unwrap_or(&0);
                self.lbl_map.insert(true_name, true_count + 1);

                let false_count = self.lbl_map.get(&false_name).unwrap_or(&0);
                self.lbl_map.insert(false_name, false_count + 1);
            }
            crate::Edge::None => (),
        })
    }
}
