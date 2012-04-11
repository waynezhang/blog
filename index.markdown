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
    {% if post.tags %}
    <span class="tags">
      tagged by 
      {% for tag in post.tags %}
      <a href="/tags.html#{{ tag }}" title="{{ tag }}">{{ tag }}</a>&nbsp;
      {% endfor %}
    </span>
    {% endif %}
    <span class="time">
      <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
    </span>
    </section>
    <section class="post">
    {{ post.content }}
    </section>
    </article>
  {% endfor %}
  </ul>
  <div class="center">
  <h2><a href="/archive.html">MORE</a></h2>
  </div>
</div>
