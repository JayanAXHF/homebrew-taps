class Gitv < Formula
  desc "Terminal-based GitHub client built with Rust and Ratatui"
  homepage "https://github.com/JayanAXHF/gitv"
  url "https://github.com/JayanAXHF/gitv/archive/refs/tags/gitv-tui-v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "a6b6869537c033392a860ba60ce2e2878c2b0f6b7f760f30e3c54a0e5d0ee862"
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
