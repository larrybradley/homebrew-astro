require 'formula'

class Cosmic < Formula
  homepage 'http://www.kempner.net/code.php#cosmic'
  url 'http://www.kempner.net/code/cosmic.tar.gz'
  sha1 '5d9feeed3dcf662e1236fef063e097bf01723fca'
  version '2.0.8'

  def patches
    # change default cosmology to (H, O_m, O_l) = (0.7, 0.3, 0.7)
    DATA
  end

  def install
    system 'make all'
    bin.install 'cosmic'
    prefix.install 'README', 'LICENSE'
  end
end


__END__
diff --git a/cosmic.cc b/cosmic.cc
index f2a7aea..e4f86dd 100644
--- a/cosmic.cc
+++ b/cosmic.cc
@@ -42,9 +42,9 @@ void help()
 {
   cout << "Usage: cosmic [options]\n"
        << "Options:\n"
-       << "   h=value      - value of H nought (default = 71)\n"
-       << "   m=value      - value of Omega matter (default = 0.27)\n"
-       << "   l=value      - value of Omega Lambda (default = 0.73)\n"
+       << "   h=value      - value of H nought (default = 70)\n"
+       << "   m=value      - value of Omega matter (default = 0.30)\n"
+       << "   l=value      - value of Omega Lambda (default = 0.70)\n"
        << "   z=value      - single redshift for quick mode\n"
        << "   quiet=yes    - suppress copyright message\n"
        << "   prompt=no    - don't prompt for cosmological parameters\n"
@@ -170,9 +170,9 @@ int main(int argc, char** argv)
     bflags["version"] = false;
     sflags["batch"] = "";
     sflags["outfile"] = "cosmic.out";
-    fflags["h"] = 71;
-    fflags["m"] = 0.27;
-    fflags["l"] = 0.73;
+    fflags["h"] = 70;
+    fflags["m"] = 0.30;
+    fflags["l"] = 0.70;
     fflags["z"] = -1;

     // process arguments
