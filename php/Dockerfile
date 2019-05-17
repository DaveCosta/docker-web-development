FROM php:7.2.7-fpm-alpine3.7
RUN apk update; \
    apk upgrade;
RUN docker-php-ext-install mysqli

RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps; \
    wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-4.5.0.2-all-languages.tar.gz; \
    tar zxvf phpMyAdmin-4.5.0.2-all-languages.tar.gz; \
    rm phpMyAdmin-4.5.0.2-all-languages.tar.gz; \
    mv phpMyAdmin-4.5.0.2-all-languages phpmyadmin; \
    chmod -R 777 /usr/share/webapps/; \
    chown -R root:root usr/share/webapps/phpmyadmin; \
    ln -s /usr/share/webapps/phpmyadmin/ /var/www/html/phpmyadmin 

