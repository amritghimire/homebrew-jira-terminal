# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class JiraTerminal < Formula
  desc "The application that can be used for personal usage to manage jira from terminal. " 
  homepage "https://github.com/amritghimire/jira-terminal"
  url "https://github.com/amritghimire/jira-terminal/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "0f11a14462240ee40fdc477df6a60255c7dc6c8869ad93edb0ae55dda588669e"
  version "1.6.0"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "jira-terminal"
    bin.install "target/release/jira-terminal"
  end
end
