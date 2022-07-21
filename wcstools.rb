require "formula"

class Wcstools < Formula
  desc "Tools for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.7.tar.gz"
  sha256 "efebf6970f6158ed002fdfe320d4ff4738e3a049b333a749da6cc464b3579860"
  depends_on "cfitsio"

  def install
    system "make", "-f", "Makefile.osx", "all"
    prefix.install "bin"
  end

  test do
    assert_match "IMHEAD", shell_output("#{bin}/imhead 2>&1", 1)
  end
end
