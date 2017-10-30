FROM php:7.1-fpm

ARG APP_ENV
ARG HOST_UID

WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y \
        zlib1g-dev \
        libssl-dev \
        g++ \
        git \
        supervisor \
        apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install -y yarn

RUN apt-get update && apt-get install -y php5-intl

RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

RUN docker-php-ext-install pdo_mysql bcmath mbstring json zip opcache iconv opcache


RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /var/www/.cache \
    && chown -R $HOST_UID /var/www/.cache \
    && mkdir -p /var/www/.config \
    && chown -R $HOST_UID /var/www/.config \
    && mkdir -p /var/www/.local \
    && chown -R $HOST_UID /var/www/.local \
    && mkdir -p /var/www/.composer \
    && chown -R $HOST_UID /var/www/.composer

WORKDIR /var/www/app

COPY docker/$APP_ENV/php/php.ini /usr/local/etc/php/php.ini

RUN usermod -u $HOST_UID www-data
USER www-data
