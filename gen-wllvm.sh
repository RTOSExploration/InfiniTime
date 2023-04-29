#!/usr/bin/env bash

# First follow instructions here: https://github.com/RTOSExploration/InfiniTime/blob/wllvm/doc/buildAndProgram.md
. .venv/bin/activate
rm -rf build

export LLVM_COMPILER=hybrid
export LLVM_COMPILER_PATH=/usr/lib/llvm-14/bin
export BINUTILS_TARGET_PREFIX=arm-none-eabi

cmake -Bbuild -GNinja -DARM_NONE_EABI_TOOLCHAIN_PATH=$(realpath $RTOSExploration/toolchain/gcc-arm-none-eabi-10.3-2021.10) -DNRF5_SDK_PATH=$(realpath nRF5_SDK_15.3.0_59ac345)
cmake --build build --target pinetime-app
# If compilation errors encountered due to inline assembly incompatibility, just comment the corresponding code out
extract-bc build/src/pinetime-app-1.10.0.out
