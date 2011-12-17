---
title: '定期自动备份数据库'
layout: post
guid: urn:uuid:f53912a2-f604-4949-8289-5ca38fe3e9cc
tags:
    - wordpress
    - tips
---


> 有插件的用插件，没插件的往下看

1. 安装mutt：

        ~# apt-get install mutt

    *设定发送的邮件信息，把domain.com改成实际的域名*

        ~# echo -e 
        set realname="no-reply" \n
        # change your domain name here \n
        set from="no-reply@domain.com" \n
        set use_from=yes 
        > ~/muttrc-noreply

    *mutt不是唯一选择，关于更多从命令行发送带附件邮件的信息可以看[Sending email with attachments on UNIX systems](http://www.panix.com/~kylet/unix-att.html)*

2. 在用户目录下新建一个shell脚本backup_database.sh，内容如下，将数据库用户名密码以及名称改为真实信息，RECIPENT改为收件人邮件地址：

        #!/bin/sh
    
        #database backup file name
        FILE=~/database.tar.gz
    
        DATE=`date +%Y-%m-%e`
        TIME=`date +%H:%M`
    
        #database user name
        USER=username
        #database user password                                                                                                                                                                             
        PASS=password
        #database to backup
        DB=database
    
        #mail subject
        TITLE="[Backup] $DB on $DATE"#mail body
        TEXT="$DB backuped at $DATE $TIME"
        #mail recipientRECIPIENT=mail@mail.com

        mysqldump -u$USER -p$PASS $DB | gzip &gt; $FILE &amp;&amp; echo $TEXT | mutt -a $FILE -s "$TITLE" $RECIPIENT -F ~/muttrc-noreply
        rm $FILE

3. 设定crontab定期执行，此处设为每月一日0点0分

        ~# crontab -e

        # m h  dom mon dow   command
        0 0 1 * * sh ~/backup_database.sh

PS1: 其实我不太在意做数据库备份，不过最近把ssh改成了rsa密匙认证，mb不能带到公司而家里又没有网络，直接导致了在公司不能ssh登录我的服务器。而ssh去vps的控制台，却赶上最近vpsvillage做服务器调整，一直无法登录。于是开始有点儿担心万一哪天vpsvillage真撂挑子不干了

PS2: 搬家装网络真是一波三折，看房子的时候给我个地址，拿钥匙的时候告诉我正式的地址应该是这样这样这样的，于是直接致了我之前申请网络的地址作废。从头来过又是个把月。今年的4月和5月我一定过的很健康。

PS3： 新家39平方的使用面积一个人住倒是也不算大。房子是哪儿都好，就是门太矮，搬来俩礼拜头上多了不少大包

PS4: 前些天开玩笑把msn签名改成了“我的精神分裂已经治好了，现在我和我都很好”。于是收到了不少问候。。。在此我很感谢大家，不过我真没精神分裂，真的。。。


