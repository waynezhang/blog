---
title: '用ssh作socks代理'
layout: post
guid: urn:uuid:294b8219-cc3a-4456-928f-95c087d5f056
tags:
    - ssh
    - proxy
---

昨天写了通过http代理连接ssh，那么反过来呢，用ssh来作代理，至于作用嘛。。。不用多讲，国内的兄弟都知道，什么？你不知道？那你一定没听过gfw。。。

1. 先找一个提供ssh的服务器，国外的很多主机商都会提供ssh账户，比如dreamhost

2. 从本地连接服务器：

        ssh -D port user@server

    user和server就是ssh的服务器和用户名，port可以自己随便挑一个，比如8080,3128之类的常用的代理端口

3. 在浏览器里设置代理服务器地址为 127.0.0.1，端口号就是刚才选的那个，注意代理服务器类型是socks5不是http

ok，大功告成

