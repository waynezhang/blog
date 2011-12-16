---
title: '在Mac里为单独的应用程序设定语言选项'
layout: post
guid: urn:uuid:3774193e-9600-4588-a80a-3f7c9b891c0d
tags:
    - mac
    - tips
---

> 我似乎总是有些个奇奇怪怪的需求...

起因:

	* 自用的Mac设定的是英文, 之所以如此是为了方便spotlight或者quicksilver, 比如启终端只要搜*terminal*, 而中文系统则要切输入法然后输入*终端*才能找到
	* 公司的exchange server和outlook client都是日语版, 所以相应的folder也都是日语名称, 而在Mail.app里设定exchange帐户后, 英文版的Mail.app会自动在server上添加Inbox, Sent等英文folder, 和原有的日语版的folder重复

打开~/Library/Preferences, 找到应用的plist文件, 例如Mail.app为com.apple.mail.plist,

双击启动Property List Editor, 在Root节点下创建新节点, 名为AppleLanguages, 类型选择Array, 在新建的AppleLanguages节点下创建新的子节点, 子节点自动命名为0, 类型设定为String, 修改Value为语言名称, 例如英文为en, 日语为ja

保存, 重新启动应用

