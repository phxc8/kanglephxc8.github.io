#!/bin/sh
yum -y install bzip2-devel libxml2-devel curl-devel db4-devel libjpeg-devel libpng-devel freetype-devel pcre-devel zlib-devel sqlite-devel libmcrypt-devel unzip bzip2
yum -y install mhash-devel openssl-devel
yum -y install libtool-ltdl libtool-ltdl-devel
PREFIX="/vhs/kangle/ext"
wget -c https://github.phxc8.com/php/completed/7.1/tpl_php71.tar.bz2 -O tpl_php71.tar.bz2
tar -jxvf tpl_php71.tar.bz2
mv tpl_php71 $PREFIX
rm -rf /tmp/*
/vhs/kangle/bin/kangle -r
