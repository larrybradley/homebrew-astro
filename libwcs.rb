class Libwcs < Formula
  desc "Library for using World Coordinate Systems (WCS) in astronomical images"
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.7.tar.gz"
  sha256 "525f6970eb818f822db75c1526b3122b1af078affa572dce303de37df5c7b088"
  depends_on "cfitsio"

  def install
    Dir.chdir("libwcs") do
      system "make"
      lib.install "libwcs.a"
      include.install Dir["*.h"]
    end
  end
end
