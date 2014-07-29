require "formula"

class Sextractor < Formula
  homepage "https://www.astromatic.net/software/sextractor"
  url "https://www.astromatic.net/download/sextractor/sextractor-2.19.5.tar.gz"
  sha1 "43a48391b90b915b1c256b68c29c2276bee8621d"

  depends_on "fftw"

  def install
    args = %W[
      --prefix=#{prefix}
      --with-fftw=#{HOMEBREW_PREFIX}/lib
      --with-fftw-incdir=#{HOMEBREW_PREFIX}/include
      --enable-dependency-tracking
      --disable-model-fitting
    ]

    system "./configure", *args
    system "make"
    system "make install"
    mv Dir["config/*"], share+"sextractor"
  end
end
