require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization - X11 version"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"
  url "file:///dev/null"
  # url "https://ds9.si.edu/download/source/ds9.8.4.1.tar.gz"

  if MacOS.version == :ventura
    stable do
      url "https://ds9.si.edu/download/darwinventurax86/ds9.darwinventurax86.8.4.1.tar.gz"
      sha256 "87646d3b23804ebe5e2122ce2235832e5247226b6e69707f6ac31dbac91ed7b6"
      version "8.4.1"
    end

  elsif MacOS.version == :amd64_ventura
    stable do
      url "https://ds9.si.edu/download/darwinventuraarm64/ds9.darwinventuraarm64.8.4.1.tar.gz"
      sha256 "0c7d740f3ffbfc29f59bec8b804120dec3c68f0dab029f06bddd09df2527befc"
      version "8.4.1"
    end

  elsif MacOS.version == :monterey
    stable do
      url "https://ds9.si.edu/download/darwinventurax86/ds9.darwinventurax86.8.4.1.tar.gz"
      sha256 "e1e3827cf367c6c8416df4ae21f091d5412b9b33fce713ed041061dc6bfb6d02"
      version "8.4.1"
    end

  elsif MacOS.version == :amd64_monterey
    stable do
      url "https://ds9.si.edu/download/darwinmontereyarm64/ds9.darwinmontereyarm64.8.4.1.tar.gz"
      sha256 "0c7d740f3ffbfc29f59bec8b804120dec3c68f0dab029f06bddd09df2527befc"
      version "8.4.1"
    end

  else
    onoe "ds9 - This formula is for macOS Monterey or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
