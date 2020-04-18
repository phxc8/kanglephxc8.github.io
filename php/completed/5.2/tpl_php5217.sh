#!/bin/sh
PREFIX="/vhs/kangle/ext"
PHP_TMP="/root/php/"
yum -y install bzip2-devel libxml2-devel curl-devel db4-devel libjpeg-devel libpng-devel freetype-devel mysql-devel pcre-devel zlib-devel sqlite-devel libmcrypt-devel unzip bzip2
yum -y install mhash-devel openssl-devel
yum -y install libtool-ltdl libtool-ltdl-devel
mkdir -p $PHP_TMP
wget -c https://github.phxc8.com/php/completed/7.0/tpl_php70.tar.bz2 -O $PHP_TMP/tpl_php70.tar.bz2
tar -jxvf $PHP_TMP/tpl_php70.tar.bz2
mv $PHP_TMP/tpl_php70 $PREFIX
rm -rf $PHP_TMP
/vhs/kangle/bin/kangle -r
