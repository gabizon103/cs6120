mod dce;
mod lvn;
use std::{fs::File, path::PathBuf};

use argh::FromArgs;
use dce::DeadCodeElim;
use graphviz_rust::{
    cmd::{CommandArg, Format},
    dot_structures::{Graph, Id},
    exec,
    printer::{DotPrinter, PrinterContext},
};
use itertools::Itertools;
use lesson2::{form_blocks_from_read, CFGProgram, ControlFlow, FlatProgram};
use lvn::LocalValueNumbering;

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

fn main() {
    let opts: Opts = argh::from_env();
    let input = opts.input;
    let output = opts.output;
    let input = input.clone().map_or_else(
        || -> Box<dyn std::io::Read> { Box::new(std::io::stdin()) },
        |f| Box::new(File::open(f).unwrap()),
    );
    let (all_blocks, orig_program) = form_blocks_from_read(input);
    let cfgs = all_blocks
        .into_iter()
        .map(|(name, blocks, map, args)| {
            let mut cfg = ControlFlow::new(name, blocks, map, args);
            cfg.build();
            cfg
        })
        .map(|cfg| {
            let mut lvn = LocalValueNumbering::new();
            lvn.cfg.name = cfg.name.clone();
            let mut dce = DeadCodeElim::new();
            lvn.do_pass(&cfg);
            dce.do_pass(&lvn.cfg);
            let cfg = dce.cfg;
            cfg
        })
        .collect_vec();

    if let Some(p) = output {
        let mut graph = Graph::DiGraph {
            id: Id::Plain("G".to_string()),
            strict: true,
            stmts: vec![],
        };
        for (idx, cfg) in cfgs.iter().enumerate() {
            let subgraph = cfg.to_dot(idx);
            graph.add_stmt(subgraph.into());
        }
        println!("{}", graph.print(&mut PrinterContext::default()));
        let _ = exec(
            graph,
            &mut PrinterContext::default(),
            vec![
                Format::Png.into(),
                CommandArg::Output(p.to_str().unwrap().to_string()),
            ],
        )
        .unwrap();
    }

    let program = CFGProgram { functions: cfgs };
    let mut program_flat = program.flatten_blocks();
    program_flat.iter_mut().for_each(|func| {
        let name = &func.name;
        for orig_func in &orig_program.functions {
            if *name == orig_func.name {
                func.args = orig_func.args.clone();
                func.return_type = orig_func.return_type.clone();
            }
        }
    });

    let flat_program = FlatProgram {
        functions: program_flat,
    };
    let program_str = serde_json::to_string(&flat_program).unwrap();
    println!("{program_str}")
}
