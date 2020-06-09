require "formula"

class Libwcs < Formula
  desc "A library for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.6.tar.gz"
  sha256 "d99a4c114ee48d0806f3693b003b673446088104a30ecc95cd27ebbe2a704ec5"
  depends_on "cfitsio"

  def install
    cd "libwcs"
    system "make"
    lib.install "libwcs.a"
    include.install Dir["*.h"]
  end
end
