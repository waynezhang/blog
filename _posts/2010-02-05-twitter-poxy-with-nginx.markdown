---
title: 'Twitter Proxy With Nginx'
layout: post
guid: urn:uuid:63cd36e1-dc2c-47b2-b71d-66e6e0142dbb
tags:
    - nginx
    - twitter
    - proxy
    - tips
---

利用nginx的proxy，分分钟搞定。

    server {
      listen       443;
      server_name  domain.com;
      charset utf-8;
      ssl          on;
      ssl_certificate  /etc/nginx/certxxxx;
      ssl_certificate_key  /etc/nginx/keyxxxx;

      ......

        location /twitterproxy {
          proxy_set_header X-Real-IP $remote_addr;
          rewrite /twitterproxy$ /twitterproxy/;
          rewrite /twitterproxy/(.*) /$1 break;
          proxy_pass https://twitter.com:443;
        }

      location /twittersearchproxy {
        proxy_set_header X-Real-IP $remote_addr;
        rewrite /twittersearchproxy$ /twittersearchproxy/;
        rewrite /twittersearchproxy/(.*) /$1 break;
        proxy_pass https://search.twitter.com:443;
      }
    }

重启nginx，打开twitter客户端，把api地址改成domain.com/twitterproxy，search api改为domain.com/twittersearchproxy即可。

注：部分客户端（如iPhone Tweetie）会禁止非认证证书，所以自做的证书不可用

