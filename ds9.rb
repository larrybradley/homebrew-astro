require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"

  if MacOS.version == :big_sur
    stable do
      url "https://ds9.si.edu/download/darwinbigsur/ds9.darwinbigsur.8.2.1.tar.gz"
      sha256 "ecdbb042292f9f3183b61e0e49563043f51bafa323a921fd53cc22c28e1122ef"
      version "8.2.1"
    end

  ## MacOS.version == :amd64_big_sur
  ## url "https://ds9.si.edu/download/darwinbigsurarm64/ds9.darwinbigsurarm64.8.3b1.tar.gz"

  elsif MacOS.version == :catalina
    stable do
      url "https://ds9.si.edu/download/darwincatalina/ds9.darwincatalina.8.2.1.tar.gz"
      sha256 "2646a147f76a500ad64d004d9023efb36f66cb72dd85fadb6f5622598d5024a4"
      version "8.2.1"
    end

  elsif MacOS.version == :mojave
    stable do
      url "https://ds9.si.edu/download/darwinmojave/ds9.darwinmojave.8.2.1.tar.gz"
      sha256 "e79331cb626f5fade6469c39a2b421762de74b355e466c5a7d0a408d6b758b03"
      version "8.2.1"
    end

  else
    onoe "ds9 - This formula is for OSX 10.14 (Mojave) or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
