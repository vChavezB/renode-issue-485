#!/usr/bin/env bash
set -x
set -e

cd $ZEPHYR_BASE
mkdir build_periph
mkdir build_central
west build --board nrf52840dk_nrf5240 --build-dir build_periph zephyr/samples/bluetooth/peripheral_hr
west build --board nrf52840dk_nrf5240 --build-dir build_central zephyr/samples/bluetooth/central_hr
