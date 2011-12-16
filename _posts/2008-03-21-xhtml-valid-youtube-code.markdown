---
title: '在post中插入符合xhtml规范的youtube视频'
layout: post
guid: urn:uuid:590e39e7-98b0-4dab-b921-854242301b3f
tags:
    - youtube
    - xhtml
---

用一个老鼠害了一锅汤来形容一个youbute视频搞砸了我的xhtml验证真是再恰当不过了, 本着对google的无限景仰和绝对的信任, 一度认为两者就像阶级矛盾一样不可调和, 不过后来终于发现, 其实不然:
youtube的代码如下:

    <object width="425" height="355">
      <param name="movie" value="http://www.youtube.com/v/ePyRrb2-fzs&rel=0&border=0"></param>
      <param name="wmode" value="transparent"></param>
      <embed src="http://www.youtube.com/v/ePyRrb2-fzs&rel=0&border=0" type="application/x-shockwave-flash" wmode="transparent"width="425" height="355"></embed>
    </object>

真是一段冗长的代码阿, 改下试试:

    <object type="application/x-shockwave-flash" style="width:425px; height:350px;" data="http://www.youtube.com/v/ePyRrb2-fzs">
      <param name="movie" value="http://www.youtube.com/v/ePyRrb2-fzs" />
    </object>

bingo, 代码精简的同时, 也能够通过xhtml验证了

