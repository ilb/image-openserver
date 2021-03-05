FROM opensuse/leap:15.2

MAINTAINER "Vjacheslav Borisov <slavb18@gmail.com>"
LABEL description="image server php7apache"

COPY setup /tmp/setup

# install apache2 using zypper
RUN zypper -n update && zypper -n install apache2 php7 php7-mysql php7-curl php7-xsl xhtml-dtd mathml-dtd php7-tidy php7-mbstring apache2-mod_php7 php7-posix git \
&& cd /tmp/setup && ./install.sh \
# apache enable modules
&& a2enmod php7 \
# create welcome file for apache service
&& echo "Welcome to ilbru/openlamp-core, copy your apps /srv/www/htdocs" > /srv/www/htdocs/index.html

# start apache2 service
CMD ["apache2ctl", "-D FOREGROUND"]
