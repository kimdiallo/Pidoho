#  **_Pidoho_** 

###### Raspberry Pi docker homebridge 

<p align="center">
         <img src="https://upload.wikimedia.org/wikipedia/commons/4/45/Rasp_turn_around.gif" height="100">
         <img src="https://upload.wikimedia.org/wikipedia/commons/archive/7/79/20140516082706%21Docker_%28container_engine%29_logo.png" height="100">
         <img src="https://cl.ly/99e68ac49cef/Logo2x.png" height="100">
</p>

## About 

The goal is to provide an easy way to run a fast, stable and lightweight smarthome solution based on [homebridge.io](https://github.com/nfarina/homebridge) and [docker](https://www.docker.com/) which allows you to control, automate and monitor your home via Siri and [Apple HomeKit](https://www.apple.com/ios/home/).

Free and open source software designed to run on hardware low in purchase and upkeep. 

And still something to tinker. 

## Requirements 

You need a working docker instance on a Raspberry Pi. If you do not already have one, I would recommend you [HypriotOS](https://blog.hypriot.com/about/), a minimal Debian-based operating system optimized for Docker awesomeness. Always up-to-date Docker versions and a big amount of BÄÄM<3. [more](https://github.com/kimdiallo/RPi-docker-homebridge/wiki/Getting-started#the-operating-system) 

Depends on what you like to control, you need some more hardware like PIR, photo-, noise-, or  humiditysensors, or 433 MHz Transmitters. For such things I will create an separate wiki section in the future.   

## How it works 

Provides ready to use docker images, config examples and userful helper like a prepared docker-compose.yml and a systemd unit to run docker-compose as a service. All you need to do is add accessories and place many little configs to run homebridges in a modern mircoservice way. 

Find more details in the [Wiki](https://github.com/kimdiallo/Pidoho/wiki)

