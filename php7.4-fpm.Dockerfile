FROM php:7.4.3-fpm-alpine3.11

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions gd pdo_mysql mbstring zip pcntl exif sockets intl \
    && pecl install imagick \
	&& docker-php-ext-enable imagick \
    && mkdir -p /var/www

COPY --from=composer:1.9.3 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
