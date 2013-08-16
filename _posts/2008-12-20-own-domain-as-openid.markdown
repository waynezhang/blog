---
title: '用自己的域名做openid'
layout: post
guid: urn:uuid:c9804294-098c-4738-bd4c-79a53ea505e2
tags:
    - openid
    - tips
---

> 不知道openid的到[这里](http://en.wikipedia.org/wiki/Openid)扫盲

虽然现在openid server满大街都是, 不过还是更喜欢用自己的域名做openid.

Step 1: 随便找个openid server申请个帐号, 比如[myopenid](http://www.myopenid.com)

Setp 2: 把下面这段代码中的openidserver换成你的openid server, 把account换成你的openid, 然后添加到首页的html代码的head块中

    <link rel="openid.server" href="openidserver" />
    <link rel="openid.delegate" href="account" />

如果你的server支持openid2, 可以继续添加下面这段代码

    <link rel="openid2.provider" href="openid2server" />
    <link rel="openid2.local_id" href="account" />                                                                                                                                                      

以myopenid为例:

    <link rel="openid.server" href="http://www.myopenid.com/server" />
    <link rel="openid.delegate" href="http://username.myopenid.com/" />
    <link rel="openid2.provider" href="http://www.myopenid.com/server" />
    <link rel="openid2.local_id" href="http://username.myopenid.com/" />                                                                                                                                

Step 3: 没了

下周回东京, 调时差, 延长签证, 然后再过来, 嗯, 生命在于折腾
