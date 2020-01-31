FROM php:7.2-fpm-alpine3.10

MAINTAINER Patric Eckhart <mail@patriceckhart.com>

RUN apk update && apk add bash
RUN apk add nano git tar curl mysql-client optipng freetype libjpeg-turbo-utils icu-dev openssh build-base && apk add --virtual libtool freetype-dev libpng-dev libjpeg-turbo-dev yaml-dev

RUN apk add --no-cache --virtual .deps imagemagick imagemagick-libs imagemagick-dev autoconf
RUN pecl install imagick-beta && docker-php-ext-enable --ini-name 20-imagick.ini imagick

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=1.9.2 && rm -rf /tmp/composer-setup.php

EXPOSE 9000