---
title: '启用Safari的单窗口模式'
layout: post
guid: urn:uuid:910aad8e-760a-42e4-8c14-96240bbb4f20
tags:
    - safari
    - tips
---

Safari 3.1开始提供了一个隐藏参数, 用来开启Safari的单窗口模式, 具体方法如下:

1. 不管你用什么方法, 打开一个Terminal

2. 在Terminal里输入:

    defaults write com.apple.Safari TargetedClicksCreateTabs -bool true

3. 完成&#8230;

咳, 貌似只适用于Mac版本

