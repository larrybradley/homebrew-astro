require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "http://ds9.si.edu/"

  if MacOS.version == :sierra
    stable do
      url "http://ds9.si.edu/download/darwinsierra/ds9.darwinsierra.7.6.tar.gz"
      sha256 "e0b67fee1b61ae8e73e09dc0479a266371b8aebeb9b536b33a6aa9c2c2a6ce7d"
      version "7.6"
    end
  elsif MacOS.version == :high_sierra
    stable do
      url "http://ds9.si.edu/download/darwinhighsierra/ds9.darwinhighsierra.7.6.tar.gz"
      sha256 "9a3fbfc1718a434cf5b677e1c34839bff7f9d2b2ee398b9a9a42e5c54ef84255"
      version "7.6"
    end
  else
    onoe "ds9 - This formula is for Sierra and High Sierra only."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
