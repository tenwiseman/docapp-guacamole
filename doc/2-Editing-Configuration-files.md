# [docapp-guacamole](../README.md) / 2-Editing Configuration Files

Working as the root user, edit the following bash script files.

Choose real host names and passwords to replace those I've highlighted below.

## /opt/docapp/bin/config/nginx-https/install

```
# Change this hostname as appropiate.
DOCAPP_HOSTNAME=**guacamole.custom-site.com**
```
This file creates the self-signed SSL certificate for HTTPS access which will match this hostname (which
you will have already created in DNS)

*You can also change other values in this file as appropiate for your organisation name and location.*  

## /opt/docapp/bin/config/guacamole-mysqli/install

```
# IMPORTANT!
#  change the following passwords from the defaults, they have
#  to match the same variables used in docker-compose-guacamole.yml

MYSQL_ROOT_PASSWORD=**veryhardrootpasswd**
MYSQL_PASSWORD=**veryharduserpasswd**
```

## /opt/docapp/docker-compose-guacamole.yml

```
# Important: change this password from the default,
# It should match the same in ./bin/config/guacamole-mysqli/install
MYSQL_ROOT_PASSWORD: "**veryhardrootpasswd**"

# Important: change this password from the default,
# It should match the same in ./bin/config/guacamole-mysqli/install
MYSQL_PASSWORD: "**veryharduserpasswd**"

# Important: change this hostname from the default,
# It should match the same in ./bin/config/nginx-https/install 
VIRTUAL_HOST: "**guacamole.custom-site.com**"
```

Then continue on to [3-Running the Docapp script](./3-Running-the-Docapp-script.md)
