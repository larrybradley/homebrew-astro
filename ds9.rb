require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization application"
  homepage "http://ds9.si.edu/"

  if MacOS.version == :el_capitan
    stable do
      url "http://ds9.si.edu/download/darwinelcapitan/ds9.darwinelcapitan.7.4.tar.gz"
      sha256 "a10d9edc5ade0ac548e814b22234bfd758c70df5bdcb9d189a4cf7daee204fcd"
      version "7.4"
    end

    # install with `--devel` flag
    devel do
      url "http://ds9.si.edu/download/darwinelcapitan/ds9.darwinelcapitan.7.5b4.tar.gz"
      sha256 "92d0dc1e6293aeab3f0d87945cbaffa86b796c7f5e514c5dc24a4dc6b976a85f"
      version "7.5b4"
    end
  elsif MacOS.version == :yosemite
    stable do
      url "http://ds9.si.edu/download/darwinyosemite/ds9.darwinyosemite.7.4.tar.gz"
      sha256 "7b64cec160b45922fc77a602b10a7f3ffff633794d9431bc4cd0788000065fc2"
      version "7.4"
    end

    # install with `--devel` flag
    devel do
      url "http://ds9.si.edu/download/darwinyosemite/ds9.darwinyosemite.7.5b4.tar.gz"
      sha256 "4130b455fa2640aea2b377c33255969f79e84eb59f51317843a7607dbb1e0b27"
      version "7.5b4"
    end
  else
    onoe "This formula is only for Yosemite and above"
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
