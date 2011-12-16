---
title: 'nginx + habari with https'
layout: post
guid: urn:uuid:c197e3b8-a782-496f-ab46-b12c0eeb5d18
tags:
    - nginx
    - habari
---

> tell vistors to add your site into exception, or go to buy a cerficate :D

细心的童鞋已经注意到我这里最近开了https, 起因很简单, 公司这两天搞情报安全强化, 监视一切网络活动. 不想把整个后台就这么赤果果的展示给他们看 (虽然我认为他们铁定看不懂), 所以不得已启用了https

1. 编译nginx

        # ./configure --with-sha1=/usr/lib 
                      --with-md5=/usr/lib 
                      ...
                      --with-http_ssl_module

2. 生成dummy证书

        # openssl genrsa -des3 -out cert.key 1024
        # openssl req -new -key cert.key -out cert.csr
        # openssl rsa -in cert.key -out cert.key
        # openssl x509 -req -days 365 -in cert.csr -signkey cert.key -out cert.pem

    * 注: 如果没有做openssl rsa -in cert.key -out cert.key这一步, nginx会在启动时提示输入密码, 导致server无法自动启动

3. 配置nginx

    最简单的, 把现有配置文件的server部分复制一份, 然后做以下修改

        server {
          listen       443;
          ssl           on;
          ssl_certificate  /usr/local/nginx/conf/cert.pem;
          ssl_certificate_key  /usr/local/nginx/conf/cert.key;
          ...
        }

    habari会在$_REQUEST中检查HTTPS的值, 所以在HTTPS没有设置或者是设置为off的情况下, 即使以https://的scheme访问, 代码中生成的链接仍然是http而不是https, 所以我们需要在cgi参数中加入https项, 如下:


        location ~ .php$ {
          fastcgi_pass   127.0.0.1:9001;
          fastcgi_index  index.php;
          fastcgi_param  SCRIPT_FILENAME  /var/www/habari$fastcgi_script_name;
          fastcgi_param  HTTPS on;
          include        fastcgi_params;
        }

    至此, 重启nginx.

