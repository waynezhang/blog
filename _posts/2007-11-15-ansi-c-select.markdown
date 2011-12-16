---
title: '关于标准c的select'
layout: post
guid: urn:uuid:d0c24cf3-76b7-4570-bf81-df76ef75f8f6
tags:
    - c
    - programming
---

不知道哪个哥们写得,从ir红外线设备获取数据居然轮询,搞得程序一起来CPU占用率就达到99%,哪怕什么也不做&#8230;

于是动手改成对设备的fd进行select,block至获取数据或超时

    int  select (int nfds, fd_set *read_fds, fd_set *write_fds, fd_set *except_fds, struct timeval *timeout)

结果发现:

  * 设备一定要以block方式打开,即不能加O_NONBLOCK的mask
  * fd_set在select返回时会变化,如果重新对同一个设备进行select,则需要重新调用FD_SET来加入fd到fd_set

不可能没学过的,居然一点印象都没有了诶

其次, 后来发现select的另一个用途sleep线程

在多线程程序里,在某个线程内调用sleep,usleep会导致整个程序的sleep,相信这个在大多数情况下都不是大家所期望的结果,那么你可以这样:

    struct timeval timeout;
    timeout.tv_sec = 1; /* 1s */
    timeout.tv_usec = 0; /* 0 microsecond */

    select (1, NULL, NULL, NULL, &timeout);

