require "formula"

class Fitsverify < Formula
  desc "Rigorously checks whether a FITS (Flexible Image Transport System) data file conforms to the FITS standard"
  homepage "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
  url "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.20.tar.gz"
  sha256 "eec2cdd1f1db12b6aea7e6e8af4a1166d3227d7a847160c2748318d8e6334885"

  depends_on "cfitsio" => :build

  def install
    system "gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm"
    bin.install "fitsverify"
    prefix.install "README"
  end
end
