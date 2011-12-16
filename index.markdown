---
title: setImpl
layout: default
---

<ul class="listing">
{% for post in site.posts limit:10 %}
  <li>
    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
  </li>
{% endfor %}
</ul>

more articles [here](/archive.html)
