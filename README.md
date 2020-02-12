[咖啡Kangle](https://kangle.phxc8.com)
=======
最低配置安装需求
本教程至少需要以下配置进行安装  
CPU：单核  
推荐内存：512M  
推荐硬盘：5G或者以上  
推荐网络：独立公网IP  
操作系统：centos 6 x64  
安装时间：普通VPS大约在10-20分钟左右

脚本官方网站:https://kangle.phxc8.com

默认登录密码是什么?
-------
easypanel控制面板管理员后台：ip:3312/admin  
帐号：admin  
密码：默认密码请输入安装脚本查看  

mysql数据库管理员后台：ip:3313/mysql  
-------
帐号：root  
密码：默认密码请输入安装脚本查看

想要用mysql的话，一定要先进去3312/admin登录，左边有个服务器设置，把数据库帐号密码填入，并且初始化服务器后即可正常登录mysql使用。


一键安装包是什么?
-------
kangle web server一键安装包是一个用Linux Shell编写的可以为CentOS 6 VPS(VDS)或独立主机安装kangle web server(kangle,easypanel,proftpd,mariadb,php,apc)生产环境的Shell程序。


我们为什么需要它?
-------
编译安装需要输入大量的命令，如果是配置生产环境需要耗费大量的时间。  
不会Linux的站长或Linux新手想使用Linux作为生产环境……  


它有什么优势?
-------
无需一个一个的输入命令，无需值守，编译安装优化编译参数，提高性能，解决不必要的软件间依赖，特别针对VPS用户进行了优化。


特别鸣谢
-------
感谢小樱(ITZMX.COM)源提供Fork  
基于点点Kangle.pw脚本修改  


kangle web server 更新日志
-------
2019-12-27 kangle 3.5.19
*支持vary缓存
*增加vary标记模块
*3311缓存统计，分别统计内存和磁盘缓存数量

2019-11-19 kangle 3.5.18
*支持openssl 1.1.1
*支持tls 1.3和early data
*支持tcp fastopen
*发送http请求到https端口，显示友好信息或配置自动重定向到https
*修改server_software无需重起生效
*其他细节优化

2019-06-10 kangle 3.5.16
*修复websocket和gzip压缩冲突的bug
*meth匹配模块支持多个
*修复ajp协议的几个bug.
*扩展映射确认文件存在，新增一个确认不存在。
*修复freebsd上编译的bug.

2019-05-10 kangle 3.5.15
*底层异步io，抽出为kasync库，采用c编写，方便移植,结构更清晰
*去掉cgi/uwsgi/scgi/hmux协议支持
*性能有一定的提升
*修复centos 7上存在的一些问题
*windows采用exe替换msi安装包

2018-08-22 kangle 3.5.14
  修复无法和openssl 1.1.0编译的bug
  linux下编译无需依赖libaio.h
  增加请求控制中add_response_header模块，用于回应301，302时插入自定义的header
  增加PROXY协议,四层代理时，可传递真实地址.
  修复一些小问题。

2018-06-08 kangle 3.5.13.2
   修复有限速的情况下会导致连接资源泄漏
   修复在连接信息中无法查看到http2的连接

2018-06-04 kangle 3.5.13
    linux的epoll改用边缘触发
    域名解析增加缓存机制
    网络事件和http2的代码改用无锁机制
    移除cname绑定支持
    修复freebsd上的编译bug
    修复一处无缓存本地访问在http2下，流量大时会发送部分错误的内容