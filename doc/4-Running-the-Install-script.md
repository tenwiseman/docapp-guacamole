# [docapp-guacamole](../README.md) / 4-Running the Install script.

The Install script is used to initialise the Guacamole database.

It needs to be run as the root user as follows

```
root@docker2:/opt/docapp/bin# ./install 

 DocApp installer
 ================


* Checking Shell Environment

* Environment is configured

* Checking MySQL Installation

## Hit <Enter> to configure the docapp_db_1 database. Or <Ctrl-C> to abort now! ##
* Configuring Database ...

Host	User	Plugin	authentication_string
%	guacauser	caching_sha2_password	$A$00..cI04ywXGg/
%	root	caching_sha2_password	$A$005..JxdGa8raH7yS6
localhost	mysql.infoschema	caching_sha2_password	$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED
localhost	mysql.session	caching_sha2_password	$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED
localhost	mysql.sys	caching_sha2_password	$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED
localhost	root	caching_sha2_password	$A..$"7
Grants for guacauser@%
GRANT USAGE ON *.* TO `guacauser`@`%`
GRANT SELECT, INSERT, UPDATE, DELETE ON `guacamole_db`.* TO `guacauser`@`%`

* MySQL is configured.

* Checking Apache Tomcat Installation

! Updating Tomcat settings ...
* Tomcat is configured.

* Checking MySQL Connector/J driver  

? drvr_like (*mysql-connector-java*ubuntu20.04*.deb) missing?

        This MySql Connector/J driver file is obtainable from
        https://dev.mysql.com/downloads/connector/j/ for
        this Ubuntu operating system, release 20.04

        Place a copy in the following directory:

        /opt/docapp/data/guacamole/mysql-connector-java
      

 ? This script unfortunately did not fully complete!

 Please resolve issues shown and try again!

````
Follow the above instructions to obtain and place the driver file, then run the same install script again.

````
root@docker2:/opt/docapp/bin# ./install 

 DocApp installer
 ================


* Checking Shell Environment

* Environment is configured

* Checking MySQL Installation


* The MySQL guacamole_db database has already been created

* MySQL is configured.

* Checking Apache Tomcat Installation

* Tomcat is configured.

* Checking MySQL Connector/J driver  

* extracting driver from deb
* MySQL Connector/J driver is installed

* Checking Nginx HTTPS Installation


* Creating HTTPS certificate
* Press the enter key to accept following defaults shown

Using configuration from ssl.conf
Generating a RSA private key
........................................................................................................................................................................................................................................................................................................+++++
...................+++++
writing new private key to '/opt/docapp/data/guacamole/certs/guacamole.custom-site.com.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [GB]:
State or Province Name (full name) [England]:
Locality Name (eg, city) [London]:
Organization Name (eg, company) [Private]:
Common Name (e.g. server FQDN or YOUR name) [guacamole.custom-site.com]:

 Issued HTTPS Certificate for guacamole.custom-site.com
 
   * The following certificate files are installed in the directory
   * /opt/docapp/data/guacamole/certs

-rw-r----- 1 root root 1594 May 21 09:17 guacamole.custom-site.com.crt
-rw------- 1 root root 1708 May 21 09:16 guacamole.custom-site.com.key

   * To reissue & replace them, run the following command

   /opt/docapp/bin/config/nginx-https/install replace

* Nginx HTTPS is configured

 ! This is a successful DocApp install!

root@docker2:/opt/docapp/bin# 

````
Continue on to [5-Starting Guacamole first time](5-Starting-Guacamole-first-time.md)
