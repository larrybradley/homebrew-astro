require "formula"

class Wfc3uvcte < Formula
  homepage "http://www.stsci.edu/hst/wfc3/tools/cte_tools"
  url "file:///Library/Caches/Homebrew/wfc3uvcte-1.0.tar.gz"
  sha1 "0e9d965254defc03bc27f6e946a03548f817a0f6"
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
