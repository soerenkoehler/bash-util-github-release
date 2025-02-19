use clap::Parser;

#[derive(Parser)]
#[command(version, about, long_about)]
struct Cli {
    /// The artifacts that will be added to the release.
    files: Vec<String>
}

fn main() {
    Cli::parse();
}
