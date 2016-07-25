require "formula"

class Fitsverify < Formula
  desc "Rigorously checks whether a FITS (Flexible Image Transport System) data file conforms to the FITS standard"
  homepage "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
  url "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.18.tar.gz"
  sha256 "e6fd00c2aa3749ab991167c7129ad27c79d9ee841ec8df1c11b307e875b8faba"

  depends_on "cfitsio" => :build

  def install
    system "gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm"
    bin.install "fitsverify"
    prefix.install "README"
  end
end
