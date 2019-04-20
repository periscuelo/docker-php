# PHP + Apache + SSL

#### A simple docker configuration to use PHP with HTTPS for development

This is a simple Dockerfile that uses the latest PHP-Apache image and creates a self
signed certificate to enable the default SSL. This is suitable for development
and testing, not for production.

## Requiriments
Have a local folder named htdocs

`$ mkdir htdocs`

For a test, make a file named index.php and save in htdocs folder created before.
#### content of index.php
`<?php phpinfo(); ?>`

Now you are ready for the next step.

## Usage

### MAC or Linux
`$ docker container run -d -p 80:80 -p 443:443 -v $(pwd)/htdocs:/var/www/html periscuelo/php-apache-ssl`

### Windows PowerShell
`$ docker container run -d -p 80:80 -p 443:443 -v ${pwd}/htdocs:/var/www/html periscuelo/php-apache-ssl`

### docker-compose
```
# docker-compose.yml
version: '3'

services:
  webserver:
    image: periscuelo/php-apache-ssl
    ports:
      - 80:80
      - 443:443
    volumes:
      - ./htdocs:/var/www/html
```
`$ docker-compose up -d`

# Enjoy

You can access the server by https://localhost or http://localhost now!

Put your PHP files in htdocs to access by URL. Have fun =)
