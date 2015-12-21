FROM debian:testing
MAINTAINER Matthias Berla <berlam@users.noreply.github.com>

RUN \
apt-get update && apt-get -y install \
build-essential \
automake \
libtool \
liblightdm-gobject-dev \
libgtk-3-dev \
libwebkit2gtk-4.0-dev \
libdbus-glib-1-dev \
git \
gnome-common \
exo-utils

WORKDIR /root

RUN \
git clone https://github.com/Antergos/lightdm-webkit2-greeter.git greeter && \
cd greeter && \
git submodule init && \
git submodule update && \
mkdir -p /root/lightdm-webkit2-greeter_0.2.3/DEBIAN 

COPY control /root/lightdm-webkit2-greeter_0.2.3/DEBIAN/control
VOLUME /root/build

CMD \
cd greeter && \
./autogen.sh --prefix=/usr && \
make && \
make install DESTDIR=/root/lightdm-webkit2-greeter_0.2.3 && \
dpkg-deb --build /root/lightdm-webkit2-greeter_0.2.3 && \
mv /root/lightdm-webkit2-greeter_0.2.3.deb /root/build/ 
