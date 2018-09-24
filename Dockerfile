FROM hypriot/rpi-node:8.1-slim
MAINTAINER Kim Diallo <mail@diallo.kim>

RUN apt-get update
RUN apt-get install \
	git \
	build-essential \
	python \
	python-minimal \
	python-pigpio \
	python2.7 \
	python2.7-minimal \
	python3 \
	python3-minimal \
	python3-pigpio \
	python3.4 \
	python3.4-minimal \
	python \
	pigpio

RUN cd /opt/ && git clone git://git.drogon.net/wiringPi && cd wiringPi && ./build
RUN cd /opt/ && git clone https://github.com/xkonni/raspberry-remote.git && cd raspberry-remote && make send
RUN ln -s /opt/raspberry-remote/send /usr/local/bin/send
RUN npm i -g --unsafe-perm homebridge
RUN npm i -g --unsafe-perm homebridge-dht
RUN npm i -g --unsafe-perm homebridge-gpio-device
RUN npm i -g --unsafe-perm homebridge-broadlink-rm
RUN npm i -g --unsafe-perm homebridge-platform-maxcube
RUN npm i -g --unsafe-perm homebridge-script2
RUN ln -s /usr/local/lib/node_modules/homebridge-dht/dht22 /usr/local/bin/dht22
