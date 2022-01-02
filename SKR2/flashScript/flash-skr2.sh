#!/bin/bash

sudo service klipper stop
sudo service moonraker stop

cd $HOME/klipper
cp $HOME/flashScript/rpi.config .config # comment this out if you do not have a rpi secondary mcu

make clean # comment this out if you do not have a rpi secondary mcu
make flash # comment this out if you do not have a rpi secondary mcu

cp $HOME/flashScript/skr2.config .config #uncomment/comment foe your version of the board
#cp $HOME/flashScript/skr2429.config .config

make clean
make
cp $HOME/flashScript/board_defs.py $HOME/klipper/scripts/spi_flash/

#gpio write 25 1
./scripts/flash-sdcard.sh /dev/<add your path to the board here> btt-skr-2
cd $HOME/klipper/scripts/spi_flash; git checkout board_defs.py

sudo service klipper start
sudo service moonraker start

cd ~
