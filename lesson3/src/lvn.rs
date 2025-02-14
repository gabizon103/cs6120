use std::{collections::HashMap, hash::Hash};

use bril_rs::{ConstOps, EffectOps, Instruction, Type, ValueOps};
use lesson2::{BasicBlock, ControlFlow};
use ordered_float::OrderedFloat;

#[derive(Hash, Eq, PartialEq, Debug, Clone)]
pub enum Ops {
    ValueOps(ValueOps),
    EffectOps(EffectOps),
}

impl From<ValueOps> for Ops {
    fn from(value: ValueOps) -> Self {
        Ops::ValueOps(value)
    }
}

impl From<EffectOps> for Ops {
    fn from(value: EffectOps) -> Self {
        Ops::EffectOps(value)
    }
}

#[derive(PartialEq, Hash, Eq, Debug, Clone)]
pub enum Literal {
    Int(i64),
    Bool(bool),
    Float(OrderedFloat<f64>),
    Char(char),
}

impl From<bril_rs::Literal> for Literal {
    fn from(value: bril_rs::Literal) -> Self {
        match value {
            bril_rs::Literal::Int(n) => Self::Int(n),
            bril_rs::Literal::Bool(b) => Self::Bool(b),
            bril_rs::Literal::Float(f) => Self::Float(OrderedFloat(f)),
            bril_rs::Literal::Char(c) => Self::Char(c),
        }
    }
}

#[derive(Hash, PartialEq, Eq, Debug, Clone)]
pub enum Value {
    Const(ConstOps, Literal, Type),
    Expr(Ops, Vec<usize>),
    Argument(String),
    Call(Vec<String>, Vec<usize>),
}

pub struct LocalValueNumbering {
    pub cfg: ControlFlow,
    pub table: HashMap<Value, (usize, String)>,
    pub var2num: HashMap<String, usize>,
    pub src2rename: HashMap<String, String>,
    pub val_idx: usize,
    pub name_idx: usize,
    pub args: Vec<String>,
}

impl LocalValueNumbering {
    pub fn new() -> Self {
        Self {
            cfg: ControlFlow::default(),
            table: HashMap::default(),
            var2num: HashMap::default(),
            src2rename: HashMap::default(),
            val_idx: 0,
            name_idx: 0,
            args: vec![],
        }
    }

    fn gen_name(&mut self) -> String {
        let idx = self.name_idx;
        self.name_idx += 1;
        format!("tmp_{idx}")
    }

    fn rebuild_instr_name(
        &self,
        instr: &Instruction,
        dest_name: String,
        val_name: String,
        typ: Type,
    ) -> Instruction {
        match instr {
            Instruction::Constant { .. } => Instruction::Value {
                args: vec![val_name],
                dest: dest_name,
                funcs: vec![],
                labels: vec![],
                op: ValueOps::Id,
                pos: None,
                op_type: typ,
            },
            Instruction::Value {
                args,
                dest,
                funcs,
                labels,
                op,
                pos,
                op_type,
            } => Instruction::Value {
                args: vec![val_name],
                dest: dest_name,
                funcs: funcs.clone(),
                labels: labels.clone(),
                op: ValueOps::Id,
                pos: pos.clone(),
                op_type: op_type.clone(),
            },
            Instruction::Effect { .. } => todo!(),
        }
    }

    fn rebuild_instr_name_args(
        &self,
        instr: &Instruction,
        name: String,
        args: Vec<String>,
    ) -> Instruction {
        match instr {
            Instruction::Constant {
                dest,
                op,
                pos,
                const_type,
                value,
            } => Instruction::Constant {
                dest: name,
                op: op.clone(),
                pos: pos.clone(),
                const_type: const_type.clone(),
                value: value.clone(),
            },
            Instruction::Value {
                dest,
                funcs,
                labels,
                op,
                pos,
                op_type,
                ..
            } => Instruction::Value {
                args,
                dest: name,
                funcs: funcs.clone(),
                labels: labels.clone(),
                op: op.clone(),
                pos: pos.clone(),
                op_type: op_type.clone(),
            },
            Instruction::Effect {
                funcs,
                labels,
                op,
                pos,
                ..
            } => {
                let new_instr = Instruction::Effect {
                    args,
                    funcs: funcs.clone(),
                    labels: labels.clone(),
                    op: op.clone(),
                    pos: pos.clone(),
                };
                new_instr
            }
        }
    }

    fn rebuild_instr_args(&self, instr: &Instruction, args: Vec<String>) -> Instruction {
        match instr {
            Instruction::Constant { .. } => instr.clone(),
            Instruction::Value {
                dest,
                funcs,
                labels,
                op,
                pos,
                op_type,
                ..
            } => Instruction::Value {
                args,
                dest: dest.clone(),
                funcs: funcs.clone(),
                labels: labels.clone(),
                op: op.clone(),
                pos: pos.clone(),
                op_type: op_type.clone(),
            },
            Instruction::Effect {
                funcs,
                labels,
                op,
                pos,
                ..
            } => Instruction::Effect {
                args,
                funcs: funcs.clone(),
                labels: labels.clone(),
                op: op.clone(),
                pos: pos.clone(),
            },
        }
    }

    fn get_dest_typ(instr: &Instruction) -> Option<(&String, &Type)> {
        match instr {
            Instruction::Constant {
                dest, const_type, ..
            } => Some((dest, const_type)),
            Instruction::Value { dest, op_type, .. } => Some((dest, op_type)),
            Instruction::Effect { .. } => None,
        }
    }

    fn get_args(instr: &Instruction) -> Vec<String> {
        match instr {
            Instruction::Constant { .. } => vec![],
            Instruction::Value { args, .. } => args.to_vec(),
            Instruction::Effect { args, .. } => args.to_vec(),
        }
    }

    fn add_table(&mut self, idx: usize, val: Value, var: String) {
        self.table.insert(val, (idx, var));
    }

    fn add_var2num(&mut self, name: String, last_idx: usize) {
        self.var2num.insert(name, last_idx);
    }

    fn get_var_from_num(&self, num: usize) -> String {
        self.table
            .iter()
            .find_map(
                |(val, (idx, var))| {
                    if *idx == num {
                        Some(var)
                    } else {
                        None
                    }
                },
            )
            .unwrap()
            .to_string()
    }

    // returns true if dest will be written later in the block
    fn will_be_written_later(&self, instr_idx: usize, dest: String, block: &BasicBlock) -> bool {
        let (_, tail) = block.instrs.split_at(instr_idx + 1);
        !tail
            .iter()
            .filter(|instr| match instr {
                Instruction::Constant { dest: i_dest, .. } => *i_dest == dest,
                Instruction::Value { dest: i_dest, .. } => *i_dest == dest,
                Instruction::Effect { .. } => false,
            })
            .collect::<Vec<_>>()
            .is_empty()
    }

    fn is_free(&self, val: &Value) -> bool {
        match val {
            Value::Const(const_ops, literal, _) => false,
            Value::Expr(ops, items) => match ops {
                Ops::ValueOps(value_ops) => false,
                Ops::EffectOps(effect_ops) => matches!(effect_ops, EffectOps::Free),
            },
            Value::Argument(_) => false,
            Value::Call(items, items1) => false,
        }
    }

    fn is_alloc(&self, val: &Value) -> bool {
        match val {
            Value::Const(const_ops, literal, _) => false,
            Value::Expr(ops, items) => match ops {
                Ops::ValueOps(value_ops) => matches!(value_ops, ValueOps::Alloc),
                Ops::EffectOps(effect_ops) => false,
            },
            Value::Argument(_) => false,
            Value::Call(items, items1) => false,
        }
    }

    fn canonicalize(&self, val: &mut Value) {
        match val {
            Value::Const(const_ops, literal, _) => (),
            Value::Expr(ops, items) => {
                items.sort();
            }
            Value::Argument(_) => (),
            Value::Call(items, items1) => (),
        }
    }

    pub fn do_block(&mut self, block: &BasicBlock) -> BasicBlock {
        let instrs = block
            .instrs
            .iter()
            .enumerate()
            .map(|(instr_idx, instr)| {
                Self::get_args(instr).iter().for_each(|arg| {
                    let arg = if self.src2rename.contains_key(arg) {
                        self.src2rename.get(arg).unwrap()
                    } else {
                        arg
                    };
                    if !self.var2num.contains_key(arg) {
                        let arg_dest = if self.will_be_written_later(instr_idx, arg.clone(), block)
                        {
                            arg.clone()
                        } else {
                            arg.clone()
                        };
                        let idx = self.val_idx;
                        self.add_table(idx, Value::Argument(arg_dest.clone()), arg_dest.clone());
                        self.var2num.insert(arg_dest, idx);
                        self.val_idx += 1;
                    }
                });
                let mut value = match instr {
                    Instruction::Constant {
                        value, const_type, ..
                    } => Value::Const(ConstOps::Const, value.clone().into(), const_type.clone()),
                    Instruction::Value {
                        op, args, funcs, ..
                    } => {
                        let args = args.iter().map(|arg| {
                            let rename = self.src2rename.get(arg).unwrap_or(arg);
                            self.var2num.get(rename).unwrap().clone()
                            // arg.clone()
                        });
                        match op {
                            ValueOps::Call => Value::Call(funcs.to_vec(), args.collect()),
                            _ => Value::Expr(op.clone().into(), args.collect()),
                        }
                    }
                    Instruction::Effect {
                        op, args, funcs, ..
                    } => {
                        let args = args.iter().map(|arg| {
                            let rename = self.src2rename.get(arg).unwrap_or(arg);
                            self.var2num.get(rename).unwrap().clone()
                            // arg.clone()
                        });
                        match op {
                            EffectOps::Call => Value::Call(funcs.to_vec(), args.collect()),
                            _ => Value::Expr(op.clone().into(), args.collect()),
                        }
                    }
                };

                self.canonicalize(&mut value);

                // println!("value for {instr} is {:#?}", value);

                let dest = self.gen_name();
                let res = self.table.get(&value);
                let instr = if let Some((idx, var)) = res {
                    // value was in the table, use id op on that unless call or free
                    if matches!(value, Value::Call(_, _))
                        || self.is_free(&value)
                        || self.is_alloc(&value)
                    {
                        // println!("found call in table for {instr} with value {:#?}", value);
                        self.rebuild_instr_args(instr, Self::get_args(instr))
                    } else {
                        // println!("found {:#?} in table", value);
                        let (old_dest, old_type) = Self::get_dest_typ(instr).unwrap();
                        self.var2num.insert(old_dest.clone(), *idx);

                        let val_name = var;
                        self.rebuild_instr_name(
                            instr,
                            old_dest.clone(),
                            val_name.to_string(),
                            old_type.clone(),
                        )
                    }
                } else if let Some((old_dest, old_type)) = Self::get_dest_typ(instr) {
                    // instr has a dest
                    Self::get_args(instr).iter().for_each(|arg| {
                        if !self.var2num.contains_key(arg) {
                            let arg_dest =
                                if self.will_be_written_later(instr_idx, arg.clone(), block) {
                                    arg.clone()
                                } else {
                                    arg.clone()
                                };
                            let idx = self.val_idx;
                            self.add_table(
                                idx,
                                Value::Argument(arg_dest.clone()),
                                arg_dest.clone(),
                            );
                            self.var2num.insert(arg_dest, idx);
                            self.val_idx += 1;
                        }
                    });
                    let new_args = Self::get_args(instr)
                        .iter()
                        .map(|arg| {
                            let rename = self.src2rename.get(arg).unwrap_or(arg);
                            let name = self.var2num.get(rename).unwrap().clone();
                            name.clone()
                        })
                        .map(|num| self.get_var_from_num(num))
                        .collect();

                    let dest = if self.will_be_written_later(instr_idx, old_dest.clone(), block) {
                        dest
                    } else {
                        old_dest.clone()
                    };
                    let idx = self.val_idx;
                    self.add_table(idx, value.clone(), dest.clone());
                    self.var2num.insert(dest.clone(), idx);
                    self.src2rename.insert(old_dest.clone(), dest.clone());
                    self.val_idx += 1;

                    self.rebuild_instr_name_args(instr, dest, new_args)
                } else {
                    // instr has no dest
                    Self::get_args(instr).iter().for_each(|arg| {
                        if !self.var2num.contains_key(arg) {
                            let arg_dest = arg.clone();
                            let idx = self.val_idx;
                            self.add_table(
                                idx,
                                Value::Argument(arg_dest.clone()),
                                arg_dest.clone(),
                            );
                            self.var2num.insert(arg_dest, idx);
                            self.val_idx += 1;
                        }
                    });
                    let new_args = Self::get_args(instr)
                        .iter()
                        .map(|arg| {
                            let rename = self.src2rename.get(arg).unwrap_or(arg);
                            let name = self.var2num.get(rename).unwrap().clone();
                            name.clone()
                        })
                        .map(|num| self.get_var_from_num(num))
                        .collect();
                    self.rebuild_instr_args(instr, new_args)
                };

                instr
            })
            .collect();

        BasicBlock {
            name: block.name.clone(),
            instrs,
        }
    }

    fn before_pass(&mut self) {
        let args = self.args.clone();
        args.iter().for_each(|arg| {
            let idx = self.val_idx;
            self.add_table(idx, Value::Argument(arg.clone()), arg.clone());
            self.add_var2num(arg.clone(), idx);
            self.val_idx += 1;
        });
    }

    fn clear(&mut self) {
        self.table.clear();
        self.var2num.clear();
        self.val_idx = 0;
    }

    pub fn do_pass(&mut self, cfg: &ControlFlow) {
        let ControlFlow {
            name,
            blocks,
            edges,
            lbl_to_block,
            args,
        } = cfg;
        self.args = args.iter().map(|arg| arg.name.clone()).collect();
        self.before_pass();

        let blocks = blocks
            .iter()
            .map(|block| {
                self.clear();
                self.before_pass();
                self.do_block(block)
            })
            .collect();
        self.cfg.blocks = blocks;
        self.cfg.name = name.clone();
        self.cfg.edges = edges.clone();
        self.cfg.lbl_to_block = lbl_to_block.clone();
    }
}
