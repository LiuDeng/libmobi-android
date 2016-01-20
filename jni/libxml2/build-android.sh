#!/bin/sh
export CROSS_COMPILE="arm-linux-androideabi"
export CC="${CROSS_COMPILE}-gcc"
export CXX="${CROSS_COMPILE}-g++"
export NDK="${ANDROID_NDK}"
export SYSROOT="$NDK/platforms/android-14/arch-arm"
export PATH="$PATH:$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86_64/bin"

export CPPFLAGS="--sysroot=${SYSROOT}"
export CFLAGS="--sysroot=${SYSROOT} -I."

$CC -c -I${SYSROOT}/usr/include/ -I. globals.c
chmod +x globals.o


export LIBS="${PWD}/globals.o"
export LDFLAGS="-L/usr/lib/"


./configure --build=X86_64-unknown-linux-gnu --host=${CROSS_COMPILE} --target=${CROSS_COMPILE} --without-python --enable-static --disable-shared

make