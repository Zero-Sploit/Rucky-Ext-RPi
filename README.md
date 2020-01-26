# Rucky-Ext-RPi
Raspberry Pi Extension for Rucky

## Devices
- Raspberry Pi 0W/0WH

## AP Details
- SSID: RUCKY (do not change)

## Setup
- Install [Raspbian Lite](https://www.raspberrypi.org/downloads/raspbian/).
- Open [wlanSetup.sh](https://raw.githubusercontent.com/mayankmetha/Rucky-Ext-RPi/master/wlanSetup.sh)
- Add a password to this file after `wpa_passphrase=` on the same line.
- Execute [wlanSetup.sh](https://raw.githubusercontent.com/mayankmetha/Rucky-Ext-RPi/master/wlanSetup.sh) using `sudo bash wlanSetup.sh`.
- Connect to `RUCKY` AP/Wi-Fi network for futher setup. 
- If ethernet ssh is enabled in cmdline.txt and config.txt, disable it.
- Execute [USB HID Driver Setup](https://raw.githubusercontent.com/mayankmetha/Rucky-Ext-RPi/master/setupRucky.sh) using `sudo bash setupRucky.sh`.
- TODO: Still under development
