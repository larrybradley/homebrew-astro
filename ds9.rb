class Ds9 < Formula
  desc "Astronomical imaging and data visualization - X11 version"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"
  url "file:///dev/null"
  # url "https://ds9.si.edu/download/source/"

  if MacOS.version == :sonoma
    stable do
      url "https://ds9.si.edu/download/darwinsonomaarm64/ds9.darwinsonomaarm64.8.6.tar.gz"
      sha256 "aa994cdf49e220852f5483cf24e29147590c05a43bdefa14f2415bb249f623de"
      version "8.6.0"
    end

  elsif MacOS.version == :amd64_ventura
    stable do
      url "https://ds9.si.edu/download/darwinventuraarm64/ds9.darwinventuraarm64.8.6.tar.gz"
      sha256 "2d7895510ce6772246b15dc83b31ec5e26ac21333cd2aaddc9fb3968ee96ca6a"
      version "8.6.0"
    end

  elsif MacOS.version == :ventura
    stable do
      url "https://ds9.si.edu/download/darwinventurax86/ds9.darwinventurax86.8.6.tar.gz"
      sha256 "ffd53215d0d6a12d01d7d5435e6b59199f148c0810354aa2331123474f141980"
      version "8.6.0"
    end

  else
    onoe "ds9 - This formula is for macOS Ventura or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
