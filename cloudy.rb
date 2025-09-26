class Cloudy < Formula
  desc "Spectral synthesis code for astrophysical simulations"
  homepage "https://gitlab.nublado.org/cloudy/cloudy/-/wikis/home"
  url "https://data.nublado.org/cloudy_releases/c25/c25.00.tar.gz"
  sha256 "12a4fac7a29f888f56b37885df0067c92eae47a53c78060743e3c92140add5f3"

  def install
    # to change the number of make jobs, you can set the environment
    # variable:
    # export HOMEBREW_MAKE_JOBS=4

    cd "source" do
      system "make", "-j#{ENV.make_jobs}"
    end

    bin.install "source/cloudy.exe" => "cloudy"
    pkgshare.install "data"
  end

  def post_install
    puts <<~EOS
      Cloudy has been installed successfully!

      To run Cloudy:
      $ cloudy

      To test Cloudy, you can run:
      $ cloudy
      test<CR>
      <CR>

    EOS
  end

  def caveats
    <<~EOS
      To change the number of make jobs, you can set the
      HOMEBREW_MAKE_JOBS environment variable before installing this
      package, e.g.:

      $ export HOMEBREW_MAKE_JOBS=4

      You MUST set the environment variable CLOUDY_DATA_PATH to point to
      the data directory:

      $ export CLOUDY_DATA_PATH=#{pkgshare}/data
    EOS
  end
end
