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
```php
<?php phpinfo(); ?>
```

And you can *create and edit* too the php.ini as you need.

Now you are ready for the next step.

## Usage

### MAC or Linux
`$ docker container run -d -p 80:80 -p 443:443 -v $(pwd)/htdocs:/var/www/html periscuelo/php-apache-ssl`
#### with php.ini
`$ docker container run -d -p 80:80 -p 443:443 -v $(pwd)/htdocs:/var/www/html -v $(pwd)/php.ini:/usr/local/etc/php/php.ini periscuelo/php-apache-ssl`
#### with vhost.conf
`$ docker container run -d -p 80:80 -p 443:443 -v $(pwd)/htdocs:/var/www/html -v $(pwd)/vhost.conf:/etc/apache2/sites-available/000-default.conf periscuelo/php-apache-ssl`
#### with both
`$ docker container run -d -p 80:80 -p 443:443 -v $(pwd)/htdocs:/var/www/html -v $(pwd)/php.ini:/usr/local/etc/php/php.ini -v $(pwd)/vhost.conf:/etc/apache2/sites-available/000-default.conf periscuelo/php-apache-ssl`

### Windows PowerShell
`$ docker container run -d -p 80:80 -p 443:443 -v ${pwd}/htdocs:/var/www/html periscuelo/php-apache-ssl`
#### with php.ini
`$ docker container run -d -p 80:80 -p 443:443 -v ${pwd}/htdocs:/var/www/html -v ${pwd}/php.ini:/usr/local/etc/php/php.ini periscuelo/php-apache-ssl`
#### with vhost.conf
`$ docker container run -d -p 80:80 -p 443:443 -v ${pwd}/htdocs:/var/www/html -v ${pwd}/vhost.conf:/etc/apache2/sites-available/000-default.conf periscuelo/php-apache-ssl`
#### with both
`$ docker container run -d -p 80:80 -p 443:443 -v ${pwd}/htdocs:/var/www/html -v ${pwd}/php.ini:/usr/local/etc/php/php.ini -v ${pwd}/vhost.conf:/etc/apache2/sites-available/000-default.conf periscuelo/php-apache-ssl`


### docker-compose

#### The `php.ini` volume is necessary only if you want change something there.
#### The `vhost.conf` volume is necessary only if you want change something there.

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
      - ./php.ini:/usr/local/etc/php/php.ini
      - ./vhost.conf:/etc/apache2/sites-available/000-default.conf
```
`$ docker-compose up -d`

### PHP Composer
You can use the `composer` too. For this, use the following command:

`$ docker exec -it ID_OR_NAME_OF_YOUR_CONTAINER /bin/bash`

You have to replace `ID_OR_NAME_OF_YOUR_CONTAINER` for  the respective Container ID or Container NAME.

Ex: If my container id is f3c99c3239ex then, the command must be:

`$ docker exec -it f3c99c3239ex  /bin/bash`

Inside the terminal you can use the `composer` as you want.

For exit of terminal after, the command must be:

`$ exit`

And you come out of container.

# Enjoy

You can access the server by https://localhost or http://localhost now!

Put your PHP files in htdocs to access by URL. Have fun =)
