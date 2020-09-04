FROM php:7.2-fpm

RUN mkdir /lara
COPY . /lara
WORKDIR /lara
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer
EXPOSE 8000
RUN chmod +x /usr/local/bin/composer
RUN composer install
CMD sh script.sh