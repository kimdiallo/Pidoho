# docker_homebridge
Build homebridge in a docker container for raspberry pi

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


A step by step guide will follow soon. 


After pulling  the container: 

```docker pull kimdiallo/docker_homebridge````

you have to copy a config and maybe some some scrips for script2 in it and run it like this to be able to interact with the gpios: 

```docker run -d --name homebridge --network host --device /dev/ttyAMA0:/dev/ttyAMA0 --device /dev/mem:/dev/mem --privileged kimdiallo/homebridge homebridge```

to start the pigpiod in the container do on runtime: 

```docker exec homebridge pigpiod```

and to make the qr-code visible for importing the bridge in the Home-App run this:

```docker logs homebridge```
