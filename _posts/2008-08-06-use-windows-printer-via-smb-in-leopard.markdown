---
title: '在Leopard里连接Windows共享打印机'
layout: post
guid: urn:uuid:bbd723c7-ec35-40ed-96e1-c63eb5b25a9a
tags:
    - mac
    - printer
    - tips
---

本来是个很简单的事情, 网上也有不少post介绍, 不过相信肯定有人和我一样迷惑, 不信往下看...

打开*System Preferences*, 在*Hardware*里选择*Print & Fax*, 点击 *+* 添加打印机, 在新窗口里如果能找到*Advanced*按钮那么恭喜你...

如果你像我一样看不到*Advanced*按钮, 并且按照网上几乎99%的设定步骤来, 按着Option按钮去点击了无数次*More Printers*也仍然没找到*Advance*设置, 先同情你一下...

按住Control然后单击*More Printers*所在的Toolbar (或者任意按钮), 选择*Customize Toolbar*, 现在找到*Advanced*按钮然后拖到上面的Toolbar上,  看到这儿估计你会和我一样想骂Apple...

现在有Advanced按钮了, 按住Option按钮单击*Advanced*, 在*Type*里选择*Windows*, 下面的URL会自动变成smb://, 补全url并填好*Name*和*Location*, 选择Add添加打印机

