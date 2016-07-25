require "formula"

class Wfc3uvcte < Formula
  desc "HST/WFC3 CTE tools"
  homepage "http://www.stsci.edu/hst/wfc3/tools/cte_tools"
  url "http://www.stsci.edu/~lbradley/homebrew/wfc3uvcte-1.0.tar.gz"
  sha256 "8c4d22627a98b56e5cccb5a9ec805d4958d728f7cfa45c8d9c552e1095ab727b"
  version "1.0"

  depends_on :fortran

  def install
    system "gfortran wfc3uv_ctereverse.F -o wfc3uv_ctereverse.e"
    system "gfortran wfc3uv_ctereverse_wSUB.F -o wfc3uv_ctereverse_wSUB.e"
    system "gfortran wfc3uv_ctereverse_parallel.F -o wfc3uv_ctereverse_parallel.e -fopenmp"
    system "gfortran wfc3uv_cteforward.F -o wfc3uv_cteforward.e"

    bin.install "wfc3uv_ctereverse.e"
    bin.install "wfc3uv_ctereverse_wSUB.e"
    bin.install "wfc3uv_ctereverse_parallel.e"
    bin.install "wfc3uv_cteforward.e"
  end
end
