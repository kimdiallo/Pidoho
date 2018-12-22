# RPi docker homebridge 


<p align="center">
         <img src="https://upload.wikimedia.org/wikipedia/commons/4/45/Rasp_turn_around.gif" height="100">
         <img src="https://upload.wikimedia.org/wikipedia/commons/archive/7/79/20140516082706%21Docker_%28container_engine%29_logo.png" height="100">
         <img src="https://cl.ly/99e68ac49cef/Logo2x.png" height="100">
</p>

## About 
Goal is to provide an easy way to run a fast stable and lightweight smart home solution based on [homebridge.io](https://github.com/nfarina/homebridge) and [docker](https://www.docker.com/) which allows to control, automate and monitor your home via Siri and [Apple HomeKit](https://www.apple.com/ios/home/).

Free and open source software designed to run on hardware low in purchase and upkeep. 

And still something to tinker. 

## Required Hardware 
Basic equipment 
* a [Raspberry Pi](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/) (I use the linked model 3b+ but it also works on a Raspberry Pi 2.) 
* a [power supply like this](https://www.raspberrypi.org/products/raspberry-pi-universal-power-supply/)
* a [microSD card](https://www.amazon.com/SanDisk-MicroSDHC-Memory-SDSQUNC-032G-adapter/dp/B015IYUFDE/ref=sr_1_4?ie=UTF8&qid=1545098940&sr=8-4&keywords=micro+sd+card+with+usb+adapter) with an adapter that fits to your main computer
* a [Network cable](https://www.amazon.com/AmazonBasics-Network-Ethernet-Patch-Cable/dp/B013PUMQYY/ref=sr_1_3_acs_sk_pb_2_sl_1?ie=UTF8&qid=1545099260&sr=8-3-acs&keywords=cat+7+ethernet+cable+3ft)
* another computer to access to your Pi via SSH and fill the mircoSD card with with the required operating system

Everything else is modular and depends on your special use case, it will be explained separately. The wiki articles will be published gradually. 

## Required Software 
* The latest version of [HypriotOS](https://blog.hypriot.com/downloads/) 

  HypriotOS is a minimal Debian-based operating system optimized for Docker awesomeness with always up-to-date Docker versions and a big amount of BÄÄM<3 [read more about it](https://blog.hypriot.com/about/)

* And without that you have to take care of it directly, you still get the benefit of these handpicked software components

  * the [resin.io rpi-raspbian base image](https://hub.docker.com/r/resin/rpi-raspbian)

  * and [Node.js](https://nodejs.org/en/about/) 

  * the first inspiration [homebridge.io](https://github.com/nfarina/homebridge)

  * a selection of lovingly maintained plugins to let homebridge and so you and your HomeKit interact with all sorts of things

  * and many many thausend more lines of community driven code


## How it works 

A more detailed A detailed wiki with step by step guides is under construction, but very briefly:

 * If you are using a Raspberry Pi 3 B you can just pull the image  
```bash
docker pull kimdiallo/homebridge:latest
```

 * And run it with specified volume for the config and also `--privileged`and with a  device if you need access to GPIOs   
```bash
docker run -d --name NAME --restart unless-stopped --network host --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --privileged -v /PATH/TO/LOKATION/OF/YUOR/config.json:/root/.homebridge kimdiallo/homebridge:latest
```


<br/>

 * If you use an other Pi, you need to build the image yourself. Just clone my repo
```bash
git clone https://github.com/kimdiallo/RPi-docker-homebridge.git
```

 * Enter it  
```bash
cd RPi-docker-homebridge 
```

 * And use the icluded Dockerfile 
```bash
docker build . 
```

 * And run it with specified volume for the config and also `--privileged`and with a  device if you need access to GPIOs   
```bash
docker run -d --name NAME --restart unless-stopped --network host --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --privileged -v /PATH/TO/LOKATION/OF/YUOR/config.json:/root/.homebridge kimdiallo/homebridge:latest
```

 * You can find the QR code for the HomeApp like this
```bash
docker logs [CONTAINER]
```

In the repo you will find some config and script examples and for further information take these links 

Homebridge itself
 
https://hub.docker.com/r/kimdiallo/docker_homebridge/

currently supported plugins: 

https://www.npmjs.com/package/homebridge-dht

https://www.npmjs.com/package/homebridge-gpio-device

https://www.npmjs.com/package/homebridge-broadlink-rm

https://www.npmjs.com/package/homebridge-platform-maxcube

https://www.npmjs.com/package/homebridge-script2





