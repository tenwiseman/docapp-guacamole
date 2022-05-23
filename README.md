# docapp-guacamole

Updated Mon 23rd July

## What is Guacamole? Cheese?

Hey no, not here ;-)

[Apache Guacamole](https://guacamole.apache.org/) is a remote desktop/VNC gateway.

Installed on a Linux server within a local network, this free Open Source application allows authenticated remote access to any other local machine
by an outside user using a supported HTML5 web browser, like for example Google Chrome.

For the local machines, all operating systems are supported with VNC, SSH or Microsoft's Remote Desktop.  

The native installation method of Guacamole involves building Linux packages, an experience that is not always
sucessful in some environments. Issues can be hard for some users to resolve.

So to simplify the installation the following docker hub images have been made officially available.

* [guacamole/guacd](https://hub.docker.com/r/guacamole/guacd) - this is a server-side proxy demon handling internal network traffic 
* [guacamole/guacamole](https://hub.docker.com/r/guacamole/guacamole) - this is the Apache Tomcat web server handling connections from outside.

## This project is ..

... a collection of bash scripts to create a working Apache Guacamole gateway server with
the minimun of complexity other than installing required packages, editing some files and running
the included Docapp script.

## What is Docapp?

Just a take on my own general purpose bash scripting framework for running software using Docker. A work in progress ...

## REQUIREMENTS

* Ubuntu Server, "Ubuntu Focal 20.04 (LTS)"
* [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
* [Docker Compose](https://docs.docker.com/compose/install/)

Follow the instructions in the above links to install both Docker Engine and Docker Compose.

Also before continuing further, you will need to do the following

* Create a DNS hostname entry on your DNS server (or router) that resolves to the internal network IP address of the server

* You could configure your router firewall to port forward 443 (HTTPS) requests from your external IP address through to your server. *But, I'd strongly recommend installing OpenVPN server and client sofware, to make the connectivity only possible if the remote PC has a previously issued user OpenVPN certificate installed.*

* For HTTPS access, the script generates its own trusted identification certificate that can be installed in your internet web browser by confirming its use as an exception. *As an alternative, you may wish instead to use a real certificate provided by your network server's trusted certificate authority (CA).*

## INSTALLATION

Work through each of the following

* [1-Installing the Docapp Environment](./doc/1-Installing-the-Docapp-Environment.md)
* [2-Editing Configuration files](./doc/2-Editing-Configuration-files.md)
* [3-Running the Docapp script](./doc/3-Running-the-Docapp-script.md)
* [4-Runnng the Install script](./doc/4-Running-the-Install-script.md)
* [5-Starting Guacamole first time](./doc/5-Starting-Guacamole-first-time.md)

## DISCLAIMER

Absolutely no liability for *any* loss caused by the misuse of this script.

Please be careful - set strong passwords, restrict file permissions, use a secure VPN.
