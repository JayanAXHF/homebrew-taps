class Gitv < Formula
  desc "Terminal-based GitHub client built with Rust and Ratatui"
  homepage "https://github.com/JayanAXHF/gitv"
  url "https://github.com"
  version "0.3.2"
  sha256 "ff339439765f6b061f198f4c94070ffb7b255137fe7563deb0ff56e7e3272d03"
  license any_of: ["Unlicense", "MIT"]

  depends_on "rust" => :build

  def install
    ENV["VERGEN_IDEMPOTENT"] = "1"
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitv --version")
  end
end
