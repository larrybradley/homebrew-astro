require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/'

  if MacOS.version == :mountain_lion
    url 'http://ds9.si.edu/download/darwinmountainlion/ds9.darwinmountainlion.7.2.tar.gz'
    sha1 '4d7d17fd619ef5aa2fc14618811207faad797d76'
    #url 'http://ds9.si.edu/download/darwinmountainlion/ds9.darwinmountainlion.7.3b5.tar.gz'
    #sha1 '3bb2f7d15c8b6f366e7f19c5408acd47800ac18c'
  elsif MacOS.version == :mavericks
    url 'http://ds9.si.edu/download/darwinmavericks/ds9.darwinmavericks.7.3b5.tar.gz'
    sha1 '6cfbabc546e343b0e75e9e428296ec9749b74dbe'
  else
    onoe 'This formula is only for Mountain Lion and above'
  end

  def install
    bin.install 'ds9', 'ds9.zip'
  end
end
