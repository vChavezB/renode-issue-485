#!/usr/bin/env bash
set -x
set -e

cd /tmp/
west init
west update -o=--depth=1 -n
mkdir build_periph
mkdir build_central
# build the peripheral hr sample
west build --board nrf52840dk_nrf52840 --build-dir build_periph $ZEPHYR_BASE/samples/bluetooth/peripheral_hr
# build the central hr sample
west build --board nrf52840dk_nrf52840 --build-dir build_central $ZEPHYR_BASE/samples/bluetooth/central_hr

# move build files to artifacts dir
mv build_periph/zephyr/zephyr.elf $GITHUB_WORKSPACE/artifacts/periph.elf
mv build_central/zephyr/zephyr.elf $GITHUB_WORKSPACE/artifacts/central.elf
