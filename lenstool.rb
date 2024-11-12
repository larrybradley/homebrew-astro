class Lenstool < Formula
  desc "A gravitational lensing software for modeling mass distribution of galaxies and clusters (strong and weak regime)"
  homepage "https://projets.lam.fr/projects/lenstool/wiki"
  url "https://projets.lam.fr/attachments/download/5851/lenstool-7.1.1.tar.gz"
  sha256 "272aed5e5964b8b941c916be98f13a7f134f3a785681c5b6199ab0438114f5ac"

  # url "https://projets.lam.fr/attachments/download/4243/lenstool-7.0.tar.gz"
  # sha256 "5f2b5c7e1d6e39f1f60c2a24ebfe19216d13c692cf0cad5ef73ff4b99ee728f5"

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

    # homebrew gcc-7 compiler fails; use system gcc as a workaround
    system "./configure", *args, "CC=/usr/bin/gcc"
    system "make"
    system "make install"

    (share+"lenstool").install Dir["examples"]
    (share+"lenstool").install Dir["examples_table"]
    (share+"lenstool").install Dir["perl"]
    doc.install Dir["doc/*"]
  end
end
