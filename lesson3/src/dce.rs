use std::collections::{HashMap, HashSet};

use bril_rs::{Argument, Instruction};
use lesson2::{BasicBlock, ControlFlow};

fn get_args(instr: &Instruction) -> Vec<String> {
    match instr {
        Instruction::Constant {
            dest,
            op,
            pos,
            const_type,
            value,
        } => vec![],
        Instruction::Value {
            args,
            dest,
            funcs,
            labels,
            op,
            pos,
            op_type,
        } => args.to_vec(),
        Instruction::Effect {
            args,
            funcs,
            labels,
            op,
            pos,
        } => args.to_vec(),
    }
}

fn get_dest(instr: &Instruction) -> Option<String> {
    match instr {
        Instruction::Constant {
            dest,
            op,
            pos,
            const_type,
            value,
        } => Some(dest.to_string()),
        Instruction::Value {
            args,
            dest,
            funcs,
            labels,
            op,
            pos,
            op_type,
        } => Some(dest.to_string()),
        Instruction::Effect {
            args,
            funcs,
            labels,
            op,
            pos,
        } => None,
    }
}

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
    fn get_vars_used(&self, block: &BasicBlock) -> HashSet<String> {
        let mut vars = HashSet::new();
        block.instrs.iter().for_each(|instr| match instr {
            bril_rs::Instruction::Constant { .. } => (),
            bril_rs::Instruction::Value { args, .. } => {
                args.iter().for_each(|arg| {
                    vars.insert(arg.clone());
                });
            }
            bril_rs::Instruction::Effect { args, .. } => args.iter().for_each(|arg| {
                vars.insert(arg.clone());
            }),
        });
        vars
    }

    fn get_vars_defd(&self, block: &BasicBlock) -> HashSet<String> {
        let mut vars = HashSet::new();
        block.instrs.iter().for_each(|instr| match instr {
            bril_rs::Instruction::Constant { dest, .. } => {
                vars.insert(dest.clone());
            }
            bril_rs::Instruction::Value { dest, .. } => {
                vars.insert(dest.clone());
            }
            _ => (),
        });
        vars
    }

    fn remove_unused(&mut self, func: &ControlFlow) -> (ControlFlow, bool) {
        let mut used: HashSet<String> = HashSet::new();
        let mut to_remove: HashSet<(usize, usize)> = HashSet::new();
        func.blocks.iter().for_each(|block| {
            block.instrs.iter().for_each(|instr| {
                get_args(instr).iter().for_each(|arg| {
                    used.insert(arg.to_string());
                });
            });
        });

        func.blocks
            .iter()
            .enumerate()
            .for_each(|(block_idx, block)| {
                block
                    .instrs
                    .iter()
                    .enumerate()
                    .for_each(|(instr_idx, instr)| {
                        if let Some(dest) = get_dest(instr) {
                            if !used.contains(&dest) {
                                to_remove.insert((block_idx, instr_idx));
                            }
                        }
                    })
            });

        let mut last_def: HashMap<String, (usize, usize)> = HashMap::new();
        func.blocks
            .iter()
            .enumerate()
            .for_each(|(block_idx, block)| {
                block
                    .instrs
                    .iter()
                    .enumerate()
                    .for_each(|(instr_idx, instr)| {
                        get_args(instr).iter().for_each(|arg| {
                            last_def.remove(arg);
                        });
                        if let Some(dest) = get_dest(instr) {
                            if let Some((b, i)) = last_def.get(&dest) {
                                to_remove.insert((*b, *i));
                                last_def.insert(dest, (block_idx, instr_idx));
                            }
                        }
                    });
            });

        let mut blocks: Vec<BasicBlock> = Vec::default();
        func.blocks
            .iter()
            .enumerate()
            .for_each(|(block_idx, block)| {
                let mut new_block = BasicBlock::default();
                new_block.name = block.name.clone();
                block
                    .instrs
                    .iter()
                    .enumerate()
                    .for_each(|(instr_idx, instr)| {
                        if !to_remove.contains(&(block_idx, instr_idx)) {
                            new_block.instrs.push(instr.clone());
                        }
                    });
                blocks.push(new_block);
            });

        (
            ControlFlow {
                name: func.name.clone(),
                blocks,
                edges: func.edges.clone(),
                lbl_to_block: func.lbl_to_block.clone(),
                args: func.args.clone(),
            },
            !to_remove.is_empty(),
        )
    }

    /// Perform dce to fixed point
    fn remove_unused_iter(&mut self, func: &ControlFlow) -> ControlFlow {
        let (mut cfg_dce, mut cont) = self.remove_unused(func);
        while cont {
            (cfg_dce, cont) = self.remove_unused(&cfg_dce);
        }
        cfg_dce
    }

    pub fn do_pass(&mut self, cfg: &ControlFlow) {
        let ControlFlow {
            name,
            blocks,
            edges,
            lbl_to_block,
            args,
        } = cfg;

        self.cfg = self.remove_unused_iter(cfg)
    }
}
