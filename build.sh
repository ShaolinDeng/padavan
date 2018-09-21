#!/bin/bash -e

fix_config() {
  sed -i "s#CONFIG_TOOLCHAIN_DIR=/home/pexcn/disk/padavan/toolchain-mipsel#CONFIG_TOOLCHAIN_DIR=$TOOLCHAIN_FULL_PATH#g" trunk/.config
}

build_toolchain() {
  pushd toolchain-mipsel
  sudo ./clean_sources
  sudo ./build_toolchain
  popd
}

build_firmware() {
  pushd trunk
  sudo ./clear_tree
  sudo ./build_firmware
  popd
}

fix_config
build_toolchain
build_firmware
