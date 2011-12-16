---
title: 'Bootcamp安装注意事项'
layout: post
guid: urn:uuid:60387eb4-aa97-4807-9981-07f9c3fcc308
tags:
    - mac
    - bootcamp
    - tips
---

> 最近COD6的话题很多，觉着还是不要浪费了这么大的屏幕和4850的显卡，决定装个玩玩，不过要装个Windows先

### 安装过程只能说是一波三折，总结如下

1. 超过32GB的时候无法格式化成FAT32，这也是为什么BootCamp Assistant会特意提供Use 32GB的选项
2. 安装Windows的时候，在分区选择的部分__千万不要选择 使用现在的文件系统（无变更）__，否则会出现disk error无法启动的状况
3. FAT32格式可以在Mac OS X下读写，但是不支持超过4GB的单个文件; NTFS支持大文件，且更安全，但是在Mac OS X下只能读取不能写入
4. 到随机光盘里找BootCamp，不要用零售版SL光盘的BootCamp，驱动不兼容

### 如果出现了disk error：

如果你用的是本本或者是有线键盘，那么很简单，启动时按Option键，重启到Mac，用BootCamp Assistant删掉并重建bootcamp分区，重新安装windows，注意上面的tip 2

如果你恰巧用的是无线键盘，那么恭喜你，你需要一个有线的Apple键盘，或者一个Apple遥控器。启动的时候按住遥控器的menu键，然后会出现系统选单，选择Macintosh HD就可以进Mac OS X了

最后，买个Apple Remote吧，除了看电影听音乐以外，还能应应急 :D

