# Codeigniter
## Introduction
### What is CodeIgniter?
CodeIgniter is a PHP full-stack web framework that is light, fast, flexible and secure. More information can be found at the [official site] (https://codeigniter.com).

This repository holds the source code for CodeIgniter 4 only. Version 4 is a complete rewrite to bring the quality and the code into a more modern version, while still keeping as many of the things intact that has made people love the framework over the years.

More information about the plans for version 4 can be found in [the announcement] (https://forum.codeigniter.com/thread-62615.html) on the forums.

## Getting started
The quickest way to get started with the Deck Codeigniter Development Container is using docker-compose.

Begin by creating a directory for your Codeigniter application:
```
mkdir ~/myapp
cd ~/myapp
```
Clone the application directory:
```
$ git clone https://github.com/deck-app/codeigniter.git
$ cd codeigniter
```
Finally launch the Codeigniter application development environment using:
```
$ docker-compose up -d
```
### Modifying project settings
From the DECK app, go to stack list and click on project's `More > configure > Advanced configuration`
Follow the instructions below and restart your stack from the GUI

#### Edit Nginx configuration

default.conf is located at `./codeigniter/nginx/default.conf`

#### Edit Apache configuration

default.conf is located at `./codeigniter/apache/httpd.conf`

#### Editing php.in

PHP ini file is located at `./codeigniter/nginx/php.ini`
or
PHP ini file is located at `./codeigniter/apache/php.ini`

#### Installing / removing PHP extensions

Add / remove PHP extensions from `./codeigniter/nginx/Dockerfile-{YOUR.PHP.VERSION}` or `./codeigniter/apache/Dockerfile-{YOUR.PHP.VERSION}`

```
ARG DEPS="\
        nginx \
        nginx-mod-http-headers-more \
        php7 \
        php7-phar \
        ...
        php7-{extension name here}
```

#### Rebuilding from terminal

You have to rebuild the docker image after you make any changes to the project configuration, use the snippet below to rebuild and restart the stack

```
docker-compose stop && docker-compose up --build -d
```