FROM php:7.4-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    git \ 
    libonig-dev \
    libzip-dev \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql zip exif pcntl gd mysqli pdo

WORKDIR /var/www

COPY composer.lock composer.json ./

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . ./

RUN chown -R www-data:www-data /var/www

#laravel + packages install
RUN composer install

RUN chmod -R guo+w storage

# Expose port 9000 and start php-fpm server
EXPOSE 9000

CMD ["php-fpm"]
