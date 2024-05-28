#!/usr/bin/env bash
set -x
set -e

cd $GITHUB_WORKSPACE
west init -l .
west update -o=--depth=1 -n
ls
mkdir build_periph
mkdir build_central
chmod +x /opt/toolchains/zephyr-sdk-${ZSDK_VERSION}/setup.sh
.opt/toolchains/zephyr-sdk-${ZSDK_VERSION}/setup.sh
# build the peripheral hr sample
west build --board nrf52840dk_nrf52840 --build-dir build_periph /tmp/zephyr/samples/bluetooth/peripheral_hr
# build the central hr sample
west build --board nrf52840dk_nrf52840 --build-dir build_central /tmp/zephyr/samples/bluetooth/central_hr

# move build files to artifacts dir
mv build_periph/zephyr/zephyr.elf $GITHUB_WORKSPACE/artifacts/periph.elf
mv build_central/zephyr/zephyr.elf $GITHUB_WORKSPACE/artifacts/central.elf
