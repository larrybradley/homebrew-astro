require 'formula'

class Lenstool < Formula
  homepage 'http://projets.lam.fr/projects/lenstool/wiki'
  url 'http://projets.lam.fr/attachments/download/348'
  sha1 '9f4a97f7099c8bb70d8a64da2da70c3770b88320'
  version '3.8.4'

  depends_on 'libwcs'
  depends_on 'cfitsio'
  depends_on 'gsl'
  depends_on 'pgplot'


  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system './configure', *args
    system 'make'
    system 'make install'

    mkdir share
    mkdir share+'lenstool'
    mv 'examples', share+'lenstool'
    mv 'examples_table', share+'lenstool'

    doc.install Dir['doc/*']
  end
end
