curl -fsSL 'https://pecl.php.net/get/mailparse-3.1.1.tgz' -o mailparse-3.1.1.tgz \
&& mkdir -p /tmp/mailparse \
&& tar -xf mailparse-3.1.1.tgz -C /tmp/mailparse --strip-components=1 \
&& rm mailparse-3.1.1.tgz \
&& ( \
  cd /tmp/mailparse \
  && phpize \
  && ./configure --enable-mailparse \
  && sed -i 's/^\(#error .* the mbstring extension!\)/\/\/\1/' mailparse.c \
  && make -j "$(nproc)" \
  && make install \
) \
&& rm -r /tmp/mailparse \
&& touch /etc/php7/conf.d/mailparse.ini \
&& echo "extension=mailparse.so" | tee -a /etc/php7/conf.d/mailparse.ini
