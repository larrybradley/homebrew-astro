require "formula"

class Ds9 < Formula
  homepage "http://hea-www.harvard.edu/RD/ds9/"

  if MacOS.version == :mountain_lion
    stable do
      url "http://ds9.si.edu/download/darwinmountainlion/ds9.darwinmountainlion.7.3.2.tar.gz"
      sha1 "53900b53b09f999bb8ec724d6fdebf2bdfa5f388"
    end

    # install with `--devel` flag
    #devel do
    #  url "http://ds9.si.edu/download/darwinmountainlion/ds9.darwinmountainlion.7.3b5.tar.gz"
    #  sha1 "3bb2f7d15c8b6f366e7f19c5408acd47800ac18c"
    #  version "7.3b5"
    #end
  elsif MacOS.version == :mavericks
    url "http://ds9.si.edu/download/darwinmavericks/ds9.darwinmavericks.7.3.2.tar.gz"
    sha1 "7b5436ed743b0482a8fc355f534159f777333c41"
  elsif MacOS.version == :yosemite
    url "http://ds9.si.edu/download/darwinmavericks/ds9.darwinmavericks.7.3.2.tar.gz"
    sha1 "7b5436ed743b0482a8fc355f534159f777333c41"
  else
    onoe "This formula is only for Mountain Lion and above"
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
