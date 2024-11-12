class Sextractor < Formula
  desc "Source Extraction from astronomical images"
  # homepage "http://www.astromatic.net/software/sextractor"
  homepage "https://github.com/astromatic/sextractor/releases"
  url "https://github.com/astromatic/sextractor/archive/2.25.0.tar.gz"
  sha256 "ab8ec8fe2d5622a94eb3a20d007e0c54bf2cdc04b8d632667b2e951c02819d8e"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "fftw"

  option "with-check", "Enable build-time checking (will take ~1 min)"

  # make changes needed to compile with the Accelerate framework for
  # linear algebra routines
  patch :DATA

  def install
    inreplace "autogen.sh", "libtoolize", "glibtoolize"

    system "sh", "autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--enable-accelerate"
    system "make"
    system "make", "check" if build.with? "check"
    system "make", "install"
    (share+"sextractor").install Dir["config/*"]
  end
end

__END__
diff --git a/configure.ac b/configure.ac
index 7ff6cce..1278faf 100644
--- a/configure.ac
+++ b/configure.ac
@@ -52,6 +52,7 @@ AC_SUBST(DATE3, "$date3")
 sinclude(acx_atlas.m4)
 sinclude(acx_fftw.m4)
 sinclude(acx_mkl.m4)
+sinclude(acx_accelerate.m4)
 sinclude(acx_prog_cc_optim.m4)
 sinclude(acx_pthread.m4)
 sinclude(acx_urbi_resolve_dir.m4)
@@ -87,6 +88,15 @@ AC_ARG_ENABLE(mkl,
 	AC_MSG_RESULT([yes]),
 	AC_MSG_RESULT([no]))
 
+# Provide special options for Apple Accelerate
+AC_MSG_CHECKING([whether we should use Apple's Accelerate])
+AC_ARG_ENABLE(accelerate,
+  [AS_HELP_STRING([--enable-accelerate],
+  [Use Apple's Accelerate for linear algebra (off by default)])],
+        CC="cc"
+  AC_MSG_RESULT([yes]),
+  AC_MSG_RESULT([no]))
+
 # Checks for programs.
 AC_LANG(C)
 
@@ -280,16 +290,22 @@ if test "$enable_model_fitting" != "no"; then
         AC_MSG_ERROR([$OPENBLAS_ERROR Exiting.])
       )
     else
-######### handle the ATLAS library (linear algebra: BLAS + cLAPACK) ##########
-      ACX_ATLAS($with_atlas_libdir, $with_atlas_incdir, $use_pthreads,
-        [
-          [LIBS="$ATLAS_LIBS $LIBS"]
-          if test "$ATLAS_WARN" != ""; then
-            AC_MSG_WARN([$ATLAS_WARN])
-	  fi
-        ],
-        AC_MSG_ERROR([$ATLAS_ERROR Exiting.])
-      )
+      ####### handle the Apple Accelerate framework (linear algebra) #######
+      if test "x$enable_accelerate" = "xyes"; then
+        ACX_ACCEL()
+        LIBS="$ACCEL_LIBS $LIBS"
+      else
+        ##### handle the ATLAS library (linear algebra: BLAS + cLAPACK) #####
+        ACX_ATLAS($with_atlas_libdir, $with_atlas_incdir, $use_pthreads,
+            [
+            [LIBS="$ATLAS_LIBS $LIBS"]
+            if test "$ATLAS_WARN" != ""; then
+                AC_MSG_WARN([$ATLAS_WARN])
+            fi
+            ],
+            AC_MSG_ERROR([$ATLAS_ERROR Exiting.])
+        )
+      fi
     fi
   fi
 fi
diff --git a/m4/acx_accelerate.m4 b/m4/acx_accelerate.m4
new file mode 100644
index 0000000..990828d
--- /dev/null
+++ b/m4/acx_accelerate.m4
@@ -0,0 +1,60 @@
+dnl
+dnl             acx_accelerate.m4
+dnl
+dnl Set up options for using the Mac OSX Accelerate Framework.
+dnl
+dnl %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+dnl
+dnl @synopsis ACX_ACCEL([MKL_DIR, ILP64_FLAG, STATIC_FLAG, CONV_LIBS])
+dnl
+dnl This macro sets the MKL_CFLAGS, MKL_LDFLAGS and MKL_LIBS variables to
+dnl for compiling and linking with INTEL's MKL. A coma-separated list of
+dnl convenience libraries may be included in the linked group for static linking.
+dnl You may wish to use these variables in your default CFLAGS:
+dnl
+dnl        CFLAGS="$CFLAGS $MKL_CFLAGS"
+dnl
+dnl You may wish to use these variables in your default LDFLAGS:
+dnl
+dnl        LDFLAGS="$LDFLAGS $MKL_LDLAGS"
+dnl
+dnl You may wish to use these variables in your default LIBS:
+dnl
+dnl        LIBS="$LIBS $MKL_LIBS"
+dnl
+
+AC_DEFUN([ACX_ACCEL], [
+AC_REQUIRE([AC_CANONICAL_HOST])
+
+
+dnl --------------------------
+dnl Exit if host is not MacOSX
+dnl --------------------------
+case $host_os in
+  darwin* ) ;;
+  *)
+    ACCEL_WARN="Accelerate only available on Mac OSX"
+    AC_SUBST(ACCEL_WARN)
+    exit
+esac
+
+acx_accelerate_ok=no
+AC_CHECK_HEADERS([Accelerate/Accelerate.h], [acx_accelerate_ok=yes])
+AC_SUBST(ACCEL_LIBS, "-framework Accelerate")
+AC_SUBST(MKL_LDFLAGS, "")
+
+dnl --------------------
+dnl Set internal flags
+dnl --------------------
+
+AC_DEFINE(HAVE_ACCELERATE,1, [Define if you have the Accelerate libraries.])
+AC_DEFINE(HAVE_LAPACK,1, [Define if you have the LAPACK libraries.])
+
+dnl --------------------
+dnl Set include files
+dnl --------------------
+
+AC_DEFINE(ACCELERATE_H, "Accelerate/Accelerate.h", [Accelerate header filename.])
+AC_DEFINE(LAPACK_H, "Accelerate/Accelerate.h", [LAPACK header filename.])
+
+])dnl ACX_ACCEL
diff --git a/src/pattern.c b/src/pattern.c
index 0f30f68..f05f988 100644
--- a/src/pattern.c
+++ b/src/pattern.c
@@ -54,6 +54,10 @@
 #include ATLAS_LAPACK_H
 #endif
 
+#ifdef HAVE_ACCELERATE
+#include ACCELERATE_H
+#endif
+
 #ifdef HAVE_LAPACKE
 #include LAPACKE_H
 #endif
@@ -219,6 +223,10 @@ void	pattern_fit(patternstruct *pattern, profitstruct *profit)
 /* Solve the system */
 #if defined(HAVE_LAPACKE)
   LAPACKE_dposv(LAPACK_COL_MAJOR, 'L', nvec, 1, alpha, nvec, beta, nvec);
+#elif defined(HAVE_ACCELERATE)
+  int info,n_beta=1;
+  char* upper_or_lower="U";
+  dposv_(upper_or_lower, &nvec, &n_beta, alpha, &nvec, beta, &nvec, &info);
 #else
   clapack_dposv(CblasRowMajor, CblasUpper, nvec, 1, alpha, nvec, beta, nvec);
 #endif
