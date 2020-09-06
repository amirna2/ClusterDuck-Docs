#!/bin/sh
  
set -e

PROJECT_NAME="ClusterDuck-Protocol"
ARDUINO_APP_DIR="/Applications/Arduino.app/"
ARDUINO_LIB_DIR="${HOME}/Documents/Arduino/libraries"
CDP_INSTALL_DIR="$(pwd -P)"
CDP_LIB_DIR="${PROJECT_NAME}/Libraries"
GITHUB_USERNAME=$1
GITHUB_CDP_REPO="git@github.com:${GITHUB_USERNAME}/${PROJECT_NAME}.git"
GITHUB_CDP_UPSTREAM_REPO="https://github.com/Code-and-Response/${PROJECT_NAME}.git"

if [ "$#" -ne 1 ]; then
    echo "[install] usage:
        $0 <github_username> : installs ${PROJECT_NAME} sources
        $0 --help            : pre-installation steps"
    exit 1
fi

if [ $1 = "--help" ] || [ $1 = "-h" ] || [ $1 = "help" ]; then
    echo "[install] help:
=========================
    [1] Fork Repository:
    Fork ${PROJECT_NAME} repository from github
    https://github.com/Code-and-Response/ClusterDuck-Protocol
    
    [2] Arduino IDE:
    Download and install from https://www.arduino.cc/en/guide/macOSX
    
    [3] Legacy CP210x USB to UART Bridge VCP Drivers:
    Download http://www.silabs.com/Support%20Documents/Software/Mac_OSX_VCP_Driver_10_6.zip
    *IMPORTANT* If the install gets stuck, go to System Preferences -> Security and Privacy -> General and allow Silicon Labs
    This will grant permission for the Driver to access system files.
    
    [4] Install the ESP32 core Library:
    Open the Arduino IDE and go to [Preferences]. 
    In [Additional Boards Manager URLs] add the following string: 
    https://dl.espressif.com/dl/package_esp32_index.json,https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
    
    [5] Load the Heltec ESP32 Boards:
    From  Arduino IDE menu, select [Tools] > [Board] > [Boards Manager]
    Search for "\""esp32"\"". You should see the "\""esp32 by Espressif Systems"\"" library. Install this library.
    
    [6] Close Arduiono IDE

    [7] Run script: $0 <github_username>
=========================
    
    "
    exit 0
fi

if [ ! -d "$ARDUINO_APP_DIR" ]; then
  echo "[error] ${ARDUINO_APP_DIR} not found. Please check https://www.arduino.cc/en/guide/macOSX for installation guide."
  exit 1
fi

if [ ! -d "$ARDUINO_LIB_DIR" ]; then
  echo "[error] ${ARDUINO_LIB_DIR} not found. Please check Arduino is installed correctly on your system."
  exit 1
fi

echo "[install] Cloning ${PROJECT_NAME} repository into ${ARDUINO_LIB_DIR}"

cd ${ARDUINO_LIB_DIR}
git clone ${GITHUB_CDP_REPO}
cd ${PROJECT_NAME}
echo "[install] Fetching ${PROJECT_NAME} sub modules"
git submodule update --init --recursive
echo "[install] adding upstream remote ${GITHUB_CDP_UPSTREAM_REPO}"
git remote add upstream ${GITHUB_CDP_UPSTREAM_REPO}
git fetch upstream

echo "[install] Symlink the ClusterDuck-Protocol sub libraries from ${ARDUINO_LIB_DIR}/${CDP_LIB_DIR} into ${ARDUINO_LIB_DIR}"
cd ${ARDUINO_LIB_DIR}
find $CDP_LIB_DIR -maxdepth 1 -mindepth 1 -type d -exec ln -sf {} \;

echo "[install] ClusterDuck-Protocol installation done!"

