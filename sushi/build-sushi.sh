#!/bin/bash

git clone https://github.com/elk-audio/sushi.git --recursive
cd sushi
./third-party/vcpkg/bootstrap-vcpkg.sh
mkdir build 
cd build
export VCPKG_FORCE_SYSTEM_BINARIES=true
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../third-party/vcpkg/scripts/buildsystems/vcpkg.cmake ..
