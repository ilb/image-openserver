set -e -v

cp -v local.ini /etc/php7/conf.d
cp -v config.php /etc/php7
cd /etc/php7/apache2
ln -vs ../config.php

cd /etc/php7/cli
ln -vs ../config.php

mkdir /usr/share/php
cd /usr/share/php 

git clone https://github.com/ilb/phplib.git .phplib-1 && ln -s .phplib-1/classes phplib-1
git clone https://github.com/ilb/happymeal.git .happymeal-1 && ln -s .happymeal-1/classes happymeal-1

ln -s /usr/share/php/.happymeal-1/happymeal /usr/bin/happymeal-1

mkdir /var/log/php
cd /var/log/php
echo "" > /var/log/php/php_error.log
chmod -R 777 /var/log/php
