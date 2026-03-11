class JiraTerminal < Formula
  desc "This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
  homepage "https://github.com/amritghimire/jira-terminal"
  version "2.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.5.0/jira-terminal-aarch64-apple-darwin.tar.gz"
      sha256 "e668befa66c708969b90ca78564d5e5f12c97f15468c2a7750fd739efcf7dee7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.5.0/jira-terminal-x86_64-apple-darwin.tar.gz"
      sha256 "df31287ff9d69392dfd341edd5ee23d1e4b983f9d9315bd79415608172b80f51"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.5.0/jira-terminal-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b27df1107750247d922ba1a3103d655b3a8741690be79afc50d92b14963685cc"
  end
  license "AGPL-3.0-only"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "jira-terminal" if OS.mac? && Hardware::CPU.arm?
    bin.install "jira-terminal" if OS.mac? && Hardware::CPU.intel?
    bin.install "jira-terminal" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
