use std::collections::HashSet;
use lesson2::ControlFlow;
use lesson4::framework::ReachingDefsGeneric;

pub struct ToSSA<'a> {
  pub cfg: &'a ControlFlow,
  pub reaching_defs: ReachingDefsGeneric,
}

impl<'a> ToSSA<'a> {
  pub fn gather_vars(&self) -> HashSet<String> {
    let mut vars = HashSet::new();
    self.cfg.blocks.iter().for_each(|block| {
      block.instrs.iter().for_each(|instr| {
        let dest = utils::cfg::get_dest(instr);
        if let Some(dest) = dest {
          vars.insert(dest);
        }
      });
    });

    vars
  }

  pub fn to_ssa(&self) -> ControlFlow {
    // make new cfg
    let mut new_cfg = ControlFlow::default();
    new_cfg.name = self.cfg.name.clone();
    new_cfg.edges = self.cfg.edges.clone();
    new_cfg.args = self.cfg.args.clone();

    let vars = self.gather_vars();
    vars.iter().for_each(|var| {

    });

    new_cfg
  }
} 