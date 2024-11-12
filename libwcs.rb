class Libwcs < Formula
  desc "A library for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.7.tar.gz"
  sha256 "efebf6970f6158ed002fdfe320d4ff4738e3a049b333a749da6cc464b3579860"
  depends_on "cfitsio"

  def install
    Dir.chdir("libwcs") do
      system "make"
      lib.install "libwcs.a"
      include.install Dir["*.h"]
    end
  end
end
