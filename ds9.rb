require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "http://ds9.si.edu/"

  if MacOS.version == :el_capitan
    stable do
      url "http://ds9.si.edu/download/darwinelcapitan/ds9.darwinelcapitan.7.5.tar.gz"
      sha256 "52506e849bd9967a9e43c449357e72d7371fee2eeef65b5f7868c9c8cbb96081"
      version "7.5"
    end
  elsif MacOS.version == :sierra
    stable do
      url "http://ds9.si.edu/download/darwinsierra/ds9.darwinsierra.7.5.tar.gz"
      sha256 "2509b495370af3b4edfe567e7f21d426910cea7f23b9a229894e83008ea2ddbc"
      version "7.5"
    end
  else
    onoe "This formula is only for Yosemite and above"
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
