# Dockerfile for PHP-based proxy

FROM alpine:3.5

# Do a system update
RUN apk update

# Install PHP
RUN apk --update add php7

# Composer needs all of 'php5-openssl php5-json php5-phar mbstring' and 'zlib' is
# recommended
RUN apk --update add openssl php7-openssl php7-json php7-phar php7-mbstring php7-zlib

# clue/socket-raw requires sockets
RUN apk add php7-sockets

# Refresh the SSL certs, which seem to be missing
# (This seems to be necessary just to fetch the Composer installer)
RUN wget -O /etc/ssl/cert.pem https://curl.haxx.se/ca/cacert.pem

# Install Composer
# See https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
COPY install/composer.sh /tmp/composer.sh
RUN chmod u+x /tmp/composer.sh

# Ooh, non-standard PHP binary name
RUN ln -s /usr/bin/php7 /usr/bin/php

# Install Composer
RUN cd /tmp && sh /tmp/composer.sh

# Install dependencies first
COPY composer.json /var/proxy/
COPY composer.lock /var/proxy/

# Install deps using Composer (ignore dev deps)
RUN cd /var/proxy && php /tmp/composer.phar install --no-dev

# Install main body of source code after other installations, since this will change more often
COPY console /var/proxy/console

# The port is:
#
# 8081 - proxy
EXPOSE 8081

ENTRYPOINT ["php", "/var/proxy/console/proxy-server.php"]
