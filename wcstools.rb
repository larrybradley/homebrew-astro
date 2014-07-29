require "formula"

class Wcstools < Formula
  homepage "http://tdc-www.harvard.edu/wcstools/"
  url "http://tdc-www.harvard.edu/software/wcstools/wcstools-3.8.7.tar.gz"
  sha1 "412d22938b05110eb86f7b01a874c17447ad2f19"

  depends_on "cfitsio"

  def install
    system "make all"
    bin.install Dir["bin/*"]
  end
end
