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
    echo "[install] USAGE: install.sh <github_username>"
    exit 1
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

