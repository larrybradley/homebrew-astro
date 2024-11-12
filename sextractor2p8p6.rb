class Sextractor2p8p6 < Formula
  desc "Source Extraction from astronomical images"
  homepage "http://www.astromatic.net/software/sextractor"
  url "http://www.astromatic.net/download/sextractor/sextractor-2.8.6.tar.gz"
  sha256 "dde34594c2a1324f0951272e404e55d0d4cb0607f8ea18a61f2563bb67f494ac"

  depends_on "fftw"
  depends_on "autoconf" => :build

  option "with-check", "Enable build-time checking (with take ~20 minutes)"

  # use Mac OSX Accelerate framework instead of ATLAS
  patch do
    url "https://gist.githubusercontent.com/larrybradley/9ab242c100b5227168c9/raw/49784fbc0707b40f532a6486c1a1efd84a1e4499/sextractor286.patch"
    sha256 "251fc282d1b0ff361906466c024b849bb2b8d6e408aec085e1e1082f27974129"
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
    system "make", "install"

    File.rename(bin+"sex", bin+"sex-2.8.6")
    File.rename(bin+"ldactoasc", bin+"ldactoasc-2.8.6")
    File.rename(man1+"sex.1", man1+"sex-2.8.6.1")
    rm man+"manx/sex.x"
    File.rename(share+"sextractor", share+"sextractor-2.8.6")
    (share+"sextractor-2.8.6").install Dir["config/*"]
  end
end
