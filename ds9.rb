require "formula"

class Ds9 < Formula
  desc "Astronomical imaging and data visualization - X11 version"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"
  url "file:///dev/null"
  # url "https://ds9.si.edu/download/source/"

  if MacOS.version == :sonoma
    stable do
      url "https://ds9.si.edu/download/darwinventurax86/ds9.darwinventurax86.8.5.tar.gz"
      sha256 "1808bcf3bf9ae869e3aa67dd0f51d16791026f6a63de1269f25a90f57972f189"
      version "8.5.0"
    end

  elsif MacOS.version == :amd64_sonoma
    stable do
      url "https://ds9.si.edu/download/darwinventuraarm64/ds9.darwinventuraarm64.8.5.tar.gz"
      sha256 "f933ba18e75feeb4e2e53365ea412de9d75ae6431883b9030a6514d996854ef0"
      version "8.5.0"
    end

  elsif MacOS.version == :ventura
    stable do
      url "https://ds9.si.edu/download/darwinventurax86/ds9.darwinventurax86.8.5.tar.gz"
      sha256 "1808bcf3bf9ae869e3aa67dd0f51d16791026f6a63de1269f25a90f57972f189"
      version "8.5.0"
    end

  elsif MacOS.version == :amd64_ventura
    stable do
      url "https://ds9.si.edu/download/darwinventuraarm64/ds9.darwinventuraarm64.8.5.tar.gz"
      sha256 "f933ba18e75feeb4e2e53365ea412de9d75ae6431883b9030a6514d996854ef0"
      version "8.5.0"
    end

  else
    onoe "ds9 - This formula is for macOS Monterey or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  def test
    system "ds9"
  end
end
