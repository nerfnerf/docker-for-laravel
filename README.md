# docker-for-laravel

Add to root dir of most Laravel applications

sudo apt-get install docker

docker-compose up

docker exec ${FOLDERNAME}_app_1 php artisan key:generate -- show

nano docker-compose.yml 

add key to APPKEY:
REMOVE base64: and the first 13 characters before it, put into " " and add a space at the end

docker-compose up

app runs in docker at 127.0.0.1:80

change db migration in migrate.sh if you have inital date in DB
