---
title: '用iChat / Goolge Talk上MSN'
layout: post
guid: urn:uuid:a7123ac9-54c0-4efa-9e4f-c0edabe0229f
tags:
    - ichat
    - gtalk
    - msn
    - tips
---

用Jabber上MSN也不是什么新鲜东西了, 不过鉴于今天头一次实验, 暂记一篇

原理很简单, 通过一些支持MSN Transport服务的Jabber服务器在MSN与Jabber消息之间做个转换, 所以我们需要一个能够支持MSN Transport服务的Jabber服务器. 服务器不同对msn的支持程度貌似也不同, 比如Personal message等等. 我用的是 jaim.at, 当然还有其他很多选择, google一下就ok

  * 找一个Jabber客户端, adiumx (Mac), psi (Win, Mac...) 都可以, 但是iChat不行. 我这里用adiumx.
  * 希望把msn联系人导入到google talk帐户的, 准备好一个google talk帐户, 在adiumx里添加google talk帐户并跳转至第4步
  * 打开Adiumx, 选择菜单 File -&gt; Add Account -&gt; Jabber 
    在新对话框中选择 Register New Account, 紧接着会弹出一个对话框来选择服务器, 在Server里输入 jaim.at, 选择 Request New Account. 新对话框中输入喜欢的用户名以及密码, 点击Register
  * 用Google Talk / Jabber帐户登录, 打开Adiumx的Preferences, 在Account列表中右键点击Google Talk / Jabber帐户, 选择Discovery Browser
  * 用Google Talk的需要在新对话框中的Service里填入jabber服务器地址, jaim.at, 然后回车
  * 紧接着会列出很多该服务器支持的服务列表, 找到MSN Transport并双击
  * 输入msn帐户的用户名和密码, 选择Register
  * 之后马上会收到来自服务器的消息以及所有msn好友的验证请求, 全部都选Authorize之后便OK

注:

  * 原本名为 xxx@hotmail.com 的好友会变成 xxx%hotmail.com@msn.jaim.at
  * 不仅限于msn, 通过jabber服务器还连yahoo messenger, qq等等等等

