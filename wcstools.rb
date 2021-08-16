require "formula"

class Wcstools < Formula
  desc "Tools for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.6.tar.gz"
  sha256 "184e8a1377373e8dfeaa19b438771d8140126d5510cba55dbf86ceac98e7aff5"
  depends_on "cfitsio"

  def install
    system "make", "-f", "Makefile.osx", "all"
    prefix.install "bin"
  end

  test do
    assert_match "IMHEAD", shell_output("#{bin}/imhead 2>&1", 1)
  end
end
