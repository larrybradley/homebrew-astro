class Hst1pass < Formula
  desc "Fit ePSFs to HST images"
  homepage "https://www.stsci.edu/~jayander/HST1PASS/"
  url "https://www.stsci.edu/~jayander/HST1PASS/CODE/hst1pass/hst1pass.2026.03.24_v2b.F"
  sha256 "5467d81fffc775f43382c1cf13c499592159575f330eb4591b997c01edb21887"

  depends_on "gcc"  # for gfortran

  def install
    system "gfortran", "hst1pass.2026.03.24_v2b.F", "-o", "hst1pass"
    bin.install "hst1pass"
  end

  test do
    system "#{bin}/hst1pass"
  end
end
