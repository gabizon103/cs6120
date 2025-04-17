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
use struct_variant::struct_variant;
use utils::{cfg::form_blocks_from_read, cli::read_input};

mod framework;
mod reaching_defs;

#[macro_export]
/// Logs the amount of time it took to run the expression.
macro_rules! log_time {
    ($e:expr) => {{
        let (r, t) = $crate::time!($e);
        log::info!("{}: {}ms", stringify!($e), t.as_millis());
        r
    }};
    // Variant to log the time with a custom message.
    ($e:expr, $msg:expr) => {{
        let (r, t) = $crate::time!($e);
        log::info!("{}: {}ms", $msg, t.as_millis());
        r
    }};
    // Variant to log the time with a custom message only when a bound is reached
    ($e:expr, $msg:expr; $min_time:expr) => {{
        let (r, t) = $crate::time!($e);
        if t.as_millis() > $min_time {
            log::info!("{}: {}ms", $msg, t.as_millis());
        }
        r
    }};
}

#[macro_export]
/// Return the result of the computation and the time it took to run it.
macro_rules! time {
    ($e:expr) => {{
        let t = std::time::Instant::now();
        let r = $e;
        (r, t.elapsed())
    }};
}

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
    /// suppress output
    #[argh(switch, short = 's')]
    pub supress_output: bool,
    /// set log level
    #[argh(option, long = "log", default = "log::LevelFilter::Warn")]
    pub log_level: log::LevelFilter,
}

#[struct_variant]
pub enum Analysis {
    ReachingDefsGeneric,
    LiveVars,
}

impl FromStr for Analysis {
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "reaching-defs" => Ok(Analysis::ReachingDefsGeneric(ReachingDefsGeneric::new())),
            "live-vars" => Ok(Analysis::LiveVars(LiveVars::new())),
            _ => Err(format!("unknown pass")),
        }
    }
}

fn run(opts: Opts) {
    let input = opts.input;
    let analysis = &opts.analysis;
    let input = read_input(input);
    let suppress_output = opts.supress_output;

    env_logger::Builder::from_default_env()
        .format_timestamp(None)
        .format_module_path(false)
        .format_target(false)
        .filter_level(log::LevelFilter::Info)
        .target(env_logger::Target::Stderr)
        .init();

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
        match analysis {
            Analysis::ReachingDefsGeneric(rd) => {
                let mut framework: AnalysisFramework<HashMap<String, HashSet<(usize, usize)>>> =
                    AnalysisFramework::new(cfg, HashMap::new());

                // this is the real computation
                log_time!(framework.worklist(rd), "reaching-defs");

                if !suppress_output {
                    println!("{:#?}", framework);
                }
            }
            Analysis::LiveVars(lv) => {
                let mut framework: AnalysisFramework<HashSet<String>> =
                    AnalysisFramework::new(cfg, HashSet::new());

                log_time!(framework.worklist(lv), "live-vars");

                if !suppress_output {
                    println!("{:#?}", framework);
                }
            }
        }
    });
}

fn main() {
    let opts: Opts = argh::from_env();
    run(opts);
}
