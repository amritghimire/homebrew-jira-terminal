# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class JiraTerminal < Formula
  desc "The application that can be used for personal usage to manage jira from terminal. " 
  homepage "https://github.com/amritghimire/jira-terminal"
  url "https://github.com/amritghimire/jira-terminal/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "3162d2d3c7e7ff78f966a208b690c904eee3f1bef3bc287455fb26b7746e8759"
  version "2.1.0"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "jira-terminal"
    bin.install "target/release/jira-terminal"
  end
end
