class Match < Formula
  desc "Match items in two different lists"
  homepage "http://spiff.rit.edu/match/"
  url "http://spiff.rit.edu/match/match-1.0.tar.gz"
  sha256 "2f1e408cc3458e88f0ec7bc54554883addbf1a84a2cea63c78d48a82e28228f3"

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"
    system "make install"
  end
end
