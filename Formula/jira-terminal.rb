class JiraTerminal < Formula
  desc "This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
  homepage "https://github.com/amritghimire/jira-terminal"
  version "2.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.0/jira-terminal-aarch64-apple-darwin.tar.gz"
      sha256 "d72dd6c4cef699932687b63ce65811cde2e4bb9a7b386d3150ef9cf8fca0f0d1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.0/jira-terminal-x86_64-apple-darwin.tar.gz"
      sha256 "b7e3af8d3104ac640d105fe4e58c1f88932da877db1cc3dabf9697ff11fe3a1c"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/amritghimire/jira-terminal/releases/download/v2.4.0/jira-terminal-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c38abd7c2c5876ce24b6794a7d272a3c5d047a218aab0469dc59675a12b849ce"
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
