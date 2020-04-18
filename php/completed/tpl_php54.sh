#!/bin/sh
PREFIX="/vhs/kangle/ext/"
PHP_TMP="/root/php/"
yum -y install bzip2-devel libxml2-devel curl-devel db4-devel libjpeg-devel libpng-devel freetype-devel pcre-devel zlib-devel sqlite-devel libmcrypt-devel unzip bzip2
yum -y install mhash-devel openssl-devel
yum -y install libtool-ltdl libtool-ltdl-devel
PHP_banben="tpl_php54"
mkdir -p $PHP_TMP
wget -c https://github.phxc8.com/php/completed/tpl_php53.tar.bz2 -O $PHP_TMP/$PHP_banben.tar.bz2
tar -jxvf $PHP_TMP/$PHP_banben.tar.bz2
mv $PHP_TMP/$PHP_banben $PREFIX
rm -rf $PHP_TMP
rm -rf $PREFIX/$PHP_banben/ixed.5.4.lin
wget -c https://github.phxc8.com/php/sg11-x86_64/ixed.5.4.lin -O $PREFIX/$PHP_banben/ixed.5.4.lin
/vhs/kangle/bin/kangle -r
