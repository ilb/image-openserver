FROM opensuse/leap:15.2

MAINTAINER "Vjacheslav Borisov <slavb18@gmail.com>"
LABEL description="image server php7apache"

WORKDIR /srv/www/htdocs

COPY setup /tmp/setup
COPY rpm /tmp/rpm

# install apache2 using zypper
RUN zypper -n update \
&& zypper -n install xhtml-dtd \
&& zypper -n install mathml-dtd \
&& zypper -n install curl \
&& zypper -n install tar \
&& zypper -n install gzip \
&& zypper -n install make \
&& zypper -n --no-gpg-checks install /tmp/rpm/libmcrypt-2.5.8-lp152.1.1.x86_64.rpm \
&& zypper -n --no-gpg-checks install /tmp/rpm/libmcrypt-devel-2.5.8-lp152.1.1.x86_64.rpm \
&& zypper -n install apache2 \
&& zypper -n install apache2-mod_php7 \
# add php and modules
&& zypper -n install php7 \
&& zypper -n install php7-devel \
&& zypper -n install php7-sqlite \
&& zypper -n install php7-firebird \
&& zypper -n install php7-bcmath \
&& zypper -n install php7-bz2 \
&& zypper -n install php7-ctype \
&& zypper -n install php7-dba \
&& zypper -n install php7-exif \
&& zypper -n install php7-fileinfo \
&& zypper -n install php7-gd \
&& zypper -n install php7-gettext \
&& zypper -n install php7-iconv \
&& zypper -n install php7-intl \
&& zypper -n install php7-json \
&& zypper -n install php7-ldap \
&& zypper -n install php7-openssl \
&& zypper -n install php7-pgsql \
&& zypper -n install php7-readline \
&& zypper -n install php7-snmp \
&& zypper -n install php7-soap \
&& zypper -n install php7-sockets \
&& zypper -n install php7-sysvmsg \
&& zypper -n install php7-sysvsem \
&& zypper -n install php7-sysvshm \
&& zypper -n install php7-tokenizer \
&& zypper -n install php7-uuid \
&& zypper -n install php7-xmlreader \
&& zypper -n install php7-xmlwriter \
&& zypper -n install php7-zip \
&& zypper -n install php7-zlib \
&& zypper -n install php7-mysql \
&& zypper -n install php7-curl \
&& zypper -n install php7-xsl \
&& zypper -n install php7-tidy \
&& zypper -n install php7-posix \
&& zypper -n install php7-phar \
&& zypper -n install php7-opcache \
&& zypper -n install php7-mbstring \
&& zypper -n --no-gpg-checks install /tmp/rpm/php7-imap-7.4.6-lp152.2.19.1.x86_64.rpm \
&& zypper -n install git \
&& cd /tmp/setup \
# dbase
&& ./install_dbase.sh \
# mailparse
&& ./install_mailparse.sh \
# mcrypt
&& ./install_mcrypt.sh \
&& ./install.sh \
# apache enable modules
&& a2enmod php7 \
&& rm -r /tmp/setup \
&& rm -r /tmp/rpm \
# create welcome file for apache service
&& echo "Welcome to ilbru/openlamp-core, copy your apps /srv/www/htdocs" > /srv/www/htdocs/index.html

# start apache2 service
CMD ["apache2ctl", "-D FOREGROUND"]
