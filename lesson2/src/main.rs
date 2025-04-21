use argh::FromArgs;
use graphviz_rust::{
    cmd::{CommandArg, Format},
    dot_structures::{Graph, Id},
    exec,
    printer::{DotPrinter, PrinterContext},
};
use itertools::Itertools;
use lesson2::{form_blocks_from_read, stat::StatCounter, ControlFlow};
use std::{fs::File, path::PathBuf};

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
    let (all_blocks, _) = form_blocks_from_read(input);
    let cfgs = all_blocks
        .into_iter()
        .map(|(name, blocks, map, args, ret_type)| {
            let mut cfg = ControlFlow::new(name, blocks, map, args, ret_type);
            cfg.build();
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
    if opts.stats {
        cfgs.iter().for_each(|cfg| {
            let mut stat_counter = StatCounter::new();
            stat_counter.count_targets_edges(cfg);
            println!("func {}", cfg.name);
            stat_counter.lbl_map.iter().for_each(|(lbl, freq)| {
                println!("{}: {}", lbl, freq);
            });
            println!("");
        });
    }
}
