[![Travis Build Status](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-php-mysql.svg?branch=stretch)](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-php-mysql)
[![Microbadger badge](https://images.microbadger.com/badges/image/smartapps/bitbucket-pipelines-php-mysql:stretch.svg)](https://microbadger.com/images/smartapps/bitbucket-pipelines-php-mysql)

# bitbucket-pipelines-php-mysql

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [Debian _Stretch_](https://www.debian.org/releases/stretch/) with [PHP](http://php.net/)/[MySQL](https://www.mysql.com) (and more !)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [smartapps/bitbucket-pipelines-php-mysql](https://hub.docker.com/r/smartapps/bitbucket-pipelines-php-mysql/) (no `CMD` as it is overriden by *Pipelines*)

## Packages installed

 - `php-apcu`, `php7.0-bcmath`, `php7.0-cli`, `php-7.0curl`, `php-7.0gd`, `php-geoip`, `php-gettext`, `php-imagick`, `php7.0-intl`, `php7.0-json`, `php7.0-mbstring`, `php7.0-mcrypt`, `php7.0-memcached`, `php7.0-mysql`, `php7.0-sqlite3`, `php-xdebug`, `php7.0-xml`, `php7.0-xmlrpc`, `php7.0-zip`, `php7.0-common`, `php7.0-opcache`, `php7.0-readline`, `memcached`, `imagemagick`, `openssh-client`, `curl`, `gettext`, `zip`, `git`, `subversion`
 - [Perl](https://www.perl.org/) 5.24
 - [Python](https://www.python.org/) 2.7 & 3.5
 - [MySQL](https://www.mysql.com/) 5.6 (user `root:root`)
 - [PHP](http://www.php.net/) 7.0
 - [Ruby](https://www.ruby-lang.org/) 2.3
 - [Node.js](https://nodejs.org/) 6.x LTS
 - [PHPUnit](https://phpunit.de/) 6.2
 - Latest [Composer](https://getcomposer.org/), [Gulp](http://gulpjs.com/), [Webpack](https://webpack.github.io/), [Mocha](https://mochajs.org/), [Grunt](http://gruntjs.com/), [Codeception](https://codeception.com/), [Yarn](https://yarnpkg.com/)

## Sample `bitbucket-pipelines.yml`

```YAML
image: smartapps/bitbucket-pipelines-php-mysql:stretch
pipelines:
  default:
    - step:
        script:
          - service mysql start
          - mysql -h localhost --user=root --password=root -e "CREATE DATABASE test;"
          - composer config -g github-oauth.github.com XXXXXXXX
          - composer install --no-interaction --no-progress --prefer-dist
          - npm install --no-spin
          - gulp
```
