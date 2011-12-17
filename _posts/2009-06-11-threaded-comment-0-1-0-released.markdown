---
title: 'Threaded Comment For Habari 0.1.0'
layout: post
guid: urn:uuid:a9928964-a397-46e6-8d8d-f0d68c18ca77
tags:
    - habari
    - plugin
---

最新的trunk里把Plugin的info方法改为final，导致之前的版本不能用，修复的时候顺带着加了些功能，跳至0.1.0

新feature：

  * 自定义提醒邮件的内容和样式，增加了html格式
  * 添加了Unsubscribe功能，咱不做流氓
  * 用户登录后可以获得比最大层数多一层的reply权限，用于回复最后一层的访客留言

移步[原帖](/2009/01/18/threaded-comment-0-0-1)下载

-------------------------------------------

New features added and be compatible with SVN r3627

New Features:

  * Custom notification mail with theme
  * Be able to unsubscribe notification
  * Author can get one level deeper than max depth for making the last reply

More information and download from [original post](/2009/01/18/threaded-comment-0-0-1)

