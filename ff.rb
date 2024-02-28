# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Ff < Formula
  desc "Find files (ff) by name"
  homepage "https://github.com/larrybradley/ff"
  url "https://github.com/larrybradley/ff/archive/refs/heads/main.zip"
  sha256 "44d033bc187199f28f8a35502cd17aa236446004417d0fd1c188c2f8bc279b09"
  head "https://github.com/larrybradley/ff.git"
  version "0.2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end
end
