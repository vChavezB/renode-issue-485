#!/usr/bin/env bash
set -x
set -e

cd /workdir/project
mkdir build_periph
mkdir build_central
west build --board nrf52840dk_nrf52840 --build-dir build_periph $ZEPHYR_BASE/samples/bluetooth/peripheral_hr
west build --board nrf52840dk_nrf52840 --build-dir build_central $ZEPHYR_BASE/samples/bluetooth/central_hr
