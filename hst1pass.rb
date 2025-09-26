class Hst1pass < Formula
  desc "Fit ePSFs to HST images"
  homepage "https://www.stsci.edu/~jayander/HST1PASS/"
  url "https://www.stsci.edu/~jayander/HST1PASS/CODE/hst1pass/hst1pass.2025.02.14_v1h.F"
  sha256 "5f49dacbd5ae47bee71abd83567e7cbfc25b7c72f63743f28c41e632424ea1db"

  depends_on "gcc"  # for gfortran

  def install
    system "gfortran", "hst1pass.2025.02.14_v1h.F", "-o", "hst1pass"
    bin.install "hst1pass"
  end

  test do
    system "#{bin}/hst1pass", "--help"
  end
end
