---
title: 'nginx proxy实现feedburner域名绑定'
layout: post
guid: urn:uuid:3fe3d657-91cb-4269-904d-4a81839167c5
tags:
    - feedburner
    - nginx
---

好吧feedsky又一次挂掉了，忍无可忍之下换回feedburner。

其实最早是用fb的，不过有两个最大的问题让我转去了feedsky。其一是域名绑定，feedburner的域名绑定很鸡肋，因为是绑定在yourdomain.com/feedname这样子的url下，反正url都一样难看我何苦还要绑定？第二个不用fb的原因就是墙了。

以前觉得这两个问题很严重，回头想想其实利用nginx的proxy module其实是很容易解决的。把子域名指向主机（例：feed.gopherwood.info），配置nginx如下：

    server {
      listen       80;
      server_name  feed.gopherwood.info;
      charset utf-8;
      access_log   /var/log/nginx/gopherwood.access.log  main;
      error_page   500 502 503 504  /50x.html;

      location / {
        proxy_set_header         Host             feeds.feedburner.com;
        proxy_set_header         X-Real-IP        $remote_addr;
        proxy_set_header         X-Forwarded-For  $proxy_add_x_forwarded_for;

        # 这里的/gopherwood是feedburner的feed name
        rewrite                  ^(.*)$           /gopherwood$1 break;

        proxy_max_temp_file_size 0;
        proxy_pass               http://feeds.feedburner.com;
      }
    }

PS：其实之前折腾blog的时候也考虑过把文章托管在blogger，文字以外的资源托管在vps或者amazon或者其他什么的云存储上，通过blogger的missing file host来处理，然后利用nginx的proxy来搞定墙的问题。等blogger支持自定义slug了就换去玩儿玩儿。

