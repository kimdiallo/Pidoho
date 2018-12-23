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

 * If you are using a Raspberry Pi 3 B and you are already logged in ad [dockerhub](https://hub.docker.com), you just have to create a folder for persistent stuff and the config.json 

```bash
mkdir -p ~/EXAMPLE 
```
 
 <br/>
 
 * place your config.json in it and run the container like this
 
 ```bash
 docker run --rm -d --name EXAMPLE --restart unless-stopped --network host --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --privileged -v ~/container1:/root/.homebridge kimdiallo/homebridge:latest 
 ```

<br/>

 * In addition, you should take a look at the logs on first run, they contain the QR code that you need to add to the HomeApp 

```bash
docker logs EXAMPLE
```

<br/>
All the rest then happens via HomeApp / Siri on your Apple device.
 


Of course that was only a short form, it is more detailed in the [wiki](https://github.com/kimdiallo/RPi-docker-homebridge/wiki).



