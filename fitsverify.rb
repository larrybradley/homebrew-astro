require "formula"

class Fitsverify < Formula
  desc "Rigorously checks whether a FITS (Flexible Image Transport System) data file conforms to the FITS standard"
  homepage "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
  url "http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.18.tar.gz"
  sha256 "bdb097241aa0c10203bbcce74c9da13beb85ea6cb61b56095ba7c28c38660c81"

  depends_on "cfitsio" => :build

  def install
    system "gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm"
    bin.install "fitsverify"
    prefix.install "README"
  end
end
