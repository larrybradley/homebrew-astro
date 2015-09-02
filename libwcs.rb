require "formula"

class Libwcs < Formula
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.9.2.tar.gz"
  sha1 "3d86e2480443717d42bb8129be9bcc339ef5ff4e"

  depends_on "cfitsio"

  def install
    cd "libwcs"
    system "make"
    lib.install "libwcs.a"
    include.install Dir["*.h"]
  end
end
