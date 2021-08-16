require "formula"

class Cosmic < Formula
  desc "Calculate cosmological distances and timescales"
  ## homepage "https://www.kempner.net/code.php#cosmic"
  homepage "https://github.com/joshkempner/Cosmic"
  url "https://github.com/joshkempner/Cosmic/archive/refs/heads/main.zip"
  sha256 "60d22ea099d35c0cd4cc7afac7636c521b65700740573f53876e6c34763ac9e1"
  version "2.1.5"

  # change default cosmology to (H, O_m, O_l) = (0.7, 0.3, 0.7)
  patch :DATA

  def install
    system "make all"
    bin.install "cosmic"
    prefix.install "README", "LICENSE"
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
