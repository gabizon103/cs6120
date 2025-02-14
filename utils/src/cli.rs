use std::{fs::File, io::Read, path::PathBuf};

use argh::FromArgs;

/// Build cfg from bril program
#[derive(FromArgs)]
pub struct Opts {
    /// input bril file
    #[argh(positional)]
    pub input: Option<PathBuf>,
    /// output directory for graphs
    #[argh(option, short = 'o')]
    pub output: Option<PathBuf>,
    /// count stats
    #[argh(switch, long = "stats")]
    pub stats: bool,
}

pub fn read_input(input: Option<PathBuf>) -> Box<dyn Read> {
    input.clone().map_or_else(
        || -> Box<dyn std::io::Read> { Box::new(std::io::stdin()) },
        |f| Box::new(File::open(f).unwrap()),
    )
}
