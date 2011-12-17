---
title: '代码高亮 - 续'
layout: post
guid: urn:uuid:da441d0d-6d68-4413-bed7-da0e5c4dd30b
tags:
    - tips
---

上次说用[vim来解决post里代码高亮](http://gopherwood.info/2008/06/23/highlight-code-with-vim/index.html)的问题, 然后收到了来自[发芽网](http://www.fayaa.com/code/)的推荐

> 写博客时，没有代码高亮？
> 发邮件时，代码格式很乱？
> 有好代码，保存后很难找？

来看下效果:

    <pre style="font-family:">
    <span style="text-decoration: underline">C++代码</span>, 代码高亮@<a href="http://www.fayaa.com/code/">代码发芽网</a>

    <div class="source"><span class="lineno">1</span> <span class="_cp" style="color: #bc7a00">#include &lt;stdio.h&gt;
    </span><span class="lineno">2</span> <span class="_kt" style="color: #b00040">int</span><span class="_"> </span><span class="_n">main</span><span class="_p">()</span><span class="lineno">
    3</span> <span class="_p">{
    </span><span class="lineno">4</span> <span class="_">    </span><span class="_n">printf</span><span class="_p">(</span><span class="_s" style="color: #ba2121">"Hello world!"</span><span class="_p">);
    </span><span class="lineno special">5</span> <span class="lineno">
    6</span> <span class="_">    </span><span class="_k" style="font-weight: bold;color: #008000">return</span><span class="_"> </span><span class="_mi" style="color: #666666">0</span><span class="_p">;
    </span><span class="lineno">7</span> <span class="_p">}</span></div>
    </pre>

发芽网还支持code snippet的存储和搜索, 也就是类似代码snippet仓库的功能, 而事实上代码高亮也似乎只是这个功能的副产品.
不过个人不太喜欢在html里嵌入style, 所以暂时还是用vim来搞定. 不在意这个又喜欢方便的, 发芽网的确是个不错的选择

