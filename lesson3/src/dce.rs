use std::collections::HashSet;

use lesson2::{BasicBlock, ControlFlow};

pub struct DeadCodeElim {
    pub cfg: ControlFlow,
}

impl DeadCodeElim {
    pub fn new() -> Self {
        Self {
            cfg: ControlFlow::default(),
        }
    }

    /// Returns a set of the variables used in this block
    fn get_vars(&self, block: &BasicBlock) -> HashSet<String> {
        let mut vars = HashSet::new();
        block.instrs.iter().for_each(|instr| match instr {
            bril_rs::Instruction::Constant { .. } => (),
            bril_rs::Instruction::Value { args, .. } => {
                args.iter().for_each(|arg| {
                    vars.insert(arg.clone());
                });
            }
            _ => (),
        });
        vars
    }

    /// Returns a new basic block and a flag indicating if we've removed anything, having done one iteration of dce
    fn do_block(&mut self, block: &BasicBlock) -> (BasicBlock, bool) {
        let mut used = self.get_vars(&block);
        let mut to_remove: HashSet<usize> = HashSet::new();
        block
            .instrs
            .iter()
            .enumerate()
            .rev()
            .for_each(|(idx, instr)| match instr {
                bril_rs::Instruction::Constant { dest, .. } => {
                    if used.contains(dest) {
                        used.remove(dest);
                    } else {
                        to_remove.insert(idx);
                    }
                }
                bril_rs::Instruction::Value { dest, args, .. } => {
                    if used.contains(dest) {
                        used.remove(dest);
                        args.iter().for_each(|arg| {
                            used.insert(arg.to_string());
                        })
                    } else {
                        to_remove.insert(idx);
                    }
                }
                bril_rs::Instruction::Effect { args, .. } => args.iter().for_each(|arg| {
                    used.insert(arg.to_string());
                }),
            });
        let mut new_block = BasicBlock::default();
        new_block.name = block.name.clone();
        for idx in &to_remove {
            println!("{idx}")
        }
        block.instrs.iter().enumerate().for_each(|(idx, instr)| {
            if !to_remove.contains(&idx) {
                new_block.instrs.push(instr.clone());
            }
        });
        (new_block, !to_remove.is_empty())
    }

    /// Perform dce to fixed point
    fn do_block_iter(&mut self, block: &BasicBlock) -> BasicBlock {
        let (mut block_dce, mut cont) = self.do_block(block);
        while cont {
            (block_dce, cont) = self.do_block(&block_dce);
        }
        block_dce
    }

    pub fn do_pass(&mut self, cfg: &ControlFlow) {
        let ControlFlow {
            name,
            blocks,
            edges,
            lbl_to_block,
        } = cfg;

        let blocks: Vec<BasicBlock> = blocks
            .iter()
            .map(|block| self.do_block_iter(block))
            .collect();
        self.cfg.blocks = blocks;
        self.cfg.edges = edges.to_vec();
        self.cfg.name = name.clone();
        self.cfg.lbl_to_block = lbl_to_block.clone();
    }
}
