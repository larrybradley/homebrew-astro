require "formula"

class Sextractor250 < Formula
  homepage "https://www.astromatic.net/software/sextractor"
  url "https://www.astromatic.net/download/sextractor/sextractor-2.5.0.tar.gz"
  sha1 "84e111ea0796428d9336de7add3820575fd7d4cb"

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"
    system "make install"

    File.rename(bin+"sex", bin+"sex250")
    mv prefix+"man/man1/sex.1", prefix+"man/man1/sex250.1"
    rm prefix+"man/manx/sex.x"
    man1.install prefix+"man/man1/sex250.1"
    rm_rf Dir["config/.svn"]
    (share+"sextractor250").install Dir["config/*"]
  end
end
