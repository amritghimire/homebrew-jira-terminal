# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class JiraTerminal < Formula
  desc "The application that can be used for personal usage to manage jira from terminal. " 
  homepage "https://github.com/amritghimire/jira-terminal"
  url "https://github.com/amritghimire/jira-terminal/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "74b626520739f21c136ad1036d71f3f00940405c85c8488e0eabd512464efc2e"
  version "2.0.0"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "jira-terminal"
    bin.install "target/release/jira-terminal"
  end
end
