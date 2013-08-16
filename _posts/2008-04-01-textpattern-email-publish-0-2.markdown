---
title: 'wyn_email_publish 0.2 Release'
layout: post
guid: urn:uuid:61fdbf8c-5ff6-41b5-b710-361b9b08420b
tags:
    - textpattern
    - plugin
---

很久之前做了一个[版本](http://gopherwood.info/2008/01/16/txp-plugin-wyn-email-publish) , 不过很简陋, 邮件地址和内容都要手工修改插件才行, 于是重新翻新的一遍, 加入了后台控制面板, 可以自定义多个邮件地址, 甚至可以定义邮件的标题和内容.

至于为什么有这么个插件, 无非就是为了发post的时候同时发到别的BSP上, 例如blogger, live space之类

直接下载点 [这里](http://code.google.com/p/wyn-txp-plugins/downloads/list)

--- 华丽的分割线 ---

### wyn_email_publish

__Description__

When you publish a new post, this plugin will mail it to everywhere (email address of course :D) you want.

That means, you can publish the post onto other BSPs, which support email publish feature (like live space, or blogger), just as the same time you publish on textpattern.

__History__

  * 0.2: Add admin config panel, you can not only set the email addresses here, but also customize the content of mail
  * 0.1: Initialize Release, just has basal function, a little troublesome to use

__Usage__

  * Install and active it, and of course, set up your email publish function of your BSPs
  * Go to extenstion -&gt; Email Publish
  * Now you can set the mail address, use &#8216;;&#8217; to separator if you have more than one address
  * Set the title and body of mail, you can use the tag *title*, *body*, *author* and *link* to replace the title, the content, the author name and the link of the article. 
    (__NOTICE__: *link* and *body* are __NOT__ allowed in mail title)
  * Go to write a new post to introduce this little thing :D

Download [here](http://code.google.com/p/wyn-txp-plugins/downloads/list)

