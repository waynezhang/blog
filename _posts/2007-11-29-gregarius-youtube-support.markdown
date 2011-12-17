---
title: '让Gregarius支持Youtube视频'
layout: post
guid: urn:uuid:8d7aec03-786e-4227-84c3-0eaa318572e7
tags:
    - youtube
    - gregarius
---

很多人习惯在post里面嵌些个Youtube,我也是其中一员

不过在Gregarius抓取feed的时候总是看不到,每次都点到原本的站点里再看都多多少少有些麻烦,尤其像我这种网速慢的(emobile真是越来越不像话了&#8230;说起来就生气)

开始以为这是gregarius的bug,本来就不支持的吧.后来才发现这个其实是gregarius的一个feature: 为了安全起见,gregarius只允许抓取html里的一些特定的tag,而对于object,embed这样的tag由于安全性的因素是被屏蔽掉的,手动加进去就好了,不过由此引起的安全性问题后果自负&#8230;不过话说回来,一般都不会遇到什么问题的吧&#8230;

进入后台管理页面,选择 *Config* , 找到 *rss.input.allowed* , 编辑

加入如下 tag 和 attritube

    Tag : embed     attritubes : src , type , wmode , width , height
    Tag : object    attritubes : width , height
    Tag : param     attritubes : name , value

至此

