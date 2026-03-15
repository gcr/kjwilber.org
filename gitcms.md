---
version: "1"
website_url: https://kjwilber.org/
media_path: /static/figures/
ssg_framework: eleventy
default_branch: dev
frontmatter_format: yaml
sitemap_url: https://kjwilber.org/sitemap.xml
publishing_mode: editorial_workflow
i18n:
  enabled: false
  locales:
    - en
  default_locale: en
  prefix_default_locale: false
collections:
  - name: blog
    git_path: /blog/
    file_extension: .md
    filename_pattern: ""
    collection_type: grouped
    frontmatter_schema:
      - name: title
        type: title
        label: Title
      - name: excerpt
        type: richtext
        label: Excerpt
      - name: date
        type: datetime
        label: Date
      - name: draft
        type: boolean
        label: Draft
        default: true
      - name: tags
        type: multiselect
        label: Tags
        options:
          - sketches
        color: blue
      - name: ail
        type: number
---

# GitCMS Configuration File

> [!WARNING]
> This file is managed by [GitCMS](https://gitcms.dev).
> Update configuration only from the GitCMS web app.
