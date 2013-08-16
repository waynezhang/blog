---
title: '在Linux下实现NTFS分区的读写操作'
layout: post
guid: urn:uuid:6f6feb26-997f-4629-908d-941001a1ac51
tags:
    - linux
    - ntfs
---

直到Edgy也没有直接加入对NTFS分区的写操作，如果你需要偶尔mount一个NTFS分区交换下数据的话，follow me

我们使用的驱动是NTFS-3G，NTFS-3G已经经过无数此测试，算是一个比较稳定的版本了，不过还是要提一下，对NTFS分区进行写操作是有一定风险的，数据挂了可别来怨我，呵呵:)

由于要编译驱动，所以......make之类的是少不了的啦，如果你连make都没有，那么

    sudo apt-get install build-essential

我们需要的包是fuse，所以

    sudo apt-get install libfuse-dev

ok，现在去下载驱动

> ~~http://mlf.linux.rulez.org/mlf/ezaz/ntfs-3g-download.html~~

下载链接很明显，别告诉我你没看到哦，下载下来解包

    tar zxvf ntfs-3g-20070910-BETA.tgz

然后进入目录做configure

    cd ntfs-3g-20070910-BETA
    ./configure

ok，现在可以编译安装了

    make
    sudo make install

没什么问题的话已经可以用了，当然内核模块要加载先

    modprobe -v fuse

现在可以mount了，注意不是mount命令，而是ntfs-3g，例如我的设备是/dev/hdc1，要mount到/media/hdc1下

    ntfs-3g /dev/hdc1 /media/hdc1 -o silent,umask=0,locale=zh_CN.utf8

大功告成，什么？每次加载不方便？

    sudo vi /etc/modules

在后面加一行

    fuse

然后编辑fstab

    vi /etc/fstab

加一行

    /dev/hdc1 /media/hdc1 ntfs-3g silent,umask=0,locale=zh_CN.utf8 0 0

重启下看看？
