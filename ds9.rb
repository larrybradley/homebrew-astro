class Ds9 < Formula
  desc "Astronomical imaging and data visualization - X11 version"
  homepage "https://sites.google.com/cfa.harvard.edu/saoimageds9/home"
  url "file:///dev/null"
  # url "https://ds9.si.edu/download/source/"

  if MacOS.version == :tahoe
    stable do
      url "https://ds9.si.edu/download/darwintahoearm64/ds9.darwintahoearm64.8.7.tar.gz"
      sha256 "48bd1f0510c45341b6a5cfb0642ea311c3aa9e00e082b8a45c8e01b0dd454a66"
      version "8.7"
    end

  elsif MacOS.version == :sequoia
    stable do
      url "https://ds9.si.edu/download/darwinsequoiaarm64/ds9.darwinsequoiaarm64.8.7.tar.gz"
      sha256 "014c33378d262958660b398aba01282e0b8bcf547d50fe29b902df3b94030fcf"
      version "8.7"
    end

  elsif MacOS.version == :sonoma
    stable do
      url "https://ds9.si.edu/download/darwinsonomaarm64/ds9.darwinsonomaarm64.8.7.tar.gz"
      sha256 "0141e33117c32c77d305ba5647cbc5f1ef244a3caaf92ec4dc18b0c8b5b1efc5"
      version "8.7"
    end

  else
    onoe "ds9 - This formula is for macOS Sonoma or higher."
  end

  def install
    bin.install "ds9", "ds9.zip"
  end

  test do
    system "ds9"
  end
end
