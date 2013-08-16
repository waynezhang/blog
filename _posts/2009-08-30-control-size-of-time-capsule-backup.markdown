---
title: '限制Time Capsule备份大小'
layout: post
guid: urn:uuid:a40f7942-8561-40fd-8bd2-245b45fd5740
tags:
    - mac
    - timecapsule
    - tips
---

> Time Machine的备份策略：第一次全局备份，然后每隔一小时增量备份，磁盘空间不足时自动删除最久的一次备份。

2tb的time capsule放那儿早晚会被备份塞满了，相信绝大多数人都不愿意拿花几千块钱买个time capsule只当作备份和无线ap用。time capsule的磁盘不支持分区，不过我们可以自己帮time capsule创建一个小点儿的备份文件来解决这个问题。步骤如下：

1. 关闭time machine

2. 如果time capsule上已有time machine的备份，推出备份卷，连接到time capsule的data文件夹，找到扩展名为sparsebundle的文件，记下文件名后删除该文件或改名。如果还没有time machine备份，可以用计算机名和硬件UUID后12位（一般为第一块网卡的MAC地址）的组合来得到文件名。如下图，从苹果菜单上打开About This Mac，选择More Info，最左上角是计算机名，加上下划线 _  和hardware uuid后12位就是time machine的备份文件名。

![](/media/files/2009/08/30/time-capsule-size.jpg)

3. 打开Disk Utility，选择New Image来创建一个新的备份文件。位置当然是在time capsule的Data文件夹下，输入刚才的文件名，指定自己喜欢的大小，其它各选项如下：

  * Format : Mac OS Extended (Case-sensitive, Journaled)
  * Encryption : none
  * Partitions : Single partition - Apple Partition Map
  * Image Format : sparse bundle disk image

4. 文件创建完成后重新开启time machine，选择time capsule，开始备份
