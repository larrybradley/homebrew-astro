require "formula"

class Sextractor250 < Formula
  desc "Source Extraction from astronomical images"
  homepage "https://www.astromatic.net/software/sextractor"
  url "https://www.astromatic.net/download/sextractor/sextractor-2.5.0.tar.gz"
  sha256 "786f987818546d9b72fea7e786f040b63e31fbc46325deb58929251065573303"

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
