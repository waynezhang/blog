---
title: 'Textpattern Comment SOFA (TXP沙发党)'
layout: post
guid: urn:uuid:b3a95c9d-0cba-4b1a-b951-1a10c58ea493
tags:
    - textpattern
    - plugin
---

嗯, 昨天晚上无聊, 花了三个小时实现了一个雏形, 实现了对留言者统计并输出, 支持生成列表或者cloud

今天又修修补补加了用来识别用户的keyword属性, 并支持skip列表, 称之为0.2版本

后来觉得没有准确的统计沙发, 有点和名字不符, 于是又新增了restricted模式, 用来精确计算沙发党, 当然还是同时支持cloud输出和list输出. 并同时修改到0.3版本

cloud的效果如下, 喜欢的就拿去用好了

![](/media/files/2008/03/31/txp_sofa_screenshot.jpg){: .image-300 }

点[这里](http://code.google.com/p/wyn-txp-plugins/downloads/list)下载

--------------

### Comment Sofa plugin for Textpattern

It can generate a cloud or a list for commenters who commented the most. OR generate them for users who got the sofa (first comment to a post) most :D

#### History

  * 0.3 : Add Restrict SOFA mode, which generator a cloud or a list for the users who got sofa (the first one who comment to a post) most.
  * 0.2 : Add keyword attribute to identify user by name or email and get skip value accepted a list with &#8216;;&#8217; delimited.
  * 0.1 : Initialize Release

#### Usage

  * wyn_comment_sofa_cloud

    * wraptag: wrap your cloud with a tag
    * keyword: The keyword to identify user, available values are name and email, default is name
    * skip: skip the user by indicated thing, default is nothing (lots of blogs just have one admin user to do everything :D) You can set values more than one, just use a &#8216;;&#8217; to separate.
    * label: the label
    * labeltag: tag of the label
    * limit: the limit of commenters, default is 10
    * class: the class of wrap
    * maxsize / minsize: the max / min font size of the most / least commenter&#8217;s link. (Percent, default is 200 and 50)
    * break: the break between links, default is a space
    * showcount: whether to show the count of comments by each commenter, default is 1
    * restricted: whether to get RESTRICTED SOFA MODE (Generate cloud by rank of first commented to posts), default is 0

  * wyn_comment_sofa_list

    * wraptag: wrap your list with a tag
    * keyword: The keyword to identify user, available values are name and email and default is name
    * skip: skip the user by indicated thing, default is nothing (lots of blogs just have one admin user to do everything :D)
    * label: the label
    * labeltag: tag of the label
    * limit: the limit of commenters, default is 10
    * class: the class of wrap
    * break: the break between links, default is a space
    * showcount: whether to show the count of comments by each commenter, default is 1
    * restricted: whether to get RESTRICTED SOFA MODE (Generate list by rank of first commented to posts), default is 0

Download from [here](http://code.google.com/p/wyn-txp-plugins/downloads/list)

