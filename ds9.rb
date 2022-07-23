require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"


  if MacOS.version == :monterey
    stable do
      url "https://ds9.si.edu/download/darwinmontereyx86/ds9.darwinmontereyx86.8.4b1.tar.gz"
      sha256 "64e47aabcaa14890dcdbcdf6bcbc16304b6dbcc7b11e73edd51b2f864f40c11b"
      version "8.4b1"
    end

  elsif MacOS.version == :amd64_monterey
    stable do
      url "https://ds9.si.edu/download/darwinbigsurarm64/ds9.darwinbigsurarm64.8.4b1.tar.gz"
      sha256 "e77000e6c181565d70414dedc539d75100a5b9a08f1119628ae2c26dd5084e7c"
      version "8.4b1"
    end

  elsif MacOS.version == :big_sur
    stable do
      url "https://ds9.si.edu/download/darwinbigsur/ds9.darwinbigsurx86.8.4b1.tar.gz"
      sha256 "dd0e424276b97c8ad39803f73b9a000b61fc75f55fdb01b722858d0ad4ab7b62"
      version "8.4b1"
    end

  elsif MacOS.version == :catalina
    stable do
      url "https://ds9.si.edu/download/darwincatalina/ds9.darwincatalina.8.4b1.tar.gz"
      sha256 "317b7a31f170f1cd9e26471ca4a6941c7961feb3c538a0bc2593c67e47661673"
      version "8.4b1"
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
