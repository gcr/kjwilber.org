---
layout: page.njk
title: Posts
eleventyNavigation__DISABLED:
  key: Blog
  order: 2
---

<ul>
    {%- for post in collections.posts -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | htmlDateString }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
    {%- endfor -%}
</ul>