---
title: '自己定制deb'
layout: post
guid: urn:uuid:b98a6663-6f30-40d3-993c-9df5f0d6ef69
tags:
    - gtk
    - ubuntu
---

ubuntu提供的deb包有时并不能完全满足我们的需要，这时就需要自己来加入一些patch或者修改它的编译选项，例如实现mac menu applet时对gtkmenubar控件的patch就需要我们重新编译安装gtk

![](http://farm1.static.flickr.com/180/465939707_6876bcf9cb.jpg)

详细信息看http://ubuntuforums.org/showthread.php?t=241868

帖子里的ubuntu包只有gtk2.10.6的版本，最新的feisty已经到了gtk2.10.11，所以只好手工patch

1. 下载gtk源码

  ubuntu里下载源码是很方便的，确定sourcelist里有deb-src的条目，然后

        apt-get source libgtk2.0-0

    目录里会得到3个文件和一个文件夹：

    gtk+2.0_2.10.11-0ubuntu3.dsc 包含对gtk包的说明和md5校验码，确保源码包正确
    gtk+2.0_2.10.11-0ubuntu3.diff.gz diff的patch
    gtk+2.0_2.10.11.orig.tar.gz gtk的官方源码，没有改动的
    gtk+2.0-2.10.11 debian包的定制目录，包括changelog，版本信息以及所有的patch，这个目录可以由以上3个文件生成

2. 修改包

    进入gtk+2.0-2.10.11目录：

        debchange -i Add mac menu support

    没有debchange的话安装devscripts包先，－i参数后面的是对本次修改的注释，可以看一下debian下的changelog，此时会发现开头已经自动加入了注释并且版本号由gtk+2.0_2.10.11-0ubuntu3变成了gtk+2.0_2.10.11-0ubuntu4，不需要做特殊修改的话直接下一步

3. 加入patch

    所有的patch都在debian下的patches目录，不过我们的diff文件需要作些修改才可以

        --- gtk/gtkmenubar.c.old        2006-07-03 08:25:06.000000000 +0800
        +++ gtk/gtkmenubar.c    2006-11-04 23:18:50.000000000 +0800
        -38,6 +38,18  #include "gtkwindow.h"

        #include "gtkprivate.h"
        #include "gtkalias.h"
        +// For mac menubar
        +#include "gdk/x11/gdkx.h"
        +#include "gdk/x11/gdkwindow-x11.h"

    将开头两行的路径修改成和其他patch一样：

        --- gtk+-2.4.9.orig/gtk/gtkmenubar.c.old        2006-07-03 08:25:06.000000000 +0800
        +++ gtk+-2.4.9/gtk/gtkmenubar.c    2006-11-04 23:18:50.000000000 +0800
        -38,6 +38,18  #include "gtkwindow.h"

        #include "gtkprivate.h"
        #include "gtkalias.h"
        +// For mac menubar
        +#include "gdk/x11/gdkx.h"
        +#include "gdk/x11/gdkwindow-x11.h"

    然后把这个文件复制到debian/patches下面

4. 安装编译所依赖的软件包

    这个也很简单

        sudo apt-get build-dep libgtk2.0-0

5. 打包deb

        sudo debuild

    完成之后会在gtk+2.0-2.10.11的上层目录生成ubuntu4版本的dsc, build, changes以及一些deb包，先在可以dpkg -i 8.deb安装deb包了

