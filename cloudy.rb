class Cloudy < Formula
  desc "Spectral synthesis code for astrophysical simulations"
  homepage "https://gitlab.nublado.org/cloudy/cloudy/-/wikis/home"
  url "https://data.nublado.org/cloudy_releases/c23/c23.01.tar.gz"
  sha256 "a9ad2dc037e88f552389de0e483d68f54310976dee32154ed13830882aedae0b"

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
      You MUST set the environment variable CLOUDY_DATA_PATH to point to
      the data directory:
      export CLOUDY_DATA_PATH=#{pkgshare}/data
    EOS
  end
end
