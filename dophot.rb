class Dophot < Formula
  desc "PSF-fitting photometry"
  homepage "https://github.com/M1TDoPHOT/DoPHOT_C"
  url "https://www.stsci.edu/~lbradley/homebrew/dophot-4.2.tar.gz"
  version "4.2"
  sha256 "4f332ed0aa3b5f8dd48785db4a2e949d7925a3c400e1cab03b78fa4c40042031"

  depends_on "cfitsio"

  patch do
    # fix Makefile paths
    url "https://gist.githubusercontent.com/larrybradley/61ca756641cca8696910/raw/1329c11ed1148684834d0bf66e695774d420eb74/dophot_makefile.patch"
    sha256 "5f1724045af8f0210f0d20c07d282d80ad41bddbc53e44669b4da7e805b0b4b5"
  end

  def install
    system "make", "test"
    system "make", "dophot"
    bin.install "working_data/dophot"
    (share/"dophot").install "working_data/param_default_c"
    (share/"dophot").install "verif_data/pm"
  end
end
