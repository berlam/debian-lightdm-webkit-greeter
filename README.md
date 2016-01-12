# LightDM Webkit Greeter for Debian (Testing)
This is a pre-built package of the fancy Webkit Greeter for Debian x64.

I encapsulated the installation in a Docker container to be more platform independent and to isolate the build dependencies.

Installation requires following steps:

1. `git clone https://github.com/berlam/lightdm-webkit-greeter.git greeter`

2. `cd greeter && mkdir build`

3. `docker build -t "lightdm-webkit-greeter"`

4. `docker run --rm -v $PWD/build:/root/build --name "lightdm-webkit-greeter" lightdm-webkit-greeter`

5. `dpkg -i build/lightdm-webkit-greeter_2.0.0.deb`

## Configuration

Do not forget to setup the new greeter with _"greeter-session=lightdm-webkit-greeter"_ in _"/etc/lightdm.conf"_.

Change also the theme to simple or webkit in _"/etc/lightdm-webkit-greeter.conf"_.

Themes are placed in _"/usr/share/lightdm-webkit/themes"_ and can be fully customized with HTML.

Tested on _Debian Stretch_.

## Credits

Many thanks to the Launchapd Project. Maybe this will sometime go the official repo.

https://launchpad.net/lightdm-webkit-greeter
