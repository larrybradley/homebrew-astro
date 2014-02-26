require 'formula'

class Fitsverify < Formula
  homepage 'http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/'
  url 'http://heasarc.gsfc.nasa.gov/docs/software/ftools/fitsverify/fitsverify-4.17.tar.gz'
  sha1 'd1f19dc816bf475072ba3e96aa54a0d85fd3a88d'

  depends_on 'cfitsio' => :build

  def install
    system 'gcc -o fitsverify ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c -DSTANDALONE -lcfitsio -lm'
    bin.install 'fitsverify'
    prefix.install README
  end
end
