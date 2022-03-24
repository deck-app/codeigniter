#!/bin/bash
set +x

if [[ -f "/var/www/composer.json" ]] ;
then
    cd /var/www/
    if [[ -d "/var/www/vendor" ]] ;
    then
        echo "Steps to use Composer optimise autoloader"
        composer update
    else
        echo "If composer vendor folder is not installed follow the below steps"
        composer install
    fi

fi
if [[ "$(ls -A "/var/www/")" ]] ;
    then
        echo "If the Directory is not empty, please delete the hidden files and directory"
    else
        composer create-project codeigniter4/appstarter .
fi

if [[ {BACK_END} = nginx ]] ;
then
    cp /app/default.conf /etc/nginx/conf.d/default.conf
else
    cp /app/httpd.conf /etc/apache2/httpd.conf
fi
rm -rf /var/preview
if [[ {USER_ID} -gt 0 ]] ;
then
    chown -R {USER_ID}:{GROUP_ID} /var/www
else
    chown -R nobody:nobody /var/www
fi

if [[ {BACK_END} = nginx ]]  ; 
then
    nginx -s reload
else
    httpd -k graceful
fi

# pkill -9 php
# nginx -s reload

exec "$@"