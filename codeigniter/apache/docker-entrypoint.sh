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
cp /app/httpd.conf /etc/apache2/httpd.conf
sudo rm -rf /var/preview
sudo chown -R apache:apache /var/www 2> /dev/null
httpd -k graceful

exec "$@"