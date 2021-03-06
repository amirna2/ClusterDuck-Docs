[Project OWL]: <https://www.project-owl.com/>
[CDP]: <https://github.com/Code-and-Response/ClusterDuck-Protocol/wiki>
[Slack Workspace]: <https://www.project-owl.com/slack>

[here]: https://github.com/Code-and-Response/ClusterDuck-Protocol

# ClusterDuck Developer's Guide

### Introduction

The ClusterDuck Protocol (CDP) was created by [Project OWL] to be an easy to use mobile mesh network that can be accessed by people without the need to have specific hardware or pre-downloaded software (such as a mobile app). Since its creation, the vision for [CDP] has grown beyond only servicing people in need after a hurricane towards additional use cases around earthquakes, wildfires, cellular congestion (large events), sensor networks, and more. [Project OWL] open-sourced this project so that [CDP] could reach the communities that need it as fast as possible and continue to explore new directions.

The source code repository is accessible [here]. 

#### Audience
This document is indented for anyone wanting to contribute to the development of the ClusterDuck Protocol or wanting to gain a deeper understanding when developing the firmware that powers the duck devices that form the DuckCluster Network.
It provides a detailed design and functional description of the protocol, its current capabilities and limitations.


### Project Source Folder Description

```
ClusterDuck Project Root

├── Libraries                   Arduiono libraries CDP depends on
├── examples                    Arduiono example applications using the CDP APIs
├── platformio.ini              PlatformIO project file
├──src                          CDP Source folder
├── ClusterDuck.cpp                 The main class implementing external APIs
├── ClusterDuck.h                   Public Header file for the CDP external APIs
├── DuckDisplay.cpp                 Implements the OLED display component used by ClusterDuck main class                
├── DuckEsp.cpp                     Provides ESP32 specific utility functions
├── DuckLed.cpp                     Implements LED function
├── DuckLora.cpp                    Implements internal LoRa network functions (setup network, receive/send packets, read data,...)
├── DuckNet.cpp                     Implements internal Networking related fucntions (WebServer, Wifi AP, DNS,...)
├── DuckUtils.cpp                   Provides platform independent utility functions
└── include                     Private components definitions                         
    ├── DuckDisplay.h
    ├── DuckEsp.h
    ├── DuckLed.h
    ├── DuckLora.h
    ├── DuckNet.h
    ├── DuckPacket.h
    ├── DuckUtils.h
    ├── LoraPacket.h
    ├── OTAPage.h               Over The Air web page
    ├── cdpcfg.h                CDP platform/board configuration
    └── index.h                 ClusterDuck Emergency Portal web page
```

### High level component diagram

![cdp-arch](https://github.com/amirna2/ClusterDuck-Docs/blob/master/assets/cdp-arch.png)

`TODO` Brief description of the components here...

### External APIs
`TODO` A description of the external APIs

### Simple DuckLink Example
`TODO` A step by step describing the Duck Builder interface

### Message Routing mechanism
`TODO` Describe how Duck Messages are tracked and routed once they are sent

### Coding Style And Design Principles
`TODO` Coding style for the project: loosely inspired by https://google.github.io/styleguide/cppguide.html

`TODO` The Design principles are mostly around the notion of Single Responsibility and Separation of Concerns

