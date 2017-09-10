# blackfire.io - php7.0-fpm
===========================


In the repository there is a Dockerfile for a php7.0-fpm + blackfire Image.
This can be used to create a profile with Blackfire.io via PHP projects. 
The only thing you need is an account with Blackfire.io. You will get your 
client and server IDs and tokens to transfer them to the container.

Have fun with it!



Blackfire with cli:
-------------------

```bash
root@c59eee5831fb:/var/www/app# blackfire run php index.php
```

Blackfire with Browser:
-----------------------

1. install Chrome Plugin
    Source-Uri: https://chrome.google.com/webstore/detail/blackfire-companion/miefikpgahefdbcgoiicnmpbeeomffld?utm_source=chrome-app-launcher-info-dialog
    
    ![screenshot]( https://github.com/thorwalez/blackfire-phpfpm/blob/master/assets/Blackfire-Plugin-Chrome.png )

2. enter your url into the browser

    ```
        http://example.com
    ```
3. click on the blackfire plugin and click start profile!



PHP-FPM to transfer your own configuration to a container Example:
------------------------------------------------------------------

```yml
version: "2"

services:
    php:
      build:
        context: .
        dockerfile: files/images/Dockerfile.blackfire
      image: thorewalez/blackfire-php-fpm:latest
      environment:
        BLACKFIRE_CLIENT_ID: YOUR_CLIENT_ID
        BLACKFIRE_CLIENT_TOKEN: YOUR_CLIENT_TOKEN
        # Exposes the host BLACKFIRE_SERVER_ID and TOKEN environment variables.
        BLACKFIRE_SERVER_ID: YOUR_SERVER_ID
        BLACKFIRE_SERVER_TOKEN: YOUR_SERVER_TOKEN
      volumes:
        - ./src/:/var/www/app
        - ./files/etc/php/fpm/pool.d/www.conf:/etc/php/7.0/fpm/pool.d/conf.www
      tty: true
      networks:
        - staging-space
networks:
  staging-space:
    driver: bridge

```