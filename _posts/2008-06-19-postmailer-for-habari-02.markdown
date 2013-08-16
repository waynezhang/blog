---
title: 'Postmailer for Habari 0.2'
layout: post
guid: urn:uuid:ad731a67-5f91-4777-a105-e3a256ea134e
tags:
    - habari
    - plugin
---

[habari](http://habariproject.org/)的trunk最近改动挺多, FormUI变的我之前的插件配置界面也出不来了, 而且插件option存储方式貌似也有所修改, 之前的pluginname:property的pattern已经无效, 全部改成了pluginname__property的样子. 

加之最近换到VPS, 又发现发出来的mail是乱码, 并且header也有问题, 检查了半天发现是header的换行我用了 rn, 众所周知这个是windows的换回, 而linux系统只要 r 就足够...真不晓得dreamhost上是怎么配的, 居然一直能跑. 把换行的地方用PHP_EOL代替, 加了点header信息, 再顺手把邮件body的部分也用base64编码了.

很简单的小修正, 下载请至~~原文~~

--- 华丽的分割线 ---

Changes in 0.2:

  * Compatible with SVN r2802
  * Add a little of information in mail header
  * Fix End-Of-Line in Linux environment
  * Encode message body with Base64

Please download it in ~~original post~~
