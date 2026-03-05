// Copyright (c) 2026 Kimberly J. Wilber.

#import "/node_modules/eleventy-plugin-typst/typst/template.typ": frontmatter
#frontmatter(
  title: "Resume",
  targets: ("pdf",),
  permalink: "resume.pdf",
)

#set page(
  paper: "us-letter",
  margin: 0.5in,
  header: context [
    #if counter(page).get().first() > 1 [
      #align(right)[
        #h(1fr)
        Kimberly Wilber
        #h(1fr)
        Page #counter(page).display()]
    ]
  ]
)
#set par(
  justify: false,
  leading: 0.5em,
)
#set text(
  12pt,
  font: "Cambria",
  hyphenate: false,
)
#set highlight(fill: rgb("#fff2e2"), extent: 4pt, radius: 2pt)
#show link: set text(fill: blue)
#set list(indent: 10pt)
#set quote(block: true, quotes: true)
#set table(
  columns: (8em, 1fr),
  align: (right, left),
  stroke: none
)
#set table.cell(breakable: false)
#show table: it => {
  pad(left: -2em)[#it]
}
#show table.cell.where(x:0):set text(style:"italic")

// Header section
#grid(
  columns: (1fr, auto),
  column-gutter: 4pt,
  [
    #set par(leading: 0em, spacing: 0em)
    #text(size: 24pt, weight: "bold")[Kimberly J. Wilber]
    #v(6pt)
    #line(length: 100%, stroke: 1.0pt)
    #v(6.0pt)
    Research engineer with an academic computer vision background.
    // #h(1fr) She / Her
  ],
  align(right)[
    kimmy\@kjwilber.org \
    #link("http://kjwilber.org") \
    #link("http://github.com/gcr")[GitHub]
    $dot$
    #link("https://www.linkedin.com/in/kwilber/")[LinkedIn]
    $dot$
    #link("https://scholar.google.com/citations?user=OAtUvx0AAAAJ&hl=en&oi=ao")[Scholar]
  ]
)

#grid(
  columns: (6fr, 7fr, 5fr),
  // column-gutter: 16pt,
  quote(attribution: [Google L6 research scientist, partner team])[
    Invaluable contributions in up-leveling monocular depth #highlight[_across multiple product surfaces at Google_] ... with greatly improved generalization to outdoor scenes as well as latency and memory savings!
  ],
  quote(attribution: [Google L5 research scientist])[
    As a direct result of Kimberly's work, the Mediapipe team was able to use monocular depth as an 'on-device plugin' for their flagship image generation task ... #highlight[_First real-time on-device monocular depth solution open sourced_] via MediaPipe
  ],
  quote(attribution: [Google L6 peer])[
    Kimberly's deep expertise in developing embedding models has positioned her as a #highlight[_trusted authority and go-to expert_], even beyond her own team
  ],
)

== Skills and Expertise

#grid(
  columns: (0.9fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  [
*AI research infrastructure for LLMs, computer vision, and machine learning* \
  I write and manage end-to-end research infrastructure from fledgling experiments to Google-scale teamwide collaborations.
  My projects include writing hooks for LLM mechanistic interpretability, drafting HTML UI for crowdsourcing, training quantized on-device depth prediction CNNs for 3D scene understanding, deploying linear probes at inference-scale, and more.
  I do everything from idea to paper deadline to product launch.
  ], [
*Full-stack software engineer* \
  I love projects that require skilled craftsmanship across the stack, from tight inner loops to high-level UX.
  I'm proficient in UNIX/C, the numerical Python stack (PyTorch, sklearn, matplotlib, numpy/scipy, huggingface transformers), OLAP (DuckDB/LanceDB, Parquet), web backend (Flask, FastAPI, NodeJS), frontend (HTML/Javascript/CSS, Vue, React), and DB (SQLite, Postgres).
  I have over 20 years of experience administering Debian/Ubuntu server clusters across various hosting environments (AWS EC2, GCP, and on-prem) using tools like Ansible and Docker.
  ], grid.cell(colspan: 2)[
*Open-source* \
  I'm a contributor to projects including Racket and Node.js. My #link("https://github.com/gcr")[GitHub profile] has 196 followers. Repositories I created have 200 forks and 700 stars.
  ])



== Professional Experience

#table(
  [2024 -- Present], [
    *Krnel.ai, Technical co-founder, New York, NY*
    - As a technical co-founder, I stand up our research infrastructure from scratch to support our first products. I also do everything in between: pitches, lead generation, and demoing to potential clients.
    - Krnel uses mechanistic interpretability techniques to help companies manage the reputational and compliance risks of their AI models.
  ],

  [2013 -- Present], [
    *Computer vision foundation, Volunteer publication assistant*
    - The #link("https://openaccess.thecvf.com/menu")[CVF Open Access Archive] serves most CVPR, ICCV, and WACV papers to the computer vision community since 2013.
    - I maintain the PDF processing pipeline used in conference proceedings construction.
    - Our stack (Python, Ghostscript, qPDF) adds page numbers, an attribution banner, and proper PDF metadata with automatic checks for common quality problems (figures overlapping margins, etc).
    - Thanks to the automation I built, we're able to process 2,700+ papers with a 3-day turnaround time and less than 5 manual corrections per conference.
  ],

  [2018 -- 2024], [
    *Google AI, Software Engineer, New York, NY*
    - Implemented real-time, on-device monocular depth estimation models for #link("https://research.google/blog/open-sourcing-project-guideline-a-platform-for-computer-vision-accessibility-technology/")[Project Guideline], a tool that helps visually impaired runners exercise independently.
    - Helped create #link("https://research.google/blog/sanpo-a-scene-understanding-accessibility-navigation-pathfinding-obstacle-avoidance-dataset/")[SANPO], a 3D panoptic video dataset for the computer vision community. My role was to create large-scale data processing infrastructure and to shepherd the collection of 3D depth data.
    - Created and refactored internal debug tools for _RankEmbed_, Google Web Search's first foray into LLM embeddings. My tools helped engineers demo the product to executives to build support.
  ],

  [2014 -- 2018], [
    *Cornell Tech, Research Assistant, New York, NY*
    - Conducted computer vision research on perceptual similarity, crowdsourcing, and object recognition.
    - Helped establish and maintain the new vision group's presence at Cornell.
    - Served as TA for classes including four semesters of "CS5785 Modern Analytics."
  ],

  [2017], [*Google Photos Team, Summer Intern, Mountain View, CA*
    - Implemented and tested tools to make it easier for ML engineers to prototype UI interactions.
    - These tools helped shape the feature roadmap for #link("https://support.google.com/photos/answer/7378859?hl=en&co=GENIE.Platform%3DDesktop")[Google Photos Sharing Suggestions].
  ],

  [2016], [
    *Adobe Research, Summer Intern, San Jose, CA*
    - Curated #link("https://arxiv.org/abs/1704.08614")[BAM], one of the first large-scale collections of professional commercial artwork, intended for ML object classification and emotion understanding.
    - Built a data loader system in Python and Redis to quickly analyze millions of images for ML training and inference workloads, speeding up training by 5×.
  ],

  [2014], [*Dropbox Photos Team, Summer Intern, San Francisco, CA*
    - Conducted product-focused computer vision research.
    - Introduced our team to more efficient tools and technologies.
    - Maintained a computer vision evaluation and experimentation pipeline for crowdsourced data collection of face images.
  ],

  [2013], [*University of California, San Diego, Research Assistant, San Diego, CA*],

  [2012 -- 2013], [*Securics, Inc., Software Engineer, Colorado Springs, CO*],

  [2009 -- 2013], [*Vision and Security Technology (VAST) Laboratory at UCCS, Assistant Researcher, Colorado Springs, CO*],

  [2011], [*NSF REU Program, University of Colorado Colorado Springs, Summer Researcher, Colorado Springs, CO*],

  [2009 -- 2010], [*Securics, Inc., NSF RAHSS High School Intern, Colorado Springs, CO*],
)

== Education

#table(
  [2014 -- 2018], [*Ph.D. in Computer Science, Cornell Tech* \
    Advised by Dr. Serge Belongie. Thesis topic: combining computer vision and crowdsourcing techniques.
    Supported by the National Science Foundation Graduate Research Fellowship (NSF GRFP)
  ],

  [2009 -- 2013], [*Bachelor of Innovation in Computer Science, University of Colorado Colorado Springs* \
    Supported by the Kane Family Foundation Scholarship
  ],
)

== Conferences, Awards, Scholarships

#table(
  [2011 -- Present], [*Student Volunteer at several conferences:* \
    CVPR (IEEE Conference on Computer Vision and Pattern Recognition) 2011, 2012, 2013, 2014, 2015 \
    WACV (Winter conference on Applied Computer Vision) 2012, 2013, 2014
  ],

  [2013 -- 2016], [*National Science Foundation GRFP Awardee*, UCSD/Cornell],

  [2010 -- 2013], [*Dean's List*, UCCS],

  [2010 -- 2013], [*Kane Family Foundation Scholarship Recipient*, Full tuition and books, UCCS],

  [2010 -- 2013], [*Braxton Scholarship Recipient*, UCCS],
)

== Selected Publications
_Note that some work before 2018 is published under a previous name. See #link("https://kjwilber.org/publications")[here] for the unabridged list._
#table(
  [2024], [#link("https://kjwilber.org/static/pdfs/polymax.pdf")[_PolyMaX: General Dense Prediction with Mask Transformer_] \
    #text(size: 9pt)[Xuan Yang; Liangzhe Yuan; *Kimberly Wilber*; Astuti Sharma; Xiuye Gu; Siyuan Qiao; Stephanie Debats; Huisheng Wang; Hartwig Adam; Mikhail Sirotenko; Liang-Chieh Chen. _Winter Conference on Applications of Computer Vision (WACV 2024)_]
  ],

  [2023], [#link("https://kjwilber.org/static/pdfs/sanpo.pdf")[_SANPO: A Scene Understanding, Accessibility, Navigation, Pathfinding, Obstacle Avoidance Dataset_] \
    #text(size: 9pt)[Sagar M. Waghmare; *Kimberly Wilber*; Dave Hawkey; Xuan Yang; Matthew Wilson; Stephanie Debats; Cattalyya Nuengsigkapian; Astuti Sharma; Lars Pandikow; Huisheng Wang; Hartwig Adam; Mikhail Sirotenko. _ArXiv_]
  ],

  [2019], [#link("https://kjwilber.org/static/pdfs/understanding-image-quality-and-trust.pdf")[_Understanding Image Quality and Trust in Peer-to-Peer Marketplaces_] \
    #text(size: 9pt)[Xiao Ma; Lina Mezghani; *Kimberly Wilber*; Hui Hong; Robinson Piramuthu; Mor Naaman; Serge Belongie. _Winter Conference on Applications of Computer Vision (WACV 2019)_]
  ],

  [2017], [#link("https://kjwilber.org/static/pdfs/bam-dataset.pdf")[_BAM! The Behance Artistic Media Dataset for Recognition Beyond Photography_] \
    #text(size: 9pt)[*M. Wilber*; Chen Fang; Hailin Jin; Aaron Hertzmann; John Collomosse; Serge Belongie. _International Conference on Computer Vision (ICCV 2017)_]
  ],

  [2016], [#link("https://kjwilber.org/static/pdfs/resnets-ensembles.pdf")[_Residual Networks Behave Like Ensembles of Relatively Shallow Networks_] \
    #text(size: 9pt)[Andreas Veit; *M. Wilber*; Serge Belongie. _Neural information processing systems (NIPS 2016)_]
  ],

  [2016], [#link("https://kjwilber.org/static/pdfs/can-we-avoid-face-detection.pdf")[_Can we still avoid automatic face detection?_] \
    #text(size: 9pt)[*M. Wilber*; Vitaly Shmatikov; Serge Belongie. _Winter Conference on Applications of Computer Vision (WACV 2016)_]
  ],

  [2015], [#link("https://kjwilber.org/static/pdfs/concept-embeddings.pdf")[_Learning Concept Embeddings with Combined Human-Machine Expertise_] \
    #text(size: 9pt)[*M. Wilber*; Iljung Sam Kwak; Serge Belongie. _International Conference on Computer Vision (ICCV 2015)_]
  ],

  [2014], [#link("https://kjwilber.org/static/pdfs/cost-effective-hits.pdf")[_Cost-Effective HITs for Relative Similarity Comparisons_] \
    #text(size: 9pt)[*M. Wilber*; Iljung Sam Kwak; Serge Belongie. _AAAI Conference on Human Computation and Crowdsourcing (HCOMP 2014)_]
  ],

  [2014], [#link("https://kjwilber.org/static/pdfs/wjs_pr2014_metric.pdf")[_Good Recognition is Non-Metric_] \
    #text(size: 9pt)[Walter J. Scheirer; *M. Wilber*; Michael Eckmann; Terry Boult. _E. Pattern Recognition 47 (8), 2014_]
  ],

  [2013], [*Best paper award:* #link("https://kjwilber.org/static/pdfs/vision-tools-2013.pdf")[_Animal Recognition in the Mojave Desert: Vision Tools for Field Biologists_] \
    #text(size: 9pt)[*M. Wilber*; Walter J. Scheirer; Phil Leitner; et. al.. _Workshop on Applications of Computer Vision (WACV 2013)_]
  ],

  [2012], [#link("https://kjwilber.org/static/pdfs/privv.pdf")[_PRIVV: Private Remote Iris Authentication with Vaulted Verification_] \
    #text(size: 9pt)[*M. Wilber*; Walter J. Scheirer; Terry Boult. _Conference on Computer Vision and Pattern Recognition Biometrics Workshop (CVPR 2012)_]
  ],
)
