require "formula"

class Match < Formula
  desc "Match items in two different lists"
  homepage "http://spiff.rit.edu/match/"
  url "http://spiff.rit.edu/match/match-0.16.tar.gz"
  sha256 "f865e91e7c9b26147ca0215db559df1f17354e374d81627975cd98cc5020eff8"

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"
    system "make install"
  end
end
