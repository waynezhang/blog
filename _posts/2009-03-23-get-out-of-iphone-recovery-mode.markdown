---
title: '跳出iPhone的Recovery Mode'
layout: post
guid: urn:uuid:2848a70d-7d50-4460-a3ad-272065b7bfe1
tags:
    - iphone
    - tips
---

> 生命在于折腾

看到新东西就手痒, 尤其是那些个Beta啊Alpha啊内测啊不要钱啊什么的, 看[fireyy](http://fireyy.com)同学从自制固件升到3.0而不要激活, 终于还是忍不住带着无锁版需不需要激活的疑问刷了3.0. 反正可以降回来的嘛.

当然, 结果是毫无悬念的--需要激活. 找不着人帮忙激活, 又舍不得那99美刀, 于是降级回来. 问题出现了

先说说网上的降级步骤:

1. 进DFU
2. Restore
3. 忽略1013错误, 打开QuickPwn, 重启iPhone, 激活

反反复复尝试了n遍, 每次都卡在第3步, 无论怎么刷怎么开QuickPwn怎么重启iPhone, 最终都停留在那个可恶的Recovery Mode

怀疑是Mac的问题, 找了台Windows机器无奈QuickPwn非法操作, ziphone则卡在Searching iphone的地方不动. 在google上猛搜get out of recovery mode, 于是找到了如下解决方案

1. 下载iRecovery, 链接请[猛击这里](http://chronicdev.googlecode.com/files/iRecovery-Mac.zip)
2. 解开zip包, 进入Terminal, 用-s参数运行

    ./iRecovery -s

3. 执行fsboot命令

    fsboot

此时屏幕还会继续保持在Recovery Mode一会儿, 大概有个半分钟的样子会进入激活模式, iTunes开着的话会自动激活

OS可以降回到2.2.1, 基带是降不回去了, 不过不影响通话, 暂且先用着吧

XBOX 1: 感谢fireyy同学在我变砖的时候给与的热心支持, 顺便bs某些同学的幸灾乐祸甚至趁火打劫

XBOX 2: 定的iPod Shuffle今儿发货了, 不知那天能到

XBOX 3: 霍霍师太终于在赤果果的索要评论之后今天又赤果果的索要推介, 我就勉为其难推荐一下 -- [双霍记](http://doublehuo.cn). 不过话说回来来我这儿的人大部分也都能找到在双霍记上的留言, 呃...不管怎么说, 一个有着250个订阅者的二百五博客还是很值得大家一看的, 您不相信我的眼光您也要相信广大250 (个) 群众的眼光

