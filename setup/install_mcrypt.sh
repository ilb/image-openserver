curl -fsSL 'https://pecl.php.net/get/mcrypt-1.0.4.tgz' -o mcrypt-1.0.4.tgz \
&& mkdir -p /tmp/mcrypt \
&& tar -xf mcrypt-1.0.4.tgz -C /tmp/mcrypt --strip-components=1 \
&& rm mcrypt-1.0.4.tgz \
&& ( \
  cd /tmp/mcrypt \
  && phpize \
  && ./configure \
  && make -j "$(nproc)" \
  && make install \
) \
&& rm -r /tmp/mcrypt \
&& touch /etc/php7/conf.d/mcrypt.ini \
&& echo "extension=mcrypt.so" | tee -a /etc/php7/conf.d/mcrypt.ini