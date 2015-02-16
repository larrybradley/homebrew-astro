require "formula"

class Lenstool < Formula
  homepage "http://projets.lam.fr/projects/lenstool/wiki"
  url "http://projets.lam.fr/attachments/download/1345/lenstool-6.8.tar.gz"
  sha1 "3c71b7cf62dcbd2ef9cd351f651f0cc9c5dcaa87"

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
      --disable-openmp
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
