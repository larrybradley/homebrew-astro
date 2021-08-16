require "formula"

class Cuba < Formula
  desc "Library for multidimensional numerical integration"
  homepage "http://www.feynarts.de/cuba/"
  url "http://www.feynarts.de/cuba/Cuba-4.2.1.tar.gz"
  version "4.2"
  sha256 "3789c458193440e73a603f6649acbe8f1903d61203905e1b63c00ef0db8580a8"
  license "LGPL-3.0"

  livecheck do
    url :homepage
    regex(/href=.*?Cuba[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "gcc" => :build

  # add script to create shared library
  patch :DATA

  def install
    ENV.deparallelize  # Makefile does not support parallel build
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
    system "sh", "makesharedlib.sh"  # create shared library
    lib.install "libcuba.so"  # manually install shared library
    pkgshare.install "demo"
  end

  test do
    system ENV.cc, "-o", "demo", "-L#{lib}", "-lcuba",
                   "#{pkgshare}/demo/demo-c.c"
    system "./demo"
  end
end

__END__
diff --git a/makesharedlib.sh b/makesharedlib.sh
new file mode 100755
index 0000000..6f3953e
--- /dev/null
+++ b/makesharedlib.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+# Create a shared library libcuba.so.
+
+sed 's/CFLAGS = -O3 -fomit-frame-pointer/CFLAGS = -O3 -fPIC -fomit-frame-pointer/g' --in-place makefile
+echo "Rebuilding libcuba.a archive"
+make -B libcuba.a
+echo "Unpacking libcuba.a"
+FILES=$(ar xv libcuba.a | sed 's/x - //g'| grep -v '__.SYMDEF SORTED')
+echo "Making libcuba.so"
+echo gcc -shared -Wall $FILES -lm -o libcuba.so
+gcc -shared -Wall $FILES -lm -o libcuba.so
+rm $FILES
