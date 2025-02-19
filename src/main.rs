use clap::Parser;

#[derive(Parser)]
#[command(version, about, long_about)]
struct Cli {}

fn main() {
    Cli::parse();
}
