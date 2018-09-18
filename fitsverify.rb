require "formula"

class Fitsverify < Formula
  desc "Rigorously checks whether a FITS (Flexible Image Transport System) data file conforms to the FITS standard"
  homepage "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
  url "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.19.tar.gz"
  sha256 "70e7a22ae47d5e31e7a9a0d86d146665b6832d5b206886e1b094f73d6ed62fd0"

  depends_on "cfitsio" => :build

  def install
    system "gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm"
    bin.install "fitsverify"
    prefix.install "README"
  end
end
