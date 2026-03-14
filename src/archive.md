---
layout: page.njk
title: All Blog Posts
eleventyNavigation:
  key: Archive
  order: 3
draft: true
---

<ul>
    {%- for post in collections.posts | reverse -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | date("yyyy-LL-dd") }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
    {%- endfor -%}
</ul>