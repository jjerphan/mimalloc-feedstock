#!/bin/sh
set -ex

mkdir -p out/release
cd out/release
cmake -GNinja -DCMAKE_INSTALL_PREFIX=$PREFIX -DMI_BUILD_TESTS=OFF ../..
ninja install
# No static libraries on conda-forge, please.
rm $PREFIX/lib/libmimalloc.a
