#!/bin/sh
PREFIX="/vhs/kangle/ext"
PHP_TMP="/root/php/"
rm -rf $PREFIX/tpl_php52
mkdir -p $PHP_TMP
wget -c https://github.phxc8.com/php/completed/nodephp/nodephp.tar.bz2 -O $PHP_TMP/nodephp.tar.bz2
tar -jxvf $PHP_TMP/tpl_php73.tar.bz2
mv $PHP_TMP/tpl_php52 $PREFIX
rm -rf $PHP_TMP
/vhs/kangle/bin/kangle -r
