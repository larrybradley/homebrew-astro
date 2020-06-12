require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"


  if MacOS.version == :catalina
    stable do
      url "https://ds9.si.edu/download/darwincatalina/ds9.darwincatalina.8.1.tar.gz"
      sha256 "53664d3d24028d3dc098362d826935e192166897349aec8cd3906116a31963c5"
      version "8.1"
    end

  elsif MacOS.version == :mojave
    stable do
      url "https://ds9.si.edu/download/darwinmojave/ds9.darwinmojave.8.1.tar.gz"
      sha256 "cd6563e1b851463074999536a661ed0342a7127cad30ef4fbe77fa413891a543"
      version "8.1"
    end

  elsif MacOS.version == :high_sierra
    stable do
      url "https://ds9.si.edu/download/darwinhighsierra/ds9.darwinhighsierra.8.0.1.tar.gz"
      sha256 "c43c68e8ae3147f611a5ff2c6f6464e0046fcd3e652aa07faf047c8095286dc4"
      version "8.1"
    end

  else
    onoe "ds9 - This formula is for OSX 10.13 (High Sierra) or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
