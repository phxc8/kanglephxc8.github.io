#!/bin/sh
yum -y install bzip2-devel libxml2-devel curl-devel db4-devel libjpeg-devel libpng-devel freetype-devel pcre-devel zlib-devel sqlite-devel libmcrypt-devel unzip bzip2
yum -y install mhash-devel openssl-devel
yum -y install libtool-ltdl libtool-ltdl-devel
PREFIX="/vhs/kangle/ext"
PHP_TMP="/root/php/"
mkdir -p $PHP_TMP
wget -c https://github.phxc8.com/php/completed/7.2/tpl_php72.tar.bz2 -O $PHP_TMP/tpl_php72.tar.bz2
tar -jxvf $PHP_TMP/tpl_php72.tar.bz2
mv $PHP_TMP/tpl_php72 $PREFIX
rm -rf $PHP_TMP
/vhs/kangle/bin/kangle -r
