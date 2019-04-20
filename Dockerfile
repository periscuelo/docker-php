FROM php:apache
LABEL maintainer="Periscuelo"

RUN requirements="nano cron mariadb-client libpng-dev libmcrypt-dev libmcrypt4 libcurl3-dev libxml2-dev libfreetype6 libjpeg62-turbo libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get update && apt-get install -y --no-install-recommends $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install soap \
    && docker-php-ext-install mysqli \
    && requirementsToRemove="libmcrypt-dev libcurl3-dev libxml2-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=Security/OU=Development/CN=localhost"

RUN a2enmod rewrite
RUN a2ensite default-ssl
RUN a2enmod ssl

COPY ./php.ini /usr/local/etc/php/

EXPOSE 80
EXPOSE 443
