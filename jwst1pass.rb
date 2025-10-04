class Jwst1pass < Formula
  desc "Fit ePSFs to JWST images"
  homepage "https://www.stsci.edu/~jayander/JWST1PASS/"
  url "https://www.stsci.edu/~jayander/JWST1PASS/CODE/jwst1pass.2025.09.30_v1f.F"
  sha256 "637b667dd7136769ec8ce8c04ba034da9c614a55e59c2f6cc43a8895f581b01c"

  depends_on "gcc"  # for gfortran

  def install
    system "gfortran", "jwst1pass.2025.09.30_v1f.F", "-o", "jwst1pass"
    bin.install "jwst1pass"
  end

  test do
    system "#{bin}/jwst1pass"
  end
end
