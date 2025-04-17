use lesson4::{run, Opts};

fn main() {
    let opts: Opts = argh::from_env();
    run(opts);
}
