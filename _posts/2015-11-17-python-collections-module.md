---
layout: post
title: python collections module
date: 2015-11-17
subtitle: 
author:     "Norris"
categories: blog
tags: [python]
description: 自带模块学习
---

# python 自带电池 collections module

collection模块包含以下函数：

Python拥有一些内置的数据类型，比如str, int, list, tuple, dict等，collections模块在这些内置数据类型的基础上，提供了几个额外的数据类型：

1. namedtuple(): 生成可以使用名字来访问元素内容的tuple子类
2. deque: 双端队列，可以快速的从另外一侧追加和推出对象
3. Counter: 计数器，主要用来计数
4. OrderedDict: 有序字典
5. defaultdict: 带有默认值的字典

## namedtuple()

namedtuple主要用来产生可以使用名称来访问元素的数据对象，通常用来增强代码的可读性， 在访问一些tuple类型的数据时尤其好用。

例如：

    #-*- coding: utf-8 -*-
    """
    比如我们用户拥有一个这样的数据结构，每一个对象是拥有三个元素的tuple。
    使用namedtuple方法就可以方便的通过tuple来生成可读性更高也更好用的数据结构。
    """
    from collections import namedtuple
    websites = [
        ('Sohu', 'http://www.google.com/', u'张朝阳'),
        ('Sina', 'http://www.sina.com.cn/', u'王志东'),
        ('163', 'http://www.163.com/', u'丁磊')
    ]
    Website = namedtuple('Website', ['name', 'url', 'founder'])
    for website in websites:
        website = Website._make(website)
        print website
    # Result:
    Website(name='Sohu', url='http://www.google.com/', founder=u'\u5f20\u671d\u9633')
    Website(name='Sina', url='http://www.sina.com.cn/', founder=u'\u738b\u5fd7\u4e1c')
    Website(name='163', url='http://www.163.com/', founder=u'\u4e01\u78ca')

## deque

deque其实是 double-ended queue 的缩写，翻译过来就是双端队列，它最大的好处就是实现了从队列 头部快速增加和取出对象: .popleft(), .appendleft() 。
你可能会说，原生的list也可以从头部添加和取出对象啊？就像这样：

    l.insert(0, v)
    l.pop(0)

但是值得注意的是，list对象的这两种用法的时间复杂度是 O(n) ，也就是说随着元素数量的增加耗时呈 线性上升。而使用deque对象则是 O(1) 的复杂度，所以当你的代码有这样的需求的时候， 一定要记得使用deque。
作为一个双端队列，deque还提供了一些其他的好用方法，比如 rotate 等。
举个栗子


    # -*- coding: utf-8 -*-
    """
    下面这个是一个有趣的例子，主要使用了deque的rotate方法来实现了一个无限循环
    的加载动画
    """
    import sys
    import time
    from collections import deque
    fancy_loading = deque('>--------------------')
    while True:
        print '\r%s' % ''.join(fancy_loading),
        fancy_loading.rotate(1)
        sys.stdout.flush()
        time.sleep(0.08)
    # Result:
    # 一个无尽循环的跑马灯
    ------------->-------

- 其中sys.stdout重定向请看[这里](http://blog.sina.com.cn/s/blog_50df29030101jej5.html)
- flush功能主要是清除缓存,距离请看[这里](http://blog.csdn.net/moxiaomomo/article/details/8991676)

## Counter

Counter类的目的是用来跟踪值出现的次数。它是一个无序的容器类型，以字典的键值对形式存储，其中元素作为key，其计数作为value。计数值可以是任意的Interger（包括0和负数）。Counter类和其他语言的bags或multisets很相似。

详情请看[这里](http://www.pythoner.com/205.html)

## OrderedDict

在Python中，dict这个数据结构由于hash的特性，是无序的，这在有的时候会给我们带来一些麻烦， 幸运的是，collections模块为我们提供了OrderedDict，当你要获得一个有序的字典对象时，用它就对了。

    # -*- coding: utf-8 -*-
    from collections import OrderedDict
    items = (
        ('A', 1),
        ('B', 2),
        ('C', 3)
    )
    regular_dict = dict(items)
    ordered_dict = OrderedDict(items)
    print 'Regular Dict:'
    for k, v in regular_dict.items():
        print k, v
    print 'Ordered Dict:'
    for k, v in ordered_dict.items():
        print k, v
    # Result:
    Regular Dict:
    A 1
    C 3
    B 2
    Ordered Dict:
    A 1
    B 2
    C 3

## defaultdict
我们都知道，在使用Python原生的数据结构dict的时候，如果用 d[key] 这样的方式访问， 当指定的key不存在时，是会抛出KeyError异常的。
但是，如果使用defaultdict，只要你传入一个默认的工厂方法，那么请求一个不存在的key时， 便会调用这个工厂方法使用其结果来作为这个key的默认值。

    # -*- coding: utf-8 -*-
    from collections import defaultdict
    members = [
        # Age, name
        ['male', 'John'],
        ['male', 'Jack'],
        ['female', 'Lily'],
        ['male', 'Pony'],
        ['female', 'Lucy'],
    ]
    result = defaultdict(list)
    for sex, name in members:
        result[sex].append(name)
    print result
    # Result:
    defaultdict(<type 'list'>, {'male': ['John', 'Jack', 'Pony'], 'female': ['Lily', 'Lucy']})

以上内容归纳于[这里](http://www.jb51.net/article/48771.htm)
