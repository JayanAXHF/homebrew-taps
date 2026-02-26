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

    man1.install "man/filessh.1"
    man5.install "man/filessh.5"

    completion_home = buildpath/"completion-home"
    ENV["HOME"] = completion_home

    system bin/"filessh", "install-completions", "bash"
    bash_completion.install completion_candidate(completion_home, "filessh")

    system bin/"filessh", "install-completions", "fish"
    fish_completion.install completion_candidate(completion_home, "filessh.fish")
  end

  def completion_candidate(completion_home, file)
    mac_path = completion_home/"Library/Application Support"
    linux_path = completion_home/".local/share"

    [
      mac_path/"bash-completion/completions"/file,
      mac_path/"fish/vendor_completions.d"/file,
      linux_path/"bash-completion/completions"/file,
      linux_path/"fish/vendor_completions.d"/file,
    ].find(&:exist?)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/filessh --version")
  end
end
