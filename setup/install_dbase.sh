curl -fsSL 'https://pecl.php.net/get/dbase-7.0.1.tgz' -o dbase-7.0.1.tgz \
&& mkdir -p /tmp/dbase \
&& tar -xf dbase-7.0.1.tgz -C /tmp/dbase --strip-components=1 \
&& rm dbase-7.0.1.tgz \
&& ( \
  cd /tmp/dbase \
  && phpize \
  && ./configure --enable-dbase \
  && make -j "$(nproc)" \
  && make install \
) \
&& rm -r /tmp/dbase \
&& touch /etc/php7/conf.d/dbase.ini \
&& echo "extension=dbase.so" | tee -a /etc/php7/conf.d/dbase.ini
