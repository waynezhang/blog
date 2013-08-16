---
title: 'wyn_recent_comments 0.1 Release'
layout: post
guid: urn:uuid:ce061315-8d65-455f-bed2-946d41143c0d
tags:
    - textpattern
    - plugin
---

一直觉得[Textpattern](http://www.textpattern.com)自带的那个最新留言的tag比较弱, 只能显示作者和文章标题, 不过也凑合用了

昨天[dimlau](http://www.dimlau.com)也提到了这个问题, 于是&#8230;无聊之中又出现了一个新的插件

功能比自带的那个稍微强一点点, 可以显示评论内容, 支持字符串截取, 支持内容格式定制以及链接的title属性以及时间格式的定制, 当然数目限制和section限制也是必不可少的

直接下载点[这里](http://code.google.com/p/wyn-txp-plugins/downloads/list)

--- 华丽的分割线 ---

### Description

Fine, textpattern has already provided a recent comments tag. But someone love it and someone hate it. And it indeed is not so powerful enough. So, this thing was born.

### Usage

  * class: css class, default is wyn_recent_comments
  * wraptag: tag of wrap, default is ul
  * break: tag of every item, default is li
  * label: title label, default is nothing
  * labeltag: tag of title, default is nothing
  * limit: number of comments to show, default is 10
  * wordcount: the length of each comment. The comment whose length is longer than this value, it will be cut off, with UTF-8 support. default is 10
  * messagebreak: if a comment has been cut off, this value will be showed after it. default is &#8216;&#8230;&#8217;
  * format: the things to show. you can customize it by using tags (`%content%` for comment content, `%commenter%` for commenter name, `%time%` for comment time and `%title%` for post title). default is `%content%`
  * atitle: the title attribute of generated a links. tags can also be used here. default is `%commenter% on %time%`
  * section: limit the comments into one section
  * timeformat: the format of time. it uses standard PHP time format, you can refer PHP doc to know more. default is '%d %b %Y · %X', a little difficult :D

Download [here](http://code.google.com/p/wyn-txp-plugins/downloads/list)

