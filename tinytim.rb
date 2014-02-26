require 'formula'

class Tinytim < Formula
  homepage 'http://tinytim.stsci.edu/'
  url 'http://tinytim.stsci.edu/static/tinytim-7.5.tar.gz'
  sha1 '98ead7af02a616b5da5ef5b93fb4b38710bf815b'

  option 'with-threaded', 'Compile for multi-threaded execution'

  def patches
    # remove dependency on TINYTIM environment variable
    DATA
  end

  def install
    if build.with? 'threaded'
      system 'make threadedmacosx'
    else
      system 'make macosx'
    end
    bin.install 'tiny1', 'tiny2', 'tiny3', 'makemaps'
    doc.install %w[READ.ME README.1ST RELEASE.TXT TinyTim_WFC3.doc tinytim.pdf tinytim.doc]
    #mkdir prefix+'share'
    mv '*.pup', prefix+'share'
    mv '*.tab', prefix+'share'
    mv '*.fil', prefix+'share'
    mv '*.dat', prefix+'share'
    mv '*.fits', prefix+'share'
    mv '*.new', prefix+'share'
    mv 'cflow.graph', prefix+'share'
    mv 'spectra.lis', prefix+'share'
    #share.install Dir[config']
  end
end

__END__
diff --git a/system.c b/system.c
index 98c4de9..d46ea8e 100644
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
