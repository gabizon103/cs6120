pub mod trace;
use std::path::PathBuf;

use trace::form_traces;
use utils::{cfg::form_blocks_from_read, cli::read_input, };
use argh::FromArgs;

/// tracing
#[derive(FromArgs)]
pub struct Opts {
    /// input trace
    #[argh(positional)]
    pub input: Option<PathBuf>,
}

fn main() {
    let opts: Opts = argh::from_env();
    let input = opts.input;
    let input = read_input(input);
    let traces = form_traces(input);
    traces.iter().for_each(|trace| {
        println!("{:?}", trace.instrs)
    });
    
}
