---
layout: page.njk
title: Publications
eleventyNavigation:
  key: Publications
  order: 1
---

# Publications

Throughout my career, I've been fortunate to work with several awesome research labs, including Google AI, Adobe Research, the Dropbox photo science team, Securics, the UCCS Vision and Security Technologies Lab, Cornell Tech, and UCSD.

## All conference & journal papers

A full list of publications is also available on [Google Scholar](https://scholar.google.com/citations?hl=en&user=OAtUvx0AAAAJ&view_op=list_works&sortby=pubdate).

>  **Note:** Some work before 2018 is published under a previous name.

<ul>
{%- for paper in papers.paperList -%}
    <li>
      <b>{{paper.year}}:</b>
      {{ paper.title }} 
      {% for author in paper.authors -%}
        {{author}}{%- if not loop.last %};{% endif %}
      {% endfor -%}
      {{ paper.venue }}
    </li>
{%- endfor -%}
</ul>