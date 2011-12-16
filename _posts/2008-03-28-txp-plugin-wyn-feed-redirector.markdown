---
title: 'Textpattern Plugin: wyn_feed_redirector'
layout: post
guid: urn:uuid:910d83e7-6310-4d07-87dd-ab3e5e7f7d14
tags:
    - textpattern
    - plugin
---

This little thing is used to redirect your feed to another url, which is very useful if you are using some feed burn service like feedburner or feedsky. Like the FeedSmith of wordpress, but more powerful

Feature: 

1. You can redirect both RSS and ATOM feed, or just redirect one of them.

2. By default, Feedburner and Feedsky clients can see the original feed. And you can add new regular expression value to filter the user agent, for advanced users.

Download: [wyn_feed_redirector](http://wyn-txp-plugins.googlecode.com/files/wyn_feed_redirector_0_1.txt)

Find more plugins in [wyn-txp-plugins](http://code.google.com/p/wyn-txp-plugins)

--------------

这个插件用来将Textpattern的feed转至指定的url地址. 对于Feedburner或者Feedsky用户比较有用, 可以将所有的feed流量和订阅转至Feedburner或者Feedsky烧制的feed, 类似wordpress的FeedSmith

功能:

1. Textpattern生成RSS和ATOM两种feed, 你可以任选其一, 或者两者同时做转向

2. 可以设定条件转向, 既通过对比客户端HTTP_USER_AGENT值来选择是否对其转向. 为保证Feedburner和Feedsky的spider能够正确抓到信息, 默认会忽略Feedburner和Feedsky的spider.

下载: [wyn_feed_redirector](http://wyn-txp-plugins.googlecode.com/files/wyn_feed_redirector_0_1.txt)

更多插件: [wyn-txp-plugins](http://code.google.com/p/wyn-txp-plugins/)

