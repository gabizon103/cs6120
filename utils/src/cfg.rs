use std::collections::HashMap;

use bril_rs::{Argument, Code, EffectOps, Function, Instruction, Program, ValueOps};
use lesson2::BasicBlock;

pub fn form_blocks_from_read<R: std::io::Read>(
    mut input: R,
) -> (
    Vec<(
        String,
        Vec<BasicBlock>,
        HashMap<String, usize>,
        Vec<Argument>,
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
                (name, blocks, lbl_to_block, func.args)
            })
            .collect(),
        program,
    )
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

pub fn is_terminator_or_label(code: &Code) -> bool {
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

pub fn is_branch(code: &Instruction) -> bool {
    match code {
        Instruction::Constant { .. } => false,
        Instruction::Value { .. } => false,
        Instruction::Effect { op, ..} => match op {
            bril_rs::EffectOps::Jump => true,
            _ => false
        },
    }
}

pub fn is_ret(code: &Instruction) -> bool {
    match code {
        Instruction::Constant {..} => false,
        Instruction::Value { .. } => false,
        Instruction::Effect {op, ..} => *op == EffectOps::Return
    }
}

pub fn get_dest(instr: &Instruction) -> Option<String> {
    match instr {
        Instruction::Constant { dest, .. } => Some(dest.to_string()),
        Instruction::Value { dest, .. } => Some(dest.to_string()),
        Instruction::Effect { .. } => None,
    }
}

pub fn set_dest(instr: &mut Instruction, new_dest: String) {
    match instr {
        Instruction::Constant { dest, .. } => {
            *dest = new_dest;
        },
        Instruction::Value { dest, .. } => {
            *dest = new_dest;
        },
        _ => ()
    }
}

pub fn get_uses(instr: &Instruction) -> Vec<String> {
    match instr {
        Instruction::Constant { .. } => vec![],
        Instruction::Value { args, .. } => args.clone(),
        Instruction::Effect { args, .. } => args.clone(),
    }
}
