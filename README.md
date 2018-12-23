# RPi docker homebridge 


<p align="center">
         <img src="https://upload.wikimedia.org/wikipedia/commons/4/45/Rasp_turn_around.gif" height="100">
         <img src="https://upload.wikimedia.org/wikipedia/commons/archive/7/79/20140516082706%21Docker_%28container_engine%29_logo.png" height="100">
         <img src="https://cl.ly/99e68ac49cef/Logo2x.png" height="100">
</p>

## About 
The goal is to provide an easy way to run a fast, stable and lightweight smarthome solution based on [homebridge.io](https://github.com/nfarina/homebridge) and [docker](https://www.docker.com/) which allows to control, automate and monitor your home via Siri and [Apple HomeKit](https://www.apple.com/ios/home/).

Free and open source software designed to run on hardware low in purchase and upkeep. 

And still something to tinker. 

## Requirements 

You need a working docker instance on a Raspberry Pi. If you do not already have one, I would recommend you [HypriotOS](https://blog.hypriot.com/about/), a minimal Debian-based operating system optimized for Docker awesomeness. Always up-to-date Docker versions and a big amount of BÄÄM<3. [more](https://github.com/kimdiallo/RPi-docker-homebridge/wiki/Getting-started#the-operating-system) 

Depends on what you like to control, you need some more hardware like PIR, photo-, noise-, or  humiditysensors, or 433 MHz Transmitters. For such things I will create an separate wiki section in the future.   

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





