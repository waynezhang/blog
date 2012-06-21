---
layout: default
---

<div>
  <ul class="listing">
  {% for post in site.posts limit: 2 %}
  <article class="content">
    <section class="title">
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    </section>
    <section class="meta">
    <span class="time">
      <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
    </span>
    {% if post.tags %}
    <span class="tags">
      {% for tag in post.tags %}
      <a href="/tags.html#{{ tag }}" title="{{ tag }}">#{{ tag }}</a>
      {% endfor %}
    </span>
    {% endif %}
    </section>
    <section class="post">
    {{ post.content }}
    </section>
    </article>
  {% endfor %}
  </ul>
  <div class="center">
  <a href="/archive.html" class="circle-wrapper">
  <div class="circle">&nbsp;</div>
  <div class="circle">&nbsp;</div>
  <div class="circle">&nbsp;</div>
  </a>
  </div>
</div>
