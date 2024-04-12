class JiraTerminal < Formula
  desc "This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
  homepage "https://github.com/amritghimire/jira-terminal"
  version "2.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.3.0/jira-terminal-aarch64-apple-darwin.tar.xz"
      sha256 "7568feff92b05e29b7eca824b573e2a241817cd59a90db38ab685c97d7160691"
    end
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.3.0/jira-terminal-x86_64-apple-darwin.tar.xz"
      sha256 "bb37b2d3579d95a7f81d1211d45b3f1cb7ca9fedd8e7e9ee1d933544e7c8d41a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.3.0/jira-terminal-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "97846d4657cb012fac1c34ced276fe39b6a0fa100fc0d50d83085175c066b87a"
    end
  end
  license "AGPL-3.0-only"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "jira-terminal"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "jira-terminal"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "jira-terminal"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
