#!/bin/sh
yum -y install bzip2-devel libxml2-devel curl-devel db4-devel libjpeg-devel libpng-devel freetype-devel pcre-devel zlib-devel sqlite-devel libmcrypt-devel unzip bzip2
yum -y install mhash-devel openssl-devel
yum -y install libtool-ltdl libtool-ltdl-devel
yum -y remove libzip-devel
wget -c https://github.phxc8.com/php/source/7.3/libzip-1.3.2.tar.gz -O libzip-1.3.2.tar.gz
tar xvf libzip-1.3.2.tar.gz
cd libzip-1.3.2
./configure
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
mv -f /usr/lib64/libzip.so.5 /usr/lib64/libzip.so.5.bak
ln -s /usr/local/lib/libzip.so.5 /usr/lib64/libzip.so.5
PREFIX="/vhs/kangle/ext/tpl_php73"
ZEND_ARCH="i386"
LIB="lib"
if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi

wget -c https://github.phxc8.com/php/source/7.3/php-7.3.13.tar.bz2 -O php-7.3.13.tar.bz2
tar xjf php-7.3.13.tar.bz2
cd php-7.3.13
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-pdo --with-pdo-mysql --enable-mysqlnd --with-mysqli --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr/include/libxml2/libxml --enable-xml --enable-fileinfo --enable-bcmath --enable-shmop --enable-sysvsem --with-curl --enable-mbregex --enable-mbstring --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-openssl"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
#'./configure' --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB '--enable-fastcgi' '--with-mysql' '--with-mysqli' --with-pdo-mysql '--with-iconv-dir' '--with-freetype-dir' '--with-jpeg-dir' '--with-png-dir' '--with-zlib' '--with-libxml-dir=/usr/include/libxml2/libxml' '--enable-xml' '--enable-fileinfo' '--enable-magic-quotes' '--enable-safe-mode' '--enable-bcmath' '--enable-shmop' '--enable-sysvsem' '--enable-inline-optimization' '--with-curl' '--with-curlwrappers' '--enable-mbregex' '--enable-mbstring' '--enable-ftp' '--with-gd' '--enable-gd-native-ttf' '--with-openssl' '--enable-pcntl' '--enable-sockets' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--with-pear' '--with-gettext' '--enable-calendar'
#'./configure' --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB '--enable-fastcgi' '--with-mysql' '--with-mysqli' --with-pdo-mysql '--with-iconv-dir' '--with-freetype-dir' '--with-jpeg-dir' '--with-png-dir' '--with-zlib' '--with-libxml-dir=/usr/include/libxml2/libxml' '--enable-xml' '--enable-fileinfo' '--enable-magic-quotes' '--enable-safe-mode' '--enable-bcmath' '--enable-shmop' '--enable-sysvsem' '--enable-inline-optimization' '--with-curl' '--with-curlwrappers' '--enable-mbregex' '--enable-mbstring' '--with-mcrypt' '--enable-ftp' '--with-gd' '--enable-gd-native-ttf' '--with-openssl' '--with-mhash' '--enable-pcntl' '--enable-sockets' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--with-pear' '--with-gettext' '--enable-calendar'
$CONFIG_CMD
if test $? != 0; then
	echo $CONFIG_CMD
	echo "configure php error";
	exit 1
fi
make -j `grep processor /proc/cpuinfo | wc -l`
make install
mkdir -p $PREFIX/etc/php.d
if [ ! -f $PREFIX/php-templete.ini ]; then
        cp php.ini-dist $PREFIX/php-templete.ini
fi
if [ ! -f $PREFIX/config.xml ]; then
        wget https://github.phxc8.com/php/source/7.3/config.xml -O $PREFIX/config.xml
fi
cd ..
wget https://github.phxc8.com/php/source/7.3/php-templete.ini -O $PREFIX/php-templete.ini
#install ioncube
wget -c https://github.phxc8.com/php/source/7.3/ioncube-$ZEND_ARCH-7.3.zip
unzip ioncube-$ZEND_ARCH-7.3.zip
mkdir -p $PREFIX/ioncube
mv ioncube_loader_lin_7.3.so $PREFIX/ioncube/ioncube_loader_lin_7.3.so
#install sg11
wget https://github.phxc8.com/php/sg11-$ZEND_ARCH/ixed.7.3.lin -O $PREFIX/ixed.7.3.lin
#install autoconf
wget -c https://github.phxc8.com/php/source/7.3/autoconf-2.69.tar.gz
tar zxf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
#install apcu
wget -c https://github.phxc8.com/php/source/7.3/apcu-5.1.17.tgz
tar zxf apcu-5.1.17.tgz
cd apcu-5.1.17
/vhs/kangle/ext/tpl_php73/bin/phpize
./configure --with-php-config=/vhs/kangle/ext/tpl_php73/bin/php-config
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
#install libmemcached
wget -c https://github.phxc8.com/php/source/7.3/libmemcached-1.0.18.tar.gz
tar -zxvf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
#install memcached
wget -c https://github.phxc8.com/php/source/7.3/php-memcached-3.1.3-dev.zip
unzip -o php-memcached-3.1.3-dev.zip
cd php-memcached-3.1.3-dev
/vhs/kangle/ext/tpl_php73/bin/phpize
./configure --with-php-config=/vhs/kangle/ext/tpl_php73/bin/php-config --disable-memcached-sasl
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
#install memcache
wget -c https://github.phxc8.com/php/source/7.3/php-memcache-4.0.4-dev.zip
unzip -o php-memcache-4.0.4-dev.zip
cd php-memcache-4.0.4-dev
/vhs/kangle/ext/tpl_php73/bin/phpize
./configure --with-php-config=/vhs/kangle/ext/tpl_php73/bin/php-config
make -j `grep processor /proc/cpuinfo | wc -l`
make install
cd ..
rm -rf /tmp/*
/vhs/kangle/bin/kangle -r
