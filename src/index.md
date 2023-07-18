---
layout: home.njk
---

<div class="illo-container">
  <h1 class="title">Kimberly Wilber</h1>
  <img src="/static/kimmy-profile.jpg" srcset="/static/kimmy-profile.jpg 1x, /static/kimmy-profile@2x.jpg 2x" class="illustration" style="align: right" alt="Kimberly Wilber">
{%include "_links.njk" %}
</div>

Hello! I'm a machine learning researcher in NYC currently working as a software engineer at Google AI. Before graduating in 2018, I was a Ph.D. student at the [Cornell Tech SE(3) Vision Group](http://vision.cornell.edu/se3/) under [Dr. Serge Belongie](http://cseweb.ucsd.edu/~sjb/). I previously worked as a research assistant in the [Vision and Security Technology lab](http://vast.uccs.edu/) and as a software engineer at [Securics, Inc.](http://securics.com/), both under [Terrance E. Boult](http://vast.uccs.edu/~tboult).

My hobbies include peer counseling, bouldering (still a beginner, VB-V1), lifting (beginner), hiking, and finding delicious quiet places in the city to drink tea and read books.

## Around the Web

- [LinkedIn](https://www.linkedin.com/in/kwilber/)
- [Mastadon](https://hachyderm.io/@ghostynewt)
- [Google Scholar](https://scholar.google.com/citations?hl=en&user=OAtUvx0AAAAJ&view_op=list_works&sortby=pubdate)

# Scraps

<ul>
  {%- for post in collections.posts -%}
    <li{% if page.url == post.url %} aria-current="page"{% endif %}>{{ post.data.page.date | htmlDateString }} — <a href='{{ post.url }}'>{{ post.data.title }}</a></li>
  {%- endfor -%}
  <li><a href="/posts">View all posts</a></li>
</ul>

# Papers

...

# Support
Throughout my academic career, I am grateful to be supported by Dr. Serge Belongie, the NSF Graduate Research Fellowship, Oath, Google, Adobe, the faculty and staff at Cornell Tech, and and my friends, family, partners, and community. I am an [Oath PhD fellow](http://cx.jacobs.cornell.edu/). I also participated at the NSF REU program at UCCS in Summer 2011.

## Contact

You can find my contact details on my [CV](/cv/cv.pdf) or my [LinkedIn page](https://www.linkedin.com/in/kwilber/).