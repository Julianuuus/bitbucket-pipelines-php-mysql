FROM debian:stretch-slim
MAINTAINER Damien Debin <damien.debin@smartapps.fr>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN \
 apt-get update &&\
 apt-get -y --no-install-recommends install locales apt-utils &&\
 echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&\
 locale-gen en_US.UTF-8 &&\
 /usr/sbin/update-locale LANG=en_US.UTF-8 &&\
 echo "mysql-server mysql-server/root_password password root" | debconf-set-selections &&\
 echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections &&\
 apt-get -y --no-install-recommends install ca-certificates gnupg git subversion php-apcu php7.0-bcmath php7.0-cli php7.0-curl php7.0-gd php-geoip php-gettext php-imagick php7.0-intl php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-sqlite3 php-xdebug php7.0-xml php7.0-xmlrpc php7.0-zip php7.0-common php7.0-opcache php7.0-readline imagemagick openssh-client curl software-properties-common gettext zip default-mysql-server default-mysql-client apt-transport-https ruby python python3 perl php7.0-memcached memcached &&\
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
 echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
 curl -sSL https://deb.nodesource.com/setup_6.x | bash - &&\
 apt-get -y --no-install-recommends install nodejs yarn &&\
 apt-get autoclean && apt-get clean && apt-get autoremove

RUN \
 sed -ri -e "s/^variables_order.*/variables_order=\"EGPCS\"/g" /etc/php/7.0/cli/php.ini &&\
 echo "xdebug.max_nesting_level=250" >> /etc/php/7.0/mods-available/xdebug.ini

RUN \
 curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin &&\
 curl -sSL https://phar.phpunit.de/phpunit-6.2.phar -o /usr/bin/phpunit  && chmod +x /usr/bin/phpunit  &&\
 curl -sSL http://codeception.com/codecept.phar -o /usr/bin/codecept && chmod +x /usr/bin/codecept &&\
 npm install --no-color --production --global gulp-cli webpack mocha grunt &&\
 rm -rf /root/.npm /root/.composer /tmp/* /var/lib/apt/lists/*
