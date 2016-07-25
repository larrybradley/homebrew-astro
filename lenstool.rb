require "formula"

class Lenstool < Formula
  desc "A gravitational lensing software for modeling mass distribution of galaxies and clusters (strong and weak regime)"
  homepage "http://projets.lam.fr/projects/lenstool/wiki"
  url "https://projets.lam.fr/attachments/download/2948/lenstool-6.8.1.tar.gz"
  sha256 "6ea572ab2073ad9fadbe79332a7c2525ca54e5e76446b76568614a55c18b17bf"

  depends_on "libwcs"
  depends_on "cfitsio"
  depends_on "gsl"
  depends_on "pgplot" => :optional

  fails_with :clang do
    cause "OSX clang compiler does not support openmp"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --with-cfitsio-lib-path=#{HOMEBREW_PREFIX}/lib
      --with-cfitsio-include-path=#{HOMEBREW_PREFIX}/include
      --with-wcslib-lib-path=#{HOMEBREW_PREFIX}/lib
      --with-wcslib-include-path=#{HOMEBREW_PREFIX}/include
      --with-gsl-lib-path=#{HOMEBREW_PREFIX}/lib
      --with-gsl-include-path=#{HOMEBREW_PREFIX}/include
    ]

    system "./configure", *args
    system "make"
    system "make install"

    (share+"lenstool").install Dir["examples"]
    (share+"lenstool").install Dir["examples_table"]
    (share+"lenstool").install Dir["perl"]
    doc.install Dir["doc/*"]
  end
end
