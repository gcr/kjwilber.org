---
layout: page.njk
title: Kimberly Wilber
profileImage: /static/kimmy-profile.webp
profileImage2x: /static/kimmy-profile@2x.webp
eleventyNavigation:
  key: About
  order: 1

titleLinks:
  Github: https://github.com/gcr
  Resume: /resume.pdf
  LinkedIn: https://www.linkedin.com/in/kwilber/
  Google Scholar: https://scholar.google.com/citations?user=OAtUvx0AAAAJ&hl=en&oi=ao
---

Hello! I'm a research engineer with an academic computer vision background in NYC.
My interests include applied computer vision and machine learning to empower users and the society we live in, especially assistive technology, privacy/security, ecology, the construction of individual identity, the study and practice of creativity, and antisurveillance. I'm also interested in LLMs, mechanistic interpretability, and creating infrastructure for research communities.

I started my career as a research assistant at the Vision and Security Technology lab and as a software engineer at Securics, Inc., both under [Terrance E. Boult](http://vast.uccs.edu/~tboult).
I graduated with a Ph. D. from Cornell Tech's SE(3) computer vision group under [Dr. Serge Belongie](https://serge.belongie.com/).
From there, I worked for six years as a software engineer at Google Research on a variety of problems before co-founding [Krnel](https://krnel.ai) with [Peyman Faratin](https://en.wikipedia.org/wiki/Peyman_Faratin).


<!-- The work that I enjoy the most is visually communicating experimental results to an outside audience, quickly producing figures or plots of internal ML state diagnostics, creating infra/tools for engineers to find insights faster. I'm also skilled at performance optimization, e.g. rewriting hot loops in lower-level languages or SSE/AVX compiler intrinsics, especially improving "research-quality" code. -->

{% if false %}
# Posts

<ul>
  {%- for post in collections.posts -%}
    {%- if loop.index < 5 -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | date("yyyy-LL-dd") }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
    {%-endif-%}
  {%- endfor -%}
  <li><a href="/posts">View all posts</a></li>
</ul>
{% endif %}

# Selected Papers

This is an excerpt. [View all publications...](/publications)

<table>
{%- set prev_year = 0 -%}
{%- for paper in papers.paperList -%}
{%- if paper.spotlight -%}

<tr>
  {%- if prev_year != paper.year -%}
  <tr><td><h2>{{paper.year}}</h2></td></tr>
  {%- endif -%}
  {%- set prev_year = paper.year -%}
  <tr>
    <td><h4> {{paper.spotlight.oneline}}</h4>
<ul>
    <li>
      {%- if paper.pdf -%}
      [<a href="/static/pdfs/{{paper.pdf}}">PDF</a>]&nbsp;
      {%- endif -%}
      {%- if paper.arxiv -%}
      [<a href="https://arxiv.org/abs/{{paper.arxiv}}/">arXiv</a>]&nbsp;
      {%- endif -%}
      {%- if paper.url -%}
      [<a href="{{paper.url}}">link</a>]
      {%- endif -%}
      <b>{{ paper.title }}</b><br />
      {%- for author in paper.authors -%}
        {{author}}{%- if not loop.last %};{%else%}.{% endif  %}
      {% endfor -%}
      <em>{{ paper.venue }}</em>
    </li>
  </ul></td>
<td class="figure">
  {%if paper.spotlight.figure-%}
    <img src="{{paper.spotlight.figure}}" alt="Figure 1 from the paper" />
  {%-endif%}
  {{paper.spotlight.caption}}
</td>
</tr>
{%- endif -%}
{%- endfor -%}
</table>

[View all publications](/publications)

# Support
Throughout my academic career, I am grateful to be supported by Dr. Serge Belongie, the NSF Graduate Research Fellowship, Oath, Google, Adobe, the faculty and staff at Cornell Tech, and and my friends, family, partners, and community. I am an [Oath PhD fellow](http://cx.jacobs.cornell.edu/). I also participated at the NSF REU program at UCCS in Summer 2011.

## Contact

You can find my contact details on my [resume](/resume.pdf) or my [LinkedIn page](https://www.linkedin.com/in/kwilber/).


<img src="/static/figures/cornell-tech.png" style="display: block; margin: 20px auto; max-width: 100px;" alt="Cornell Tech logo" />
