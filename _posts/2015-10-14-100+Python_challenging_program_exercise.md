---
layout: post
title: 100+Python challenging program exercise
date: 2015-10-14
categories: blog
subtitle: python大法好啊
author:     "Norris"
tags: [python]
description: 
---

## Question 1

- .join(x)函数用来连接字符串格式数据，.join之前输入符号用来分割x中字符串内容 例如：##’,’.join([‘a’,’b’,’c’]输出结果为 a,b,c

## Question 2

- 循环和条件有时候是可以互相转化的

## Question 3

- dict( ) 字典函数

## Question 4

- x.split( ‘ , ' )以逗号为分隔符分割数据，默认分割成一个list

## Question 6

- #!/usr/bin/env python与#!/usr/bin/python的区别

     脚本语言的第一行，目的就是指出，你想要你的这个文件中的代码用什么可执行程序去运行它.
     #!/usr/bin/python是告诉操作系统执行这个脚本的时候，调用/usr/bin下的python解释器；
     #!/usr/bin/env python这种用法是为了防止操作系统用户没有将python装在默认的/usr/bin路径里。当系统看到这一行的时候，首先会到env设置里查找python的安装路径，再调用对应路径下的解释器程序完成操作。
     #!/usr/bin/python相当于写死了python路径;
     #!/usr/bin/env python会去环境设置寻找python目录,推荐这种写法

- items=[x for x in raw_input().split(‘,’)] 直接在list中将简单循环写入，十分方便。此行代码含义为，将输入的以逗号为分隔符的序列赋值与items

## Question 8

- items.sort() 对items中的元素进行排序

## Question 9

- 为何形式这么复杂 只要s=raw_input() 再加上print s.upper() 就可以实现啊
- 回答上面问题：因为要考虑到输入者可能不输入任何字符的情况，while true的作用是将整个下方代码看做一个整体，直到做出符合的命令才可以跳出，例如如果用户一直不输入字符，则一直继续让用户输入，而如果不加入while命令，会立马跳出程序。

## Question 10

- set（）函数可以将对象中唯一的元素挑出来，剔除重复元素。并且以集合形式输出，注意字典型数据和集合都是用 {  } 大括号表示的，字典中元素有键和值两部分构成以冒号区分，而集合没有。

## Question 11

- int（p，2） 转化进制函数 其中p必须是字符串，不能是直接的数字

## Question 12

- 怎样把每一位数字的检验写成一个循环呢？

## Question 13

- items.isdigit() 判断items是否是一个数字
- items.isalpha() 判断items是否是一个字母
- 考虑完全所有情况 加上pass情况

## Question 14

- items.isupper( ) 判断items是否是一个大写的字母
- items.islower( ) 判断items是否是一个小写的字母

## Question 15

- “ %s ” %a 以a代替s的位置 注意是字符串的操作 多个替代形式为 “ %s%s” % ( a,a )

## Question 16

- While True 的作用让用户一直输入折旧和回收的值，然后再进行计算。