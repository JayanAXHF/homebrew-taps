class Gitv < Formula
  desc "Terminal-based GitHub client built with Rust and Ratatui"
  homepage "https://github.com/JayanAXHF/gitv"
  url "https://github.com"
  version "0.4.2"
  sha256 "d1f0c826e56c8595ecfc6e7c8be8461ea9a9cced3ad1b0abd61ae60a565a0398"
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
