class Filessh < Formula
  desc "Fast and convenient TUI file browser for remote servers"
  homepage "https://github.com/JayanAXHF/filessh"
  url "https://github.com/JayanAXHF/filessh/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "3e26169f9968edd5005d7f2df9f7c4cf14b08c225d6766d9a51f3b6f73d42ca4"
  license any_of: ["Unlicense", "MIT"]

  depends_on "rust" => :build

  def install
    ENV["VERGEN_IDEMPOTENT"] = "1"
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/filessh --version")
  end
end
