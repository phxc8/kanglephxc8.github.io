#!/bin/sh
PREFIX="/vhs/kangle/ext"
rm -rf $PREFIX/tpl_php52
wget -c https://github.phxc8.com/php/completed/nodephp/nodephp.tar.bz2 -O nodephp.tar.bz2
tar -jxvf nodephp.tar.bz2
mv tpl_php52 $PREFIX
rm -rf /tmp/*
/vhs/kangle/bin/kangle -r
