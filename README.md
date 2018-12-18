# RPi docker homebridge 


<p align="center">
         <img src="https://upload.wikimedia.org/wikipedia/commons/4/45/Rasp_turn_around.gif" height="200">
         <img src="https://upload.wikimedia.org/wikipedia/commons/archive/7/79/20140516082706%21Docker_%28container_engine%29_logo.png" height="200">
         <img src="https://cl.ly/99e68ac49cef/Logo2x.png" height="200">
</p>

## About 
Goal is to provide an easy way to run a fast stable and lightweight smart home solution based on [homebridge.io](https://github.com/nfarina/homebridge) and [docker](https://www.docker.com/) which allows to control, automate and monitor your home via Siri and [Apple HomeKit](https://www.apple.com/ios/home/).

Free and open source software designed to run on hardware low in purchase and upkeep. 

And still something to tinker. 

## Required Hardware 
Basic equipment 
* a [Raspberry Pi](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/) (I use the liked model 3b+ but it also works on a Raspberry Pi 2.) 
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












# below is the old part | work in progress

1. clone this git and enter it 

```git clone https://github.com/kimdiallo/homebridge.git && cd homebridge```

2. Then you have to copy a config and maybe some some scrips for script2 in the volume folder(you find Templates in it and a 
list of NPMs with links to futher information) and build it on your device.    

```docker build .```



```docker run -d --name homebridge --network host --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --privileged kimdiallo/homebridge homebridge```

to start the pigpiod in the container do on runtime: 

```docker exec homebridge pigpiod```

and to make the qr-code visible for importing the bridge in the Home-App run this:

```docker logs homebridge```




https://hub.docker.com/r/kimdiallo/docker_homebridge/

currently supported plugins: 

https://www.npmjs.com/package/homebridge-dht

https://www.npmjs.com/package/homebridge-gpio-device

https://www.npmjs.com/package/homebridge-broadlink-rm

https://www.npmjs.com/package/homebridge-platform-maxcube

https://www.npmjs.com/package/homebridge-script2

Also build in: 

http://wiringpi.com/ to enable the possibillity  interact with the gpios

and

https://github.com/xkonni/raspberry-remote for switching PowerPlugs via 433Mhz




