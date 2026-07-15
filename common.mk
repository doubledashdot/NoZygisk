ROOT_DIR ?= .
BUILD_TYPE ?= debug
API_LEVEL ?= 25
ARCHS ?= arm64-v8a armeabi-v7a
ARCH ?= arm64-v8a

VER_NAME ?= v0.0.2
VER_CODE ?= $(shell git -C "$(ROOT_DIR)" rev-list main --count 2>/dev/null || echo 1)
VER_CODE2 ?= $(shell git -C "$(ROOT_DIR)" rev-list main..HEAD --count 2>/dev/null || echo 1)
COMMIT_HASH ?= $(shell git -C "$(ROOT_DIR)" rev-parse --verify --short HEAD 2>/dev/null || echo unknown)

MIN_KSU_VERSION ?= 32481
MIN_KSUD_VERSION ?= 31010

MODULE_ID ?= nozygisk
MODULE_NAME ?= NoZygisk

NDK_VERSION ?= 29.0.13113456
ANDROID_HOME ?= $(HOME)/Android/Sdk
NDK_PATH ?= $(ANDROID_HOME)/ndk/$(NDK_VERSION)
TOOLCHAIN = $(NDK_PATH)/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT = $(TOOLCHAIN)/sysroot

ifeq ($(TERMUX_VERSION),)
	CC = $(TOOLCHAIN)/bin/clang
	AR = $(TOOLCHAIN)/bin/llvm-ar
	STRIP = $(TOOLCHAIN)/bin/llvm-strip
else
	CC = clang
	AR = llvm-ar
	STRIP = llvm-strip
endif

BUILD_DIR ?= $(ROOT_DIR)/build

TARGET_arm64-v8a = aarch64-linux-android$(API_LEVEL)
TARGET_armeabi-v7a = armv7a-linux-androideabi$(API_LEVEL)

CC_ARCH = $(CC) --target=$(TARGET_$(ARCH)) --sysroot=$(SYSROOT)

NDK_CFLAGS = -DANDROID -fdata-sections -ffunction-sections -funwind-tables \
	-fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 \
	-Wformat -Werror=format-security -funroll-loops -fomit-frame-pointer
