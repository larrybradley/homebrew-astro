require "formula"

class Libwcs < Formula
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.0.tar.gz"
  sha1 "61cf419d1bb132f52dfa9d2e6cfe8b5258cef7a1"

  depends_on "cfitsio"

  def install
    cd "libwcs"
    system "make"
    lib.install "libwcs.a"
    include.install Dir["*.h"]
  end
end
