# homebridge in a docker container for Raspberry Pi
Build homebridge in a docker container for raspberry pi

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




