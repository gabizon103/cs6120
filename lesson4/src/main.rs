use std::{
    collections::{HashMap, HashSet},
    path::PathBuf,
    str::FromStr,
};

use argh::FromArgs;
use framework::{AnalysisFramework, LiveVars, ReachingDefsGeneric};
use itertools::Itertools;
use lesson2::ControlFlow;
use reaching_defs::ReachingDefs;
use utils::{cfg::form_blocks_from_read, cli::read_input};

pub mod framework;
pub mod reaching_defs;

/// dataflow analysis
#[derive(FromArgs)]
pub struct Opts {
    /// input bril file
    #[argh(positional)]
    pub input: Option<PathBuf>,
    /// output directory for graphs
    #[argh(option, short = 'o')]
    pub output: Option<PathBuf>,
    /// count stats
    #[argh(option, long = "analysis")]
    pub analysis: Analysis,
}

pub enum Analysis {
    ReachingDefs,
    LiveVars,
}

impl FromStr for Analysis {
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "reaching-defs" => Ok(Self::ReachingDefs),
            "live-vars" => Ok(Self::LiveVars),
            _ => Err(format!("unknown pass")),
        }
    }
}

fn main() {
    let opts: Opts = argh::from_env();
    let input = opts.input;
    let output = opts.output;
    let analysis = opts.analysis;
    let input = read_input(input);

    let (all_blocks, _) = form_blocks_from_read(input);
    let cfgs: Vec<ControlFlow> = all_blocks
        .into_iter()
        .map(|(name, blocks, map, args)| {
            let mut cfg = ControlFlow::new(name, blocks, map, args);
            cfg.build();
            cfg
        })
        .collect();

    cfgs.into_iter().for_each(|cfg| {
        let name = cfg.name.clone();
        match analysis {
            Analysis::ReachingDefs => {
                let mut framework: AnalysisFramework<HashMap<String, HashSet<(usize, usize)>>> =
                    AnalysisFramework::new(cfg, HashMap::new());
                let rd = ReachingDefsGeneric::new();
                framework.worklist(rd);
                // let mut rd = ReachingDefs::new(cfg);
                // rd.worklist();
                println!("INS {}", name);
                framework.ins.iter().enumerate().for_each(|(idx, map)| {
                    let name = &framework.cfg.blocks.get(idx).unwrap().name;
                    println!("block{idx} ({name}):");
                    map.iter().for_each(|(var, set)| {
                        let set = set
                            .iter()
                            .map(|(blk_idx, instr_idx)| {
                                if (*blk_idx, *instr_idx) == (usize::MAX, usize::MAX) {
                                    format!("  function args")
                                } else {
                                    let instr = framework
                                        .cfg
                                        .blocks
                                        .get(*blk_idx)
                                        .unwrap()
                                        .instrs
                                        .get(*instr_idx)
                                        .unwrap();
                                    format!("  {instr}")
                                }
                            })
                            .collect_vec()
                            .join("\n");
                        println!("var {var} defined by:\n{set}");
                    });
                    println!("");
                });

                println!("OUTS {name}");
                framework.outs.iter().enumerate().for_each(|(idx, map)| {
                    let name = &framework.cfg.blocks.get(idx).unwrap().name;
                    println!("block{idx} ({name}):");
                    map.iter().for_each(|(var, set)| {
                        let set = set
                            .iter()
                            .map(|(blk_idx, instr_idx)| {
                                if (*blk_idx, *instr_idx) == (usize::MAX, usize::MAX) {
                                    format!("  function args")
                                } else {
                                    let instr = framework
                                        .cfg
                                        .blocks
                                        .get(*blk_idx)
                                        .unwrap()
                                        .instrs
                                        .get(*instr_idx)
                                        .unwrap();
                                    format!("  {instr}")
                                }
                            })
                            .collect_vec()
                            .join("\n");
                        println!("var {var} defined by:\n{set}");
                    });
                    println!("");
                });
            }
            Analysis::LiveVars => {
                let mut framework: AnalysisFramework<HashSet<String>> =
                    AnalysisFramework::new(cfg, HashSet::new());
                let lv = LiveVars::new();
                framework.worklist(lv);
                println!("INS {name}");
                framework.ins.iter().enumerate().for_each(|(idx, set)| {
                    let name = &framework.cfg.blocks.get(idx).unwrap().name;
                    println!("block{idx} ({name}):");
                    set.iter().for_each(|set_elt| {
                        println!("{set_elt}");
                    });
                    println!("");
                });
                println!("OUTS {name}");
                framework.outs.iter().enumerate().for_each(|(idx, set)| {
                    let name = &framework.cfg.blocks.get(idx).unwrap().name;
                    println!("block{idx} ({name}):");
                    set.iter().for_each(|set_elt| {
                        println!("{set_elt}");
                    });
                    println!("");
                });
            }
        }
    });
}
