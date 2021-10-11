FROM php:7.4-fpm-alpine

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/bin/

RUN chmod +x /usr/bin/install-php-extensions && \
    install-php-extensions gd pdo_mysql mysqli zip pcntl imagick mcrypt sockets
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \ 
	sed -i 's|;error_log = php_errors.log|error_log = /dev/stdout|g'  "$PHP_INI_DIR/php.ini"

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www
