class Jwst1pass < Formula
  desc "Fit ePSFs to JWST images"
  homepage "https://www.stsci.edu/~jayander/JWST1PASS/"
  url "https://www.stsci.edu/~jayander/JWST1PASS/CODE/jwst1pass.2025.09.26_v1e.F"
  sha256 "41410fe432cf28f1a51d69a379ef59195aa8fa1705d8017b937aa9737fa746b8"

  depends_on "gcc"  # for gfortran

  def install
    system "gfortran", "jwst1pass.2025.09.26_v1e.F", "-o", "jwst1pass"
    bin.install "jwst1pass"
  end

  test do
    system "#{bin}/jwst1pass", "--help"
  end
end
