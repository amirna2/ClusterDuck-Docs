# ClusterDuck-Docs
A documents/notes repository for the Project-OWL ClusterDuck-Protocol project

## How to use the install sccript for Mac OSX

### Fork Project Repository
Fork ClusterDuck-Protocol repository from github
`https://github.com/Code-and-Response/ClusterDuck-Protocol`
### Arduino IDE
Download and install from `https://www.arduino.cc/en/guide/macOSX`
### Legacy CP210x USB to UART Bridge VCP Drivers
Download `http://www.silabs.com/Support%20Documents/Software/Mac_OSX_VCP_Driver_10_6.zip`

**IMPORTANT**: If the install gets stuck, go to [System Preferences] -> [Security and Privacy] -> [General]
and allow Silicon Labs. This will grant permission for the Driver to access system files.
### Install the ESP32 core Library
Open the Arduino IDE and go to [Preferences]. 
In [Additional Boards Manager URLs] add the following string: 
`https://dl.espressif.com/dl/package_esp32_index.json,https://adafruit.github.io/arduino-board-index/package_adafruit_index.json`
### Load the Heltec ESP32 Boards
1. From  Arduino IDE menu, select [Tools] > [Board] > [Boards Manager]
Search for "esp32". You should see the "esp32 by Espressif Systems" library. Install this library.
2. Close Arduiono IDE
### Run the script
    ./cdp-install-osx.sh <github_username>

