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

&#8212;&#8212;&#8212;&#8212;华丽的分割线&#8212;&#8212;&#8212;&#8212;

### Description

Fine, textpattern has already provided a recent comments tag. But someone love it and someone hate it. And it indeed is not so powerful enough. So, this thing was born.

### Usage

  * class: css class, default is wyn_recent_comments
  * wraptag: tag of wrap, default is ul
  * break: tag of every item, default is li
  * label: title label, default is nothing
  * labeltag: tag of title, default is nothing
  * limit: number of comments to show, default is 10
  * wordcount: the length of each comment. The comment whose length is longer than this value, it will be cut off, with <span class="caps">UTF</span>-8 support. default is 10
  * messagebreak: if a comment has been cut off, this value will be showed after it. default is &#8216;&#8230;&#8217;
  * format: the things to show. you can customize it by using tags (<code>%content%</code> for comment content, <code>%commenter%</code> for commenter name, <code>%time%</code> for comment time and <code>%title%</code> for post title). default is <code>%content%</code>
  * atitle: the title attribute of generated a links. tags can also be used here. default is <code>%commenter% on %time%</code>
  * section: limit the comments into one section
  * timeformat: the format of time. it uses standard <span class="caps">PHP</span> time format, you can refer <span class="caps">PHP</span> doc to know more. default is &#8216;%d %b %Y &#183; %X&#8217;, a little difficult :D

Download [here](http://code.google.com/p/wyn-txp-plugins/downloads/list)

