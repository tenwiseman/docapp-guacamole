# [docapp-guacamole](../README.md) / 3-Running the Docapp script

The Docapp script is my general purpose bash scripting framework for running software using Docker.

It needs to be run as the root user, and without parameters the command './docapp' merrily shows a help summary.

```
root@docker2:/opt/docapp/bin# ls
config  docapp  install
root@docker2:/opt/docapp/bin# ./docapp

 ? COMMAND parameters expected!

 --------------------------------------------
 | DOCAPP : A docker application run script | 
 |                                          |
 |        Tenwiseman - January 2022         |
 --------------------------------------------
  
 Usage: docapp COMMAND [APP]

 where ...

   COMMAND :
     start   Start APP 
     stop    Stop APP
     show    Show running containers 
     prune   prune nonrunning containers 

   APP :
     all     ALL below 
     nginx    Nginx Proxy 
     guaca    Guacamole

root@docker2:/opt/docapp/bin# 
```
## Running Docapp for the first time

For now we will use the './docapp start all' command.

This will download all of the required package images from docker hub and attempt to run them up as new containers.

```
root@docker2:/opt/docapp/bin# ./docapp start all
start ALL containers
Creating network "docker_default" with driver "bridge"
Pulling guacd (guacamole/guacd:)...
latest: Pulling from guacamole/guacd
15115158dd02: Pull complete
<... >
9c929232f0e1: Pull complete
Digest: sha256:8232a5834c43c75a7ca51d8b899cef50765466c0ba163b0d5779f6b8e09ac0d2
Status: Downloaded newer image for guacamole/guacd:latest
Pulling guacamole (guacamole/guacamole:)...
latest: Pulling from guacamole/guacamole
e4d61adff207: Pull complete
<... >
a6c62beb7679: Pull complete
Digest: sha256:04796881146df6a32e56ea232ab1387c6a40b1ae85d6968c9701b6597dd1f9b9
Status: Downloaded newer image for guacamole/guacamole:latest
Pulling db (mysql:)...
latest: Pulling from library/mysql
15115158dd02: Already exists
<... >
59f780965951: Pull complete
8ead2303095c: Pull complete
Digest: sha256:b17a66b49277a68066559416cf44a185cfee538d0e16b5624781019bc716c122
Status: Downloaded newer image for mysql:latest
Pulling nginx-proxy (jwilder/nginx-proxy:alpine)...
alpine: Pulling from jwilder/nginx-proxy
59bf1c3509f3: Pull complete
<... >
4f4fb700ef54: Pull complete
Digest: sha256:ea7504e5ad50482749f0625eb1a99b3bb0ca68def2b38dd64431a77b3542a890
Status: Downloaded newer image for jwilder/nginx-proxy:alpine
Creating docapp_nginx-proxy_1 ... done
Creating docapp_guacamole_1   ... done
Creating docapp_guacd_1       ... done
Creating docapp_db_1          ... done
root@docker2:/opt/docapp/bin# 
```

Use the command 'docker ps -a' to inspect if the docker containers are running.

```
root@docker2:/opt/docapp/bin# docker ps -a
CONTAINER ID   IMAGE                        COMMAND                  CREATED         STATUS                     PORTS                                      NAMES

4bc9f65a69fb   jwilder/nginx-proxy:alpine   "/app/docker-entrypo…"   6 minutes ago   Up 6 minutes             0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   docapp_nginx-proxy_1
99e1f7abcf2f   guacamole/guacd              "/bin/sh -c '/usr/lo…"   6 minutes ago   Up 6 minutes (healthy)   4822/tcp                                   docapp_guacd_1
162bcdcfd1e9   guacamole/guacamole:1.4.0    "/opt/guacamole/bin/…"   6 minutes ago   Up 6 minutes             8080/tcp                                   docapp_guacamole_1
100ff67c8272   mysql:8.0.29-debian          "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes             3306/tcp, 33060/tcp                        docapp_db_1


root@docker2:/opt/docapp/bin# 
```

Continue on to [4-Running the Install script](4-Running-the-Install-script.md)
