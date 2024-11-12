class Fitsverify < Formula
  desc "Rigorously checks whether a FITS (Flexible Image Transport System) data file conforms to the FITS standard"
  homepage "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/"
  url "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.22.tar.gz"
  sha256 "6c45e803a7e0edbcb7d13918615bae6361d2b333c292b849c509ec9bebdb18b4"

  depends_on "cfitsio" => :build

  def install
    system "gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm"
    bin.install "fitsverify"
    prefix.install "README"
  end
end
