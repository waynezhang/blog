---
title: "Jekyll with Tags on Github Pages"
layout: post
guid: urn:uuid:821c03fb-f6c7-4fe5-8a68-57427be70883
tags:
    - blog
    - jekyll
---

最近又折腾了一回，从 hyde 换到了 jekyll，顺便迁移到了 Github Pages，省了一笔服务器的费用，也不用再手痒去折腾 vps。

hyde 到 jekyll 的迁移很简单，大都是模板的修正和简单的配置，唯有 tags 的地方出了点小插曲。

jekyll 本身是支持 tags 的，所有的 tag 数据都可以从 site.tags 取到，但是却没有一个现成的 tag 页面生成方案。之前用 hyde 是给每个 tag 都生成单独的 index 页面，有些繁琐也过于繁杂，于是这次把所有 tag 都集合到一个页面，然后做 html 的 anchor。同时找了个 [tag cloud 的 plugin](http://yeban.in/jekyll-tag-cloud.html "Jekyll Tag Cloud")，传上去才发现原来 github pages 出于安全原因禁止了用户的 plugin。之后考虑了把源数据的东西和生成的 \_site 分开两个 repo，然后把 blog 指向 \_site。好处是从此可以随意添加 plugin，坏处是 publish 变得无比麻烦（虽然之前 hyde 我也是这么做的）。另一个想法是 deploy 到 heroku 上去，可是 heroku 实在是太慢了，还没设置完就彻底放弃了。

于是，最终的解决方案是 javascript（出于洁癖越来越不喜欢在页面里嵌入 js 所以这个一直最后才会考虑的手段）。

搜了一下发现已经有现成的东西 － [jquery.tagcloud.js](https://github.com/addywaddy/jquery.tagcloud.js/ "jquery.tagcloud.js")。连带着 jquery 一起下下来，然后是 tag 页面：

<script src="https://gist.github.com/1495626.js"></script>

- *虽然嵌代码时 iA Writer 很麻烦，不过总的来说还是不错的。Textmate 2 虽然承诺了完整的 CJK 支持，但也还是停留在显示阶段而已，输入时还是有很多问题，无论中日文，说完美真是对不起“完美”这个词。话说 Textmate 2 居然真的存在w*
- *jekyll 比 hyde 处理的速度快多了*
- *jekyll 嵌 liquid 的 code 真麻烦，索性以后都用 gist 了，也省了高亮的 js 和 css*
