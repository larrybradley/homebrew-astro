require 'formula'

class Match < Formula
  homepage 'http://spiff.rit.edu/match/'
  url 'http://spiff.rit.edu/match/match-0.16.tar.gz'
  sha1 'd34df1e9599f5045efcc5ee3cb4233447126ce51'


  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system './configure', *args
    system 'make'
    system 'make install'
  end
end
