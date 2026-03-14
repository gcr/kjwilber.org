---
layout: page.njk
title: Kimmy's Blog
eleventyNavigation:
  key: Blog
  order: 0
draft: true
---

<ul>
    {%- for post in collections.posts | reverse -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | date("yyyy-LL-dd") }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
    {%- endfor -%}
</ul>