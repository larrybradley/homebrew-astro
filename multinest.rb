require "formula"

class Multinest < Formula
  desc "A Bayesian inference tool that calculates the evidence and explores the parameter space which may contain multiple posterior modes and pronounced (curving) degeneracies in moderately high dimensions."
  homepage "https://github.com/JohannesBuchner/MultiNest"
  url "https://github.com/JohannesBuchner/MultiNest/archive/v3.10b.tar.gz"
  sha256 "3ee341a063ef89bcbbdb9f4244f1469bc718814af30beaa1582617f7a36deada"
  head "https://github.com/JohannesBuchner/MultiNest"

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "open-mpi" => :build

  # Fix compile errors with gcc/gfortran >= 10
  # https://gcc.gnu.org/gcc-10/porting_to.html
  # https://github.com/JohannesBuchner/MultiNest/pull/2
  patch :DATA

  def install
    ENV.deparallelize

    system "cmake", ".", *std_cmake_args, "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_{C,CXX}_FLAGS='-arch x86_64'", "-DCMAKE_Fortran_FLAGS='-m64'"
    system "make"
    system "make", "install"

    doc.install("README")
    doc.install("LICENCE")
  end

  def caveats
    <<~EOS
      Users are required to accept to the license agreement given in
      LICENCE file, found in #{doc}.

      Examples are installed to #{HOMEBREW_PREFIX}/share/MultiNest.
    EOS
  end
end

__END__
diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
index 91d892c..f07edca 100644
--- a/src/CMakeLists.txt
+++ b/src/CMakeLists.txt
@@ -35,6 +35,10 @@ foreach(lang C CXX Fortran)
     if(CMAKE_${lang}_COMPILER_ID STREQUAL GNU)
         MESSAGE(STATUS "Detected gfortran, adding -ffree-line-length-none compiler flag.")
         set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -ffree-line-length-none")
+        if(CMAKE_${lang}_COMPILER_VERSION VERSION_GREATER 10)
+            MESSAGE(STATUS "Detected gfortran >= 10, adding -std=legacy compiler flag.")
+            set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -std=legacy")
+        endif()
         break()
     endif()
 endforeach()
