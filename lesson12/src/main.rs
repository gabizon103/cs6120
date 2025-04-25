pub mod trace;
use std::path::PathBuf;

use argh::{FromArgValue, FromArgs};
use lesson2::{CFGProgram, ControlFlow, FlatProgram};
use trace::{SpecOpt, form_traces};
use utils::{cfg::form_blocks_from_read, cli::read_input};

/// tracing
#[derive(FromArgs)]
pub struct Opts {
    /// input trace
    #[argh(positional)]
    pub input_trace: Option<PathBuf>,
    /// input program
    #[argh(option, short = 'p')]
    pub input_program: Option<PathBuf>,
}

fn main() {
    let opts: Opts = argh::from_env();
    let input_trace = opts.input_trace;
    let input_program = opts.input_program;

    let input_trace = read_input(input_trace);
    let trace = form_traces(input_trace);

    let input_program = read_input(input_program);
    let (all_blocks, _) = form_blocks_from_read(input_program);

    let cfgs: Vec<ControlFlow> = all_blocks
        .into_iter()
        .map(|(name, blocks, map, args, ret_type)| {
            let mut cfg = ControlFlow::new(name, blocks, map, args, ret_type);
            cfg.build();
            cfg.add_rets();
            cfg
        })
        .collect();

    let mut spec = SpecOpt::new("quit_trace".to_string());
    spec.trace = trace;
    spec.program = cfgs;

    let stitch_pt = spec.find_stitch_pt(&spec.trace);
    // println!("{:#?}", &spec.trace.instrs);
    // println!("{:#?}", stitch_pt);

    spec.prune_trace();
    let mut spec_trace = spec.speculate_trace();
    spec.trace = spec_trace;

    spec.split_end_trace(stitch_pt);
    spec.add_trace_to_main();

    let program = CFGProgram {
        functions: spec.program,
    };

    let program_flat = program.flatten_blocks();

    let flat_program = FlatProgram {
        functions: program_flat,
    };
    let program_str = serde_json::to_string(&flat_program).unwrap();
    println!("{program_str}");
}
