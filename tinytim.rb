require "formula"

class Tinytim < Formula
  desc "PSF modeling tool for HST"
  homepage "https://www.stsci.edu/hst/instrumentation/focus-and-pointing/focus/tiny-tim-hst-psf-modeling"
  url "https://github.com/spacetelescope/tinytim/archive/7.5.tar.gz"
  sha256 "398c41850545f8fbd37a50b60a76d9835f2a996d9e3191aafb48cea899abf8bd"

  option "without-threaded", "Do not build a multi-threaded version"

  # remove dependency on TINYTIM environment variable
  patch :DATA

  def install
    if build.without? "threaded"
      system "make macosx"
    else
      system "make threadedmacosx"
    end
    bin.install "tiny1", "tiny2", "tiny3", "makemaps"
    doc.install %w[READ.ME README.1ST RELEASE.TXT TinyTim_WFC3.doc tinytim.pdf tinytim.doc]
    mkdir share+"tinytim"
    mv Dir.glob("*.pup"), share+"tinytim"
    mv Dir.glob("*.tab"), share+"tinytim"
    mv Dir.glob("*.fil"), share+"tinytim"
    mv Dir.glob("*.dat"), share+"tinytim"
    mv Dir.glob("*.fits"), share+"tinytim"
    mv Dir.glob("*.new"), share+"tinytim"
    mv "cflow.graph", share+"tinytim"
    mv "spectra.lis", share+"tinytim"
  end
end

__END__
diff --git a/system.c b/system.c
index 98c4de9..0d471e8 100644
--- a/system.c
+++ b/system.c
@@ -34,12 +34,7 @@ void Default_dir( char *string, char *filename )
 {

 	char    *temp;
-	if ( (temp = getenv("TINYTIM")) == NULL )
-	{
-		fprintf(stderr,
-		  "Error: Environment variable TINYTIM undefined\n");
-		exit(2);
-	}
+	temp = "/usr/local/share/tinytim";
 	strcpy( filename, temp );
 	strcat( filename, "/" );
 	strcat( filename, string );
