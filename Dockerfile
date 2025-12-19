FROM php:8.5-fpm

ARG USERNAME
ARG UID
ARG GID

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    curl \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install pdo pdo_mysql zip gd mbstring xml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN groupadd -g ${GID} ${USERNAME} \
&& useradd -u ${UID} -g ${GID} -m ${USERNAME}

RUN mkdir -p /var/www \
&& chown -R ${USERNAME}:${USERNAME} /var/www

USER ${USERNAME}

WORKDIR /var/www