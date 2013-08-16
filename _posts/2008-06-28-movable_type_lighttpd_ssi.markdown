---
title: 'Movable Type + Lighttpd + SSI'
layout: post
guid: urn:uuid:6d524f38-a3de-4cc2-8c3a-c19d0db71121
tags:
    - movabletype
    - lighttpd
---

SSI (Server Side Includes), 简单讲就是可以在一个文件里包含另一个文件, 而这个过程是在客户端进行请求是由服务器来自动完成.

利用SSI, 我们可以将页面中多变的部分和不经常变换的或者是多个页面共通的部分分离开来, 从而加快重建速度. 例如, 我们可以将页面的header部分分离出来, 这样即使在修改了header之后, 也只需要重建header的文件就可以保证全站页面的sidebar保持统一

在Movable Type里启用SSI很简单

  * 首先启用MT的SSI发布功能, 进入Publish属性设置, 找到Module Options下的Service Side Includes, 设置为Apache Sever-Side Includes, lighttpd? 没关系, 也是这个

![Publish Preference](/media/files/2008/06/29/mt-pub-ssi.png)

    愿意的话也可以把File Extension从html改成shtml, 便于http server区分, 不过并不是必要的

  * 然后在Design里编辑想要分离出来的Template或者Widget, 在Template Options里选中Process as SHTML include

![Template Options](/media/files/2008/06/29/mt-tmpl-opt.png)

接着是lighttpd端的设置, 编辑lighttpd.conf (/etc/lighttpd/), 在server.modules里加入mod_ssi, 如 :

    server.modules = (
        "mod_access",
        "mod_alias",
        "mod_accesslog",
        "mod_rewrite",
        "mod_redirect",
        "mod_ssi",
        "mod_fastcgi",
    )

在后面加入ssi module的设置

    #ssi
    ssi.extension= ( ".html" )

然后去MT的后台重新发布全站即可
