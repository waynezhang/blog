---
title: 'Linux 下 aMule 设置'
layout: post
guid: urn:uuid:0c997fad-353d-48a6-946f-d683d41f56f6
tags:
    - linux
    - amule
---

DonkeyServer No1 (62.241.53.2:4242)已经存在，要添加的只有：

    华语P2P源动力  61.152.93.254:4661
    Razorback 2   195.245.244.243:4661

firefox设置：地址栏输入 about:config

新建一个布尔值 network.protocol-handler.external.ed2k，设为true

新建字符串值 network.protocol-handler.app.ed2k，设为/usr/bin/ed2k.amule（aMule安装时的prefix/ed2k.amule）

OK，记录于此，备忘

