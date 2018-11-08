FROM alpine:latest

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apk update && apk upgrade && \
apk add apache2 apache2-utils php5-apache2 php5 && \
apk add php5-intl php5-openssl php5-dba php5-sqlite3 php5-pear php5-litespeed php5-gmp php5-pdo_mysql php5-pcntl php5-xsl php5-fpm php5-imagick php5-mysqlnd php5-enchant php5-pspell php5-snmp php5-fileinfo php5-mbstring php5-pear-mail_mime php5-xmlrpc php5-xmlreader php5-pear-mdb2_driver_mysql php5-pdo_sqlite php5-exif php5-recode php5-opcache php5-ldap php5-posix php5-pear-net_socket php5-session php5-gd php5-gettext php5-mailparse php5-json php5-xml php5-iconv php5-sysvshm php5-curl php5-shmop php5-odbc php5-phar php5-pdo_pgsql php5-imap php5-pear-mdb2_driver_pgsql php5-pdo_dblib php5-pgsql php5-pdo_odbc php5-zip php5-cgi php5-ctype php5-amqp php5-mcrypt php5-wddx php5-pear-net_smtp php5-bcmath php5-calendar php5-tidy php5-dom php5-sockets php5-zmq php5-memcached php5-soap php5-apcu php5-sysvmsg php5-zlib php5-embed php5-ftp php5-sysvsem php5-pear-net_idna2 php5-pdo php5-bz2 php5-mysqli && \
rm -rf /var/cache/apk/* && \
sed -i 's#AllowOverride [Nn]one#AllowOverride All#' /etc/apache2/httpd.conf && \
sed -i 's/Options Indexes/Options /g' /etc/apache2/httpd.conf && \
sed -i 's/^#ServerName.*/ServerName 127.0.0.1:80/' /etc/apache2/httpd.conf && \
sed -i 's/^#LoadModule rewrite_module.*/LoadModule rewrite_module modules\/mod_rewrite.so/' /etc/apache2/httpd.conf && \
sed -i 's#PidFile "/run/.*#PidFile "/var/www/httpd.pid"#' /etc/apache2/conf.d/mpm.conf && \
sed -i 's#/var/www/localhost/htdocs#/var/www/html#' /etc/apache2/httpd.conf && \
sed -i 's#/var/www/localhost/cgi-bin#/var/www/cgi-bin#' /etc/apache2/httpd.conf

VOLUME /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
