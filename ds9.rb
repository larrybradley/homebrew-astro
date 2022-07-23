require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"

  if MacOS.version == :monterey
    stable do
      onoe "ds9 v8.3 is not available for monterey"
    end

  elsif MacOS.version == :amd64_monterey
    stable do
      onoe "ds9 v8.3 is not available for monterey AMD"
    end

  elsif MacOS.version == :big_sur
    stable do
      url "https://ds9.si.edu/download/darwinbigsur/ds9.darwinbigsurx86.8.3.tar.gz"
      sha256 "81883d4c3dd5166f74ba47eca4892c6e58ec86a304863b8b01893c1d53f89ee2"
      version "8.3"
    end

  elsif MacOS.version == :amd64_big_sur
    stable do
      url "https://ds9.si.edu/download/darwinbigsurarm64/ds9.darwinbigsurarm64.8.3.tar.gz"
      sha256 "d43ce18267c6158c9fbe8fd6d01e44b8a015532870f2881ac221e28595d1232f"
      version "8.3"
    end

  elsif MacOS.version == :catalina
    stable do
      url "https://ds9.si.edu/download/darwincatalina/ds9.darwincatalina.8.3.tar.gz"
      sha256 "a43f770cf8f935ce9e1bd191c4b9ee177ad21d2aa6a0bddec904485a2a0dd0f6"
      version "8.3"
    end

  else
    onoe "ds9 - This formula is for OSX 10.15 (Catalina) or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
