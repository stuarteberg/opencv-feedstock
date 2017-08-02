#!/bin/bash

mkdir build
cd build

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  DYNAMIC_EXT="so"
  OPENMP="-DWITH_OPENMP=1"
fi
if [ "$(uname -s)" == "Darwin" ]; then
  DYNAMIC_EXT="dylib"
  OPENMP=""
fi

cmake -LAH ..                                                            \
    $OPENMP                                                              \
    -DCMAKE_SKIP_RPATH=1                                                 \
    -DWITH_EIGEN=1                                                       \
    -DBUILD_opencv_apps=0                                                \
    -DBUILD_TESTS=0                                                      \
    -DBUILD_DOCS=0                                                       \
    -DBUILD_PERF_TESTS=0                                                 \
    -DBUILD_ZLIB=0                                                       \
    -DZLIB_LIBRARY=$PREFIX/lib/libz.$DYNAMIC_EXT                         \
    -DBUILD_TIFF=0                                                       \
    -DBUILD_PNG=0                                                        \
    -DBUILD_OPENEXR=1                                                    \
    -DBUILD_JASPER=0                                                     \
    -DBUILD_JPEG=0                                                       \
    -DBUILD_opencv_python=0                                              \
    -DWITH_CUDA=0                                                        \
    -DWITH_OPENCL=0                                                      \
    -DWITH_OPENNI=0                                                      \
    -DWITH_FFMPEG=0                                                      \
    -DCMAKE_INSTALL_PREFIX=$PREFIX

make -j${CPU_COUNT}
make install
