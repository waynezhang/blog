---
title: '用Privoxy实现Socks代理转HTTP代理'
layout: post
guid: urn:uuid:81933a79-c2f9-4631-a07d-c377b87abd32
tags:
    - proxy
---

SSH端口动态转发只能实现Socks代理，但是并不是所有应用都支持Socks代理，比如Last.fm, Windows Live Writer, Opera...所以有个HTTP代理是很有必要的。   

[tinyproxy](http://tinyproxy.banu.com/)是[不错](http://joyus.org/blog/2008/06/socks-proxy-workaround-for-opera.html)，可惜只支持POSIX OS。很无奈现在在公司处理普通的工作还是需要Windows。。。所以找到了[privoxy](http://www.privoxy.org)，一个cross-platform的web proxy，支持包括广告过滤，cookie管理等很多高级功能，当然也有我们需要的socks转发   

设置非常非常简单:    

编辑privoxy安装目录下的config.txt，或者启动privoxy，在Options菜单里选择Edit Main Configuration也成。     
在配置文件里加入listen-address和forward-socks4a的设置，例如
    # 监听本地的8118端口并转发至8080端口   
    listen-address 127.0.0.1:8118   
    forward-socks4a / 127.0.0.1:8080

需要注意的是： 

  * 出于安全考虑，如果只给本机使用，listen-address的ip要设置成127.0.0.1，如果要给其他人共享，最好同时也设置permit-access（参考配置文件的说明）
  * forward-socks4也可以做转发，和forward-socks4a的区别在与forward-socks4的dns解析发生在本地而socks4a发生在socks server上

题外话：今儿iPhone发售，表参道那边儿已经有[1500个哥们儿在排队](http://it.nikkei.co.jp/mobile/news/index.aspx?n=MMITfa000011072008)了。。。我。。。还是去打酱油吧 

