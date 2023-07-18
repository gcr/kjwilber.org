---
layout: home.njk
---

<div class="illo-container">
  <h1 class="title">Kimberly Wilber</h1>
  <img src="/static/kimmy-profile.jpg" srcset="/static/kimmy-profile.jpg 1x, /static/kimmy-profile@2x.jpg 2x" class="illustration" style="align: right" alt="Kimberly Wilber">
</div>

Welcome to the Glitch [Eleventy](https://www.11ty.dev/) starter, where you can create a blog or landing page that generates a static site.

Each of the initial blog posts has special tips to help you get the most out of your new site–work through them all, learning how to add posts and customize how your site builds along the way. Once you've mastered the basics, you can delete all these posts and continue writing your own!

# Replit Eleventy
This is a template to easily create a multipage website with <a href="https://11ty.dev/">Eleventy</a>!   
Or, as commonly used, a blog.

# What's <a href="https://11ty.dev/">Eleventy</a>?
Eleventy is a static site generator, and it creates websites 
from Markdown files and other files if configured to do so.  

But enough about Eleventy at it's core, you can read about it on <a href="https://11ty.dev/">the website</a>. (I've linked it enough already.)

# How do I use this template?
It's simple! All the files needed are in the `/source` and `/static` folders.

## The `/source` folder
The `/source` folder keeps the layouts and the pages.
For example, `index.md` is this page! <!-- Hello viewer! This is correct! -->

### What's `/source/layouts`?
Easy to say, it's just the layouts for the pages. All the pages on this demo use `main.njk` as the layout.

## The `/static` folder
The `/static` folder houses the static, non-modified files.  
Example: The `style.css` file, which makes this page look <span class="pretty">pretty</span>.  

You might also be wondering what the `/_site` folder is, too.

## The `/_site` folder
Simply put: <span style="color: red;">DO NOT EDIT</span>!  
This folder is an auto-generated folder,
and it just houses the generated website content.

## *eyes `.eleventy.js`*
Oh, that `.eleventy.js` is the config file for eleventy, 
and you can edit it all you want
as long as you know what you're doing.  

# This is YOUR page
This template is your oyster!

Continue on and read the <a href="https://11ty.dev/docs/">Eleventy Docs</a>
to know what you should do and how to use this.  
You can change the layout of all the files as long as you know what you're doing!

<a href="https://replit.com/@lopste/Eleventy?v=1">Link to template</a> (if you were linked here and don't know where to go)

<div style="height: 20vh;"></div>

<div id="footer">
  Template & Page made by <a href="https://vercte.net">Vercte</a> (@lopste on Replit) <br>
  Font used is <a href="https://manropefont.com">Manrope</a> (I use it for everything)
</div>

# Posts

<ul>
{%- for post in collections.posts -%}
<li>{{ post.data.title }}</li>
{%- endfor -%}
</ul>
      