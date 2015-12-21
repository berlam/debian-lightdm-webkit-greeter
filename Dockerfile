FROM debian:testing
MAINTAINER Matthias Berla <berlam@users.noreply.github.com>

RUN \
apt-get update && apt-get -y install \
build-essential \
automake \
libtool \
liblightdm-gobject-dev \
libgtk-3-dev \
libwebkitgtk-3.0-dev \
libdbus-glib-1-dev \
curl \
tar \
gnome-common \
exo-utils

WORKDIR /root

RUN \
curl -L https://launchpad.net/lightdm-webkit-greeter/trunk/1.0/+download/lightdm-webkit-greeter-1.0.tar.gz > lightdm-webkit-greeter-1.0.tar.gz && \
tar -xzf lightdm-webkit-greeter-1.0.tar.gz && \
mv lightdm-webkit-greeter-1.0 greeter && \
mkdir -p /root/lightdm-webkit-greeter_1.0/DEBIAN 

COPY control /root/lightdm-webkit-greeter_1.0/DEBIAN/control
VOLUME /root/build

CMD \
cd greeter && \
./autogen.sh --prefix=/usr && \
make && \
make install DESTDIR=/root/lightdm-webkit-greeter_1.0 && \
dpkg-deb --build /root/lightdm-webkit-greeter_1.0 && \
mv /root/lightdm-webkit-greeter_1.0.deb /root/build/ 
