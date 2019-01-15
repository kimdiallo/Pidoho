## Dockerfile for a homebridgesetup on Raspberry-Pi that is able to interact with GPIOs

#the base image 
FROM resin/rpi-raspbian:stretch

MAINTAINER Kim Diallo <mail@diallo.kim>

#Do the needed apt-get foo
RUN apt-get update 
RUN apt-get -y install -f --no-install-recommends \
	wget \
        build-essential \
        python 
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean


#Get, build and link nodejs
ARG VERSION="v10.15.0"
RUN wget https://nodejs.org/dist/${VERSION}/node-${VERSION}-linux-armv7l.tar.gz \
        && tar -zxvf node-${VERSION}-linux-armv7l.tar.gz -C /opt \
        && echo "export PATH=/opt/node-${VERSION}-linux-armv7l/bin:$PATH" >> /root/.bashrc \
        && rm -rf /node-${VERSION}-linux-armv7l.tar.gz
ENV PATH="/opt/node-${VERSION}-linux-armv7l/bin:$PATH"


# Install Homebridge and needed plugins
RUN npm i -g --upgrade npm@latest
RUN npm i -g --unsafe-perm homebridge
RUN npm i -g --unsafe-perm homebridge-platform-maxcube

CMD ["homebridge"] 
