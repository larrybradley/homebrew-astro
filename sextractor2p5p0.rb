require "formula"

class Sextractor2p5p0 < Formula
  desc "Source Extraction from astronomical images"
  homepage "http://www.astromatic.net/software/sextractor"
  url "http://www.astromatic.net/download/sextractor/sextractor-2.5.0.tar.gz"
  sha256 "786f987818546d9b72fea7e786f040b63e31fbc46325deb58929251065573303"

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    File.rename(bin+"sex", bin+"sex-2.5.0")
    mv prefix+"man/man1/sex.1", prefix+"man/man1/sex-2.5.0.1"
    rm prefix+"man/manx/sex.x"
    man1.install prefix+"man/man1/sex-2.5.0.1"
    rm_rf Dir["config/.svn"]
    (share+"sextractor-2.5.0").install Dir["config/*"]
  end
end
