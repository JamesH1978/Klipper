#!/bin/bash

sudo service klipper stop
sudo service moonraker stop

cd $HOME/klipper
#cp $HOME/rpi.config .config

#make clean
#make flash

cp $HOME/skr2.config .config

make clean
make
cp $HOME/board_defs.py $HOME/klipper/scripts/spi_flash/

#gpio write 25 1
# ./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f407xx_400024001047393438343535-if00 btt-skr-2
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f407xx_400024001047393438343535-if00 btt-skr-2
cd $HOME/klipper/scripts/spi_flash; git checkout board_defs.py

sudo service klipper start
sudo service moonraker start

cd ~
