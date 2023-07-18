---
layout: page.njk
---

# Posts

Write some details about your post lists. Or don't, and remove this!

<ul>
    {%- for post in collections.posts -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | htmlDateString }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
    {%- endfor -%}
</ul>