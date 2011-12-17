---
title: '通过http代理服务器连接ssh'
layout: post
guid: urn:uuid:b0a80dce-0a14-4957-94b4-639fcae2815a
tags:
    - ssh
    - proxy
---

今天着实让我很惊讶，ssh居然不能直接设置代理服务器，而必须通过tunnel（或者就是我太挫，没找到其他办法）

1. 找个Tunnel，比如[corkscrew](http://www.agroman.net/corkscrew/corkscrew-2.0.tar.gz)，然后解开tar包，编译安装

        ./configure
        make & make install

2. 设置ssh，编辑ssh配置文件，/etc/ssh/ssh_config

        vi /etc/ssh/ssh_config

    然后加入

        Host *
            ProxyCommand corkscrew proxy_server proxy_port %h %p

    如果需要验证文件的话，还要在后面加入验证文件，如下

        ProxyCommand corkscrew proxy_server proxy_port %h %p authfile

    ok，现在可以直接ssh了

        ssh username@server

