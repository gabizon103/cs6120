pub mod dominator;
use std::path::PathBuf;

use argh::FromArgs;
use dominator::DomBuilder;
use graphviz_rust::{
    cmd::{CommandArg, Format},
    dot_structures::{Graph, Id},
    exec,
    printer::PrinterContext,
};
use lesson2::ControlFlow;
use utils::{cfg::form_blocks_from_read, cli::read_input};

/// dominator tree
#[derive(FromArgs)]
pub struct Opts {
    /// input bril file
    #[argh(positional)]
    pub input: Option<PathBuf>,
    /// output directory for graphs
    #[argh(option, short = 'o')]
    pub output: Option<PathBuf>,
    /// check for correctness
    #[argh(switch, short = 'c', long = "check")]
    pub check: bool,
    /// display frontier
    #[argh(switch, short = 'f', long = "frontier")]
    pub frontier: bool
}

fn main() {
    let opts: Opts = argh::from_env();
    let input = opts.input;
    let output = opts.output;
    // let check = opts.check;
    let input = read_input(input);

    let (all_blocks, _) = form_blocks_from_read(input);
    let cfgs: Vec<ControlFlow> = all_blocks
        .into_iter()
        .map(|(name, blocks, map, args, ret_type)| {
            let mut cfg = ControlFlow::new(name, blocks, map, args, ret_type);
            cfg.build();
            cfg
        })
        .collect();
    let doms: Vec<DomBuilder> = cfgs
        .iter()
        .map(|cfg| {
            let mut db = DomBuilder::new(cfg);
            if opts.check {
                db.compare_all();
            }
            db.build();
            if opts.frontier {
                db.print_frontier();
            }
            db
        })
        .collect();

    if let Some(p) = output {
        let mut graph = Graph::DiGraph {
            id: Id::Plain("G".to_string()),
            strict: true,
            stmts: vec![],
        };
        doms.iter().enumerate().for_each(|(idx, db)| {
            let sg = db.to_dot(idx);
            graph.add_stmt(sg.into());
        });
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
}
