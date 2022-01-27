# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class JiraTerminal < Formula
  desc "The application that can be used for personal usage to manage jira from terminal. " 
  homepage "https://github.com/amritghimire/jira-terminal"
  url "https://github.com/amritghimire/jira-terminal/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "5fcc55700cc8318038bc0e5044cc69e78ecfb17232284c4bfd15a1f5e5e375b7"
  version "1.5.0"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "jira-terminal"
    bin.install "target/release/jira-terminal"
  end
end
