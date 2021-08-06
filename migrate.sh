#!/bin/sh
sleep 15

php artisan migrate:fresh --force &

php-fpm
