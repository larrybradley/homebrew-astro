require "formula"

class Sextractor < Formula
  desc "Source Extraction from astronomical images"
  # homepage "http://www.astromatic.net/software/sextractor"
  homepage "https://github.com/astromatic/sextractor/releases"
  url "https://github.com/astromatic/sextractor/archive/2.25.0.tar.gz"
  sha256 "ab8ec8fe2d5622a94eb3a20d007e0c54bf2cdc04b8d632667b2e951c02819d8e"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "fftw"

  option "with-check", "Enable build-time checking (will take ~1 min)"

  # make changes needed to compile with the Accelerate framework for
  # linear algebra routines
  patch do
    url "https://gist.githubusercontent.com/larrybradley/6b208de486fa0aa7060a69f76bdf0bf7/raw/fac5daedb129df8316e978d41bb92787a1156bd4/sextractor225_accelerate.patch"
    sha256 "9bbba30c196105efacfc642683469f73a5143264029394a7f519559170aabc58"
  end

  def install
    inreplace "autogen.sh", "libtoolize", "glibtoolize"

    system "sh", "autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--enable-accelerate"
    system "make"
    system "make", "check" if build.with? "check"
    system "make", "install"
    (share+"sextractor").install Dir["config/*"]
  end
end
