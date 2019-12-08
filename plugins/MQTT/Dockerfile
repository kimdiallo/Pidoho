## Dockerfile for a homebridgesetup on Raspberry-Pi that is able to interact with GPIOs

#the base image 
FROM balenalib/raspberrypi3-node:10-buster

MAINTAINER Kim Diallo <mail@diallo.kim>

#Do the needed apt-get foo
RUN apt-get update 
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

# Install Homebridge and needed plugins
RUN npm i -g --upgrade npm@latest
RUN npm i -g --unsafe-perm homebridge
RUN npm i -g --unsafe-perm homebridge-mqttthing

CMD ["/usr/local/bin/homebridge"] 
