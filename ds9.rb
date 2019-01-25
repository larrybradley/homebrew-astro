require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "http://ds9.si.edu/"

  if MacOS.version == :sierra
    stable do
      url "http://ds9.si.edu/download/darwinsierra/ds9.darwinsierra.8.0.1.tar.gz"
      sha256 "8353a1e3f54014e46ab822825f25c978c61f1cfd66e3fbe1591ef794ba82d2c0"
      version "8.0.1"
    end
  elsif MacOS.version == :high_sierra
    stable do
      url "http://ds9.si.edu/download/darwinhighsierra/ds9.darwinhighsierra.8.0.1.tar.gz"
      sha256 "c43c68e8ae3147f611a5ff2c6f6464e0046fcd3e652aa07faf047c8095286dc4"
      version "8.0.1"
    end
  elsif MacOS.version == :mojave
    stable do
      url "http://ds9.si.edu/download/darwinmojave/ds9.darwinmojave.8.0.1.tar.gz"
      sha256 "b9fd02afa975dd5376530086e3b19c7b475d331ddb6af9ba44a064db09e296b4"
      version "8.0.1"
    end
  else
    onoe "ds9 - This formula is for OSX 10.12 (Sierra) or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
