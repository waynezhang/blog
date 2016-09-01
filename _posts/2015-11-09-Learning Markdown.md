---
layout: post
title: Markdown 学习小记
date: 2015-11-09
subtitle: 高效格式！超迷你latex
author:     "Norris"
categories: blog
tags: [tech]
description: 学习笔记
---
# Markdown 使用学习

学习内容来源于[官方说明](http://www.appinn.com/markdown/#overview)

注意内容适用于Ipython notebook中的markdown

# 以下为补充内容

## 插入本地文件

例如：

* 插入图片

notebook中的markdown目前不支持插入本地图片，可以生成网页链接插入。或者使用Html的图片标签。

>< img src="../images/python_logo.svg" >

><img src="/image/green.jpg"

* 插入视频

目前视频差不只支持本地，如果要插入网上视频，需要Html的video标签，详情参看[这里](http://segmentfault.com/q/1010000000424925)

> <video controls src="images/animation.m4v" />


注意的是该方法只能插入notebook子目录下的文件

## 嵌入代码块

用三个 \` \` \` 包裹即可，注意要注明代码类型，如javascript或者python

>```python
print "Hello World"
```

>```javascript
console.log("Hello World")
```


## 换行的另一种方法

大多数情况下用多于两个空行的方法都可以，但是在使用了特殊的符号之后，这种方法会失效，此时需要利用Html语法中的 < br > 来实现<br><br><font size=3>见调整字体大小中的实例代码</font>

## 调整字体大小

<font size=3>我是变大的字</font>
