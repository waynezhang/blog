---
title: 'fossil HTTPS patch'
layout: post
guid: urn:uuid:e14a2804-f4f2-4037-b1b2-72129894167d
tags:
    - fossil
---

最近用fossil搭了个wiki，不过原版尽管支持https schema的url生成，却漏掉了https header的判断，小小patch了一下

    --- src/cgi.c	2010-07-10 01:57:40.000000000 +0900
    +++ src/cgi.c	2010-07-21 16:22:41.000000000 +0900
    @@ -1140,6 +1140,8 @@
           cgi_setenv("HTTP_IF_NONE_MATCH", zVal);
         }else if( strcmp(zFieldName,"if-modified-since:")==0 ){
           cgi_setenv("HTTP_IF_MODIFIED_SINCE", zVal);
    +    }else if( strcmp(zFieldName,"https:")==0 ){
    +      cgi_setenv("HTTPS", zVal);
         }
       }


至于fossil是个什么东西以后有空整理一下，感兴趣的童鞋可以去 [Fossil](http://www.fossil-scm.org) 看下

