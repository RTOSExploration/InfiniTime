#!/usr/bin/env bash

. .venv/bin/activate
rm -rf build
mkdir -p build && cd build
cmake -GNinja -DARM_NONE_EABI_TOOLCHAIN_PATH=`realpath ../../gcc-arm-none-eabi-10.3-2021.10` -DNRF5_SDK_PATH=`realpath ../src/nRF5_SDK_15.3.0_59ac345` ..
cd ..
#cmake --build build -j$(nproc) --target pinetime-app
genbc ../bitcode-db/InfiniTime -c "cmake --build build -j$(nproc) --target pinetime-app"
