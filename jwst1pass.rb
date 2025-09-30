class Jwst1pass < Formula
  desc "Fit ePSFs to JWST images"
  homepage "https://www.stsci.edu/~jayander/JWST1PASS/"
  url "https://www.stsci.edu/~jayander/JWST1PASS/CODE/jwst1pass.2025.09.30_v1f.F"
  sha256 "1f59e9726306fe32ee4bb3266e92ce4beeb30b19935582d273cb1cd75767af2a"

  depends_on "gcc"  # for gfortran

  def install
    system "gfortran", "jwst1pass.2025.09.30_v1f.F", "-o", "jwst1pass"
    bin.install "jwst1pass"
  end

  test do
    system "#{bin}/jwst1pass"
  end
end
