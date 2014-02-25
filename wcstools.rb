require 'formula'

class LibwcsWcstools < Formula
  homepage 'http://tdc-www.harvard.edu/wcstools/'
  url 'http://tdc-www.harvard.edu/software/wcstools/wcstools-3.8.7.tar.gz'
  sha1 '412d22938b05110eb86f7b01a874c17447ad2f19'
  depends_on 'cfitsio'

  def install
    cd 'libwcs'
    system "make"
    lib.install 'libwcs.a'
    include.install Dir['*.h']
  end
end
