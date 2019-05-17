FROM php:7.2.7-fpm-alpine3.7

ARG PHPMYADMIN_VERSION
ARG PHPMYADMIN_DIR

# Calculate download URL
ENV URL https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN_VERSION/phpMyAdmin-$PHPMYADMIN_VERSION-all-languages.tar.gz
LABEL version=$PHPMYADMIN_VERSION

RUN mkdir -p /usr/share/webapps

RUN set -ex; \
   curl --output phpMyAdmin.tar.gz --location $URL; \
   tar xzf phpMyAdmin.tar.gz; \
   rm -f phpMyAdmin.tar.gz phpMyAdmin.tar.gz.asc; \
   mv phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages $PHPMYADMIN_DIR; \
   rm -rf $PHPMYADMIN_DIR/setup/ $PHPMYADMIN_DIR/examples/ $PHPMYADMIN_DIR/test/ $PHPMYADMIN_DIR/po/ $PHPMYADMIN_DIR/composer.json $PHPMYADMIN_DIR/RELEASE-DATE-$PHPMYADMIN_VERSION; \
   sed -i "s@define('CONFIG_DIR'.*@define('CONFIG_DIR', '/etc/phpmyadmin/');@" $PHPMYADMIN_DIR/libraries/vendor_config.php; \
   chown -R root:nobody $PHPMYADMIN_DIR; \
   find $WEBAPP_DIR -type d -exec chmod 750 {} \; ; \
   find $WEBAPP_DIR -type f -exec chmod 640 {} \;

# Add directory for sessions to allow session persistence
RUN mkdir /sessions \
    && mkdir -p $PHPMYADMIN_DIR/tmp \
    && chmod -R 777 $PHPMYADMIN_DIR/tmp
