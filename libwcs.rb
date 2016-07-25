require "formula"

class Libwcs < Formula
  desc "A library for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.3.tar.gz"
  sha256 "1005ae353e37c498490163f4785705fdb8bb3633dccb6291bf3b24b2135ab949"
  depends_on "cfitsio"

  def install
    cd "libwcs"
    system "make"
    lib.install "libwcs.a"
    include.install Dir["*.h"]
  end
end
