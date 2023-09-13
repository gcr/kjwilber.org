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
{%- set prev_year = 0 -%}
{%- for paper in papers.paperList -%}
  {%- if prev_year != paper.year -%}<h2>{{paper.year}}</h2>{%- endif -%}
  {%- set prev_year = paper.year -%}
    <li>
      <!--<b class="year">{{paper.year}}:</b>-->
      {%- if paper.pdf -%}
      [<a href="/static/pdfs/{{paper.pdf}}">PDF</a>]&nbsp;
      {%- endif -%}
      {%- if paper.arxiv -%}
      [<a href="https://arxiv.org/abs/{{paper.arxiv}}/">arXiv</a>]&nbsp;
      {%- endif -%}
      {%- if paper.url -%}
      [<a href="{{paper.url}}">link</a>]
      {%- endif -%}
      <b>{{ paper.title }}</b> 
      <br />
      {% for author in paper.authors -%}
        {{author}}{%- if not loop.last %};{% endif %}
      {% endfor -%}
      <br />
      {{ paper.venue }}
    </li>
{%- endfor -%}
</ul>