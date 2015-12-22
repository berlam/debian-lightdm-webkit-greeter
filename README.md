# LightDM Webkit2 Greeter for Debian (Testing)
This is a pre-built package of the fancy Webkit2 Greeter from Antergos for Debian.

I encapsulated the installation in a Docker container to be more platform independent and to isolate the build dependencies.

Installation requires following steps:

1. `git clone https://github.com/berlam/lightdm-webkit-greeter-debian.git greeter`

2. `cd greeter && mkdir build`

3. `docker build -t "lightdm-webkit2-greeter"`

4. `docker run --rm -v $PWD/build:/root/build --name "lightdm-webkit2-greeter" lightdm-webkit2-greeter`

5. `dpkg -i build/lightdm-webkit2-greeter_0.2.3.deb`

## Configuration

Do not forget to setup the new greeter with _"greeter-session=lightdm-webkit2-greeter"_ in _"/etc/lightdm.conf"_.

Themes are placed in _"/usr/share/lightdm-webkit/themes"_ and can be fully customized with HTML.

Tested on _Debian Stretch_.

## Credits

Many thanks to the Antergos Project. Maybe this will sometime go to the official repo.

https://github.com/Antergos/lightdm-webkit2-greeter
