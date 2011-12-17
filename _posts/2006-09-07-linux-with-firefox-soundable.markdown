---
title: 'Linux下Firefox浏览Flash无声的解决办法'
layout: post
guid: urn:uuid:ffcaf39b-877f-4980-ba2b-0966ca5c4999
tags:
    - linux
    - firefox
    - flash
---

1. 检查flash插件的安装是否正确，根据我的经验flashplugin-nonfree这个比较稳定，尽管是nonfree的......GNU的那个经常崩溃

2. 如果Flash可以正常浏览但是没有声音，则是Firefox的声音输出设置有问题，编辑/etc/firefox/firefoxrc文件，如果没有就创建一个好了

        sudo vi /etc/firefox/firefoxrc

    加入（或修改）

        FIREFOX_DSP="aoss"

    aoss要视你的dsp而定，如esddsp，artsdsp，aoss（aoss要求已经安装了alsa-oss），也可以试一下auto，反正不能是none，呵呵

3. 关闭firefox的所有进程，重启firefox，ok？enjoy～

PS：适用于dapper ，其他版本或发行版firefoxrc文件可能不同，如/etc/mozilla-firefox/mozilla-firefoxrc等等

