require "formula"

class Sextractor286 < Formula
  homepage "https://www.astromatic.net/software/sextractor"
  url "https://www.astromatic.net/download/sextractor/sextractor-2.8.6.tar.gz"
  sha1 "103ac2d51d9bae9fcbc5dda3031d82cd127f8250"

  depends_on "fftw"
  depends_on "autoconf" => :build

  option "with-check", "Enable build-time checking (with take ~20 minutes)"

  # use Mac OSX Accelerate framework instead of ATLAS
  patch do
    url "https://gist.githubusercontent.com/larrybradley/9ab242c100b5227168c9/raw/49784fbc0707b40f532a6486c1a1efd84a1e4499/sextractor286.patch"
    sha1 "4b58c667c2285edb3ee89875f4b11de3b8bbfdc2"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --with-fftw=#{HOMEBREW_PREFIX}/lib
      --with-fftw-incdir=#{HOMEBREW_PREFIX}/include
      --enable-dependency-tracking
    ]

    system "autoconf"
    system "./configure", *args
    system "make", "check" if build.with? "check"
    system "make install"

    File.rename(bin+"sex", bin+"sex286")
    File.rename(bin+"ldactoasc", bin+"ldactoasc286")
    File.rename(man1+"sex.1", man1+"sex286.1")
    rm man+"manx/sex.x"
    File.rename(share+"sextractor", share+"sextractor286")
    (share+"sextractor286").install Dir["config/*"]
  end
end
