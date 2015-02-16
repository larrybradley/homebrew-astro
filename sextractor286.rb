require "formula"

class Sextractor286 < Formula
  homepage "https://www.astromatic.net/software/sextractor"
  url "https://www.astromatic.net/download/sextractor/sextractor-2.8.6.tar.gz"
  sha1 "103ac2d51d9bae9fcbc5dda3031d82cd127f8250"

  depends_on "fftw"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def patches
    # use Mac OSX Accelerate framework instead of ATLAS
    "https://gist.github.com/larrybradley/9ab242c100b5227168c9/raw/630f75504fe6fb09fd98cc9acd8119293445c504/sextractor286.patch"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --with-fftw=#{HOMEBREW_PREFIX}/lib
      --with-fftw-incdir=#{HOMEBREW_PREFIX}/include
      --enable-dependency-tracking
    ]

    system "autoreconf -fi"
    #system "glibtoolize -fi"
    system "./configure", *args
    system "make"
    system "make install"

    File.rename(bin+"sex", bin+"sex286")
    File.rename(bin+"ldactoasc", bin+"ldactoasc286")
    File.rename(man1+"sex.1", man1+"sex286.1")
    rm man+"manx/sex.x"
    File.rename(share+"sextractor", share+"sextractor286")
    (share+"sextractor286").install Dir["config/*"]
  end
end
