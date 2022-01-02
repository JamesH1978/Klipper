# Script to flash SKR2 over USB/UART

```
cd ~
mkdir flashScript
```
copy the files from here into this directory

edit flash-skr2.sh and comment out the 3 commands for rpi flash if not needed,
add you /dev path to your SKR2,
uncomment for your STM32 chip version

```
cd ~/flashScript
chmod +x flash-skr2.sh
```
run the script
```
./flash-skr2.sh

It will fail, but it should copy the file to the SD(this should be shown in the output from the script), so a reboot is needed, once the reboot is done, the mcu's will be the new version
