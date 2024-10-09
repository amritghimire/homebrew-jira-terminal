class JiraTerminal < Formula
  desc "This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
  homepage "https://github.com/amritghimire/jira-terminal"
  version "2.4.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.1/jira-terminal-aarch64-apple-darwin.tar.gz"
      sha256 "e5dea8924c424e2b4a0a8b63c85acda67192efc804a3d9f0d759b42710dfb43f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.1/jira-terminal-x86_64-apple-darwin.tar.gz"
      sha256 "896b63253140dd1cf87814456a1519d783dd92fa305a20903149e98071e01df2"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.1/jira-terminal-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "068708aa5cf87c4582ba9b79a5c4cf0abd812551ca1c8c02590336a03c178306"
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
