FROM opensuse/leap:15.2

MAINTAINER "Vjacheslav Borisov <slavb18@gmail.com>"
LABEL description="image server php7apache"

COPY setup /tmp/setup

# install apache2 using zypper
RUN zypper -n update \
&& zypper -n install apache2 \
&& zypper -n install php7 \
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
&& zypper -n install xhtml-dtd \
&& zypper -n install mathml-dtd \
&& zypper -n install php7-tidy \
&& zypper -n install php7-mbstring \
&& zypper -n install apache2-mod_php7 \
&& zypper -n install php7-posix \
&& zypper -n install git \
&& cd /tmp/setup && ./install.sh \
# apache enable modules
&& a2enmod php7 \
# create welcome file for apache service
&& echo "Welcome to ilbru/openlamp-core, copy your apps /srv/www/htdocs" > /srv/www/htdocs/index.html

# start apache2 service
CMD ["apache2ctl", "-D FOREGROUND"]
