use bril_rs::{Instruction, Program};
use serde_json::Error;
use serde::{Deserialize, Serialize};
use utils::cfg::is_branch;

#[derive(Serialize, Deserialize, Clone)]
pub struct Trace {
  pub instrs: Vec<Instruction>
}

impl Trace {
  pub fn new() -> Self {
    Self {
      instrs: vec![]
    }
  }
}

// starts the trace when it sees a branch, and adds the 9 instructions after it
pub fn form_traces<R: std::io::Read>(
  mut input: R,
) -> Vec<Trace> {
  println!("forming trace");
  let mut traces = vec![];

  let mut buf = String::new();
    input.read_to_string(&mut buf).unwrap();

  let trace: Trace =
    serde_json::from_str(&buf).expect("couldn't parse json into bril program");

  let mut cur_trace = Trace::new();
  trace.instrs.iter().for_each(|instr| {
    if is_branch(instr) {
      cur_trace = Trace::new();
      cur_trace.instrs.push(instr.clone());
    } else if cur_trace.instrs.len() == 9 {
      traces.push(cur_trace.clone());
    }
  });

  traces
}