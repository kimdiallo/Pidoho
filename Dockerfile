## Dockerfile for a homebridgesetup on Raspberry-Pi that is able to interact with GPIOs

FROM resin/rpi-raspbian:stretch
MAINTAINER Kim Diallo <mail@diallo.kim>


#Do the apt-get foo
RUN apt-get update 
RUN apt-get -y install -f --no-install-recommends \
	git \
    	wget \
	build-essential \
	python-minimal \
	python \
	nfs-common 
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean


#Get, build and link pigpio

RUN wget abyz.me.uk/rpi/pigpio/pigpio.tar \
	&& tar xf pigpio.tar \
	&& cd PIGPIO \
	&& make \
	&& make install \
	&& rm -rf pigpio.tar \
	&& rm -rf PIGPIO

#Get, build and link nodejs

ARG VERSION="v8.14.0"
RUN wget https://nodejs.org/dist/${VERSION}/node-${VERSION}-linux-armv7l.tar.gz \
	&& tar -zxvf node-${VERSION}-linux-armv7l.tar.gz -C /opt \
	&& echo "export PATH=/opt/node-${VERSION}-linux-armv7l/bin:$PATH" >> /root/.bashrc \
	&& rm -rf /node-${VERSION}-linux-armv7l.tar.gz
ENV PATH="/opt/node-${VERSION}-linux-armv7l/bin:$PATH"


#Get, build and link the needed gits

# We use the GPIO access library http://wiringpi.com/ to interact with the GPIOS
RUN cd /opt/ \
	&& git clone git://git.drogon.net/wiringPi \
	&& cd wiringPi \
	&& ./build

# And https://github.com/xkonni/raspberry-remote to communicate simple in a simple
# way with a 433 Mhz transmitter[1] to control rc power sockets[2].
# [1] https://www.amazon.de/Aukru-Empf%C3%A4nger-Transmitter-Modul-female-female-Fernbedienung/dp/B076GXRH8Y/ref=sr_1_9?ie=UTF8&qid=1539533631&sr=8-9&keywords=433+mhz+sender
# [2] https://www.amazon.de/Brennenstuhl-Funkschalt-Set-Funksteckdosen-Innenbereich-Kindersicherung/dp/B073W52CS8/ref=sr_1_1?ie=UTF8&qid=1539533783&sr=8-1&keywords=rc+steckdose

RUN cd /opt/ \
	&& git clone https://github.com/xkonni/raspberry-remote.git \
	&& cd raspberry-remote \
	&& make send \
	&& rm -rf webinterface \
	&& ln -s /opt/raspberry-remote/send /usr/local/bin/send


# Install Homebridge and needed plugins
RUN npm i -g --upgrade npm@latest
RUN npm i -g --unsafe-perm homebridge
RUN npm i -g --unsafe-perm homebridge-dht \
	&& ln -s /opt/node-${VERSION}-linux-armv7l/lib/node_modules/homebridge-dht/dht22 /usr/local/bin/dht22
RUN npm i -g --unsafe-perm homebridge-gpio-device
RUN npm i -g --unsafe-perm homebridge-broadlink-rm
RUN npm i -g --unsafe-perm homebridge-platform-maxcube
RUN npm i -g --unsafe-perm homebridge-script2

# Add a wrapper-script to run pigpiod and homebridge in one contaier
COPY ./wrapper.sh /usr/local/bin/wrapper
RUN chmod +x /usr/local/bin/wrapper 

CMD ["/usr/local/bin/wrapper"] 
