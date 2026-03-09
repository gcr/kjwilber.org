// Copyright (c) 2026 Kimberly J. Wilber.

#import "@preview/dashy-todo:0.1.3": todo

#import "/node_modules/eleventy-plugin-typst/typst/template.typ": frontmatter
#frontmatter(
  title: "Resume",
  targets: ("pdf",),
  permalink: "resume.pdf",
  eleventyNavigation: (
    key: "Resume",
    title: "Resume",
    order: 1,
  ),
)

#let LaTeX = {
  let A = (
    offset: (
      x: -0.2em,
      y: -0.3em,
    ),
    size: 0.8em,
  )
  let T = (
    x_offset: -0.12em
  )
  let E = (
    x_offset: -0.2em,
    y_offset: 0.23em,
    size: 1em
  )
  let X = (
    x_offset: -0.1em
  )
  [L#h(A.offset.x)#text(size: A.size, baseline: A.offset.y)[A]#h(T.x_offset)T#h(E.x_offset)#text(size: E.size, baseline: E.y_offset)[E]#h(X.x_offset)X]
}

#set page(
  paper: "us-letter",
  margin: (bottom: 0.2in, rest: 0.5in),
  header: context [
    #if counter(page).get().first() > 1 [
      #align(right)[
        #h(1fr)
        Kimberly J. Wilber
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
  font: "Caladea",
  hyphenate: false,
)
#set highlight(fill: rgb("#fff2e2"), extent: 4pt, radius: 2pt)
#show link: set text(fill: blue)
#set list(indent: 10pt)
// #set quote(block: true, quotes: true)
#set table(
  columns: (8em, 1fr),
  align: (right, left),
  stroke: none
)
// #set table.cell(breakable: false)
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
    //Research engineer with an academic computer vision background.
    Machine learning research infrastructure engineer.
    // #h(1fr) She / Her
  ],
  align(right)[
    kimmy\@kjwilber.org \
    #link("https://kjwilber.org") \
    #link("https://github.com/gcr")[GitHub]
    $dot$
    #link("https://www.linkedin.com/in/kwilber/")[LinkedIn]
    $dot$
    #link("https://scholar.google.com/citations?user=OAtUvx0AAAAJ&hl=en&oi=ao")[Scholar]
  ]
)


#grid(
  columns: (2.1fr, 1.0fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  [
== Core expertise
/ ML research infrastructure: Data pipelines, evaluation tooling, experiment frameworks, training and inference infrastructure, loss functions and gradient descent optimization, model debugging / interpretability tools
/ LLMs: Mechanistic interpretability, embedding systems, approximate nearest neighbor search, linear probes
/ On-device ML: quantization, latency optimization, memory optimization, model distillation
/ Datasets: Large-scale dataset curation and processing
/ Research process: Crowdsourcing and human-in-the-loop ML pipelines, experiments, academic paper writing
  // I write and manage end-to-end research infrastructure from fledgling experiments to Google-scale teamwide collaborations.  My projects include writing hooks for LLM mechanistic interpretability, drafting HTML UI for crowdsourcing, training quantized on-device depth prediction CNNs for 3D scene understanding, deploying linear probes at inference-scale, and more.  I do everything from idea to paper deadline to product launch.
== Open-source contributions
  - Contributor to various projects including Racket and Node.js.
  - #link("https://github.com/gcr")[GitHub profile]: 196 followers.
  - Repositories I created have 200 forks and 700 stars.
  ], [
== Technical stack
/ Fluent languages: Python, C, HTML/CSS/JS, POSIX and CLI tools, #LaTeX
// / Have played with: C++, various Lisps, Java, nim, Cython, SQL, ...
/ ML frameworks: PyTorch, HuggingFace Transformers, sklearn, inference tooling like llama-cpp, ollama, vLLM
/ Data: Parquet, DuckDB/LanceDB, Postgres, SQLite, Pandas, NumPy
/ Web: Flask, FastAPI, Node.js, Vue, React
/ Sysadmin: Debian/Ubuntu server clusters, Ansible, Docker, AWS EC2, GCP, and self-hosted infrastructure

  // I love projects that require skilled craftsmanship across the stack, from tight inner loops to high-level UX.
  // I'm proficient in UNIX/C, the numerical Python stack (PyTorch, sklearn, matplotlib, numpy/scipy, HuggingFace Transformers), OLAP (DuckDB/LanceDB, Parquet), web backend (Flask, FastAPI, Node.js), frontend (HTML/Javascript/CSS, Vue, React), and DB (SQLite, Postgres).
  // I have over 20 years of experience administering Debian/Ubuntu server clusters across various hosting environments (AWS EC2, GCP, and on-prem) using tools like Ansible and Docker.
  ],
  // grid.cell(colspan: 2)[
  // ]
  )

== Professional Experience

#let experience = (
  (
    start: [2024],
    end: [Present],
    company: [Krnel.ai],
    title: [Technical co-founder],
    location: [New York, NY],
    description: [
      - Built mechanistic-interpretability tooling for LLM safety enforcement. PoC deployments with 2 hedge funds, 1 hardware vendor, and 1 systems integrator
      - Built "Krnel MI Guardrails," a content moderation safety filter achieving $25 times$ fewer false alarms than LlamaGuard and $33%$ lower latency. See #link("https://github.com/krnel-ai/krnel-graph-guardrails")[code], #link("https://krnel.ai/blog/2025-06-09-guardrail-comparison/")[blog post]
      - Designed and implemented #link("https://github.com/krnel-ai/krnel-graph#readme")[`Krnel-graph`], a content-addressable computation graph for mechanistic-interpretability workflows.
        - Krnel-graph is widely used within all of the company's research projects
      - Led the open-source process for Krnel-graph, including drafting documentation and shepherding research contributions $arrow$ 22 stars, $approx$200 monthly downloads
      // - As a technical co-founder, I stand up our research infrastructure from scratch to support our first products. I also do everything in between: pitches, lead generation, and demoing to potential clients.
    ],
  ), (
    start: [2018],
    end: [2024],
    company: [Google AI],
    title: [Software Engineer],
    location: [New York, NY],
    description: [
      - Technical lead for on-device outdoor monocular depth estimation and segmentation models used by #link("https://research.google/blog/open-sourcing-project-guideline-a-platform-for-computer-vision-accessibility-technology/")[Project Guideline] and #link("https://developers.google.com/ar")[ARCore]. This work launched in ARCore 1.36 and enabled geospatial API and the MediaPipe on-device depth plugin, both demonstrated at Google I/O 2023.
        - Improved segmentation accuracy *0.9296 $arrow$ 0.9400 mIOU* while reducing latency *28.7ms $arrow$ 23ms* on mobile hardware.
        // - Served as team liason between ARCore, Project Guideline, and MediaPipe teams.
        - Feedback from L5 research scientist: _"As a direct result of Kimberly's work, the MediaPipe team was able to use monocular depth as an 'on-device plugin' for their flagship image generation task ... #highlight[First real-time on-device monocular depth solution open sourced] via MediaPipe"_
        - Feedback from L6 research scientist, partner team: _"Invaluable contributions in up-leveling monocular depth #highlight[across multiple product surfaces at Google] ... with greatly improved generalization to outdoor scenes as well as latency and memory savings!"_
    - Co-led development of _Debug Server v2_, an embedding-model inspection platform adopted by 4+ Google teams (Play Ads, RankEmbed, Intent Mining, LocalEmbed) for debugging large-scale retrieval systems.
      - This work consolidated debug infrastructure, reducing resource usage by *$approx$15 TB RAM* and simplifying deployment to a one-command setup
      - Feedback from L6 peer: _"Kimberly's deep expertise in developing embedding models has positioned her as a #highlight[trusted authority and go-to expert], even beyond her own team"_
    - Sole maintainer of _VisionKit Model Zoo and Studio_, supporting *120+ internal ML models* and enabling deployment of new model versions across Google Research teams
    - Co-led creation of #link("https://research.google/blog/sanpo-a-scene-understanding-accessibility-navigation-pathfinding-obstacle-avoidance-dataset/")[SANPO], a large-scale egocentric scene understanding dataset used for depth estimation research, accessibility products, and ARCore models.
      - Our dataset has 10 citations in research papers, $approx$50 monthly downloads, used by 3+ teams across Google for research and product development
    - Co-designed *Cross-Example Softmax,* a novel retrieval loss improving AUC-PR from *$0.14 arrow 0.20$* on Conceptual Captions
      - Built all ML experimentation infrastructure (data pipelines, training tools, hyperparameter search), *improving research throughput $5-10 times$* and reducing iteration cycles from days to hours.
    ],
  ), (
    start: [2013],
    end: [Present],
    company: [Computer vision foundation],
    title: [Volunteer publication assistant],
    location: [Remote],
    description: [
      - The #link("https://openaccess.thecvf.com/menu")[CVF Open Access Archive] serves most CVPR, ICCV, and WACV papers to the computer vision community since 2013.
      - I own the PDF processing pipeline used to build CVPR/ICCV/WACV conference proceedings.
      - Our stack (Python, Ghostscript, qPDF) adds page numbers, an attribution banner, and proper PDF metadata with automatic checks for common quality problems (figures overlapping margins, etc).
      - We're now able to process 2,700+ papers with a 3-day turnaround time and less than 5 manual corrections per conference thanks to the automation pipeline I built.
    ],
  ), (
    start: [2014],
    end: [2018],
    company: [Cornell Tech],
    title: [Research Assistant],
    location: [New York, NY],
    description: [
    - Conducted computer vision research on perceptual similarity, crowdsourcing, and object recognition.
    - Helped establish and maintain the new vision group's presence at Cornell.
    - Served as TA for classes including four semesters of "CS5785 Modern Analytics."
    ]
  ), (
    start: [2017],
    company: [Google Photos Team],
    title: [Summer Intern],
    location: [Mountain View, CA],
    description: [
      - Implemented and tested tools to make it easier for ML engineers to prototype UI interactions.
      - These tools helped shape the feature roadmap for #link("https://support.google.com/photos/answer/7378859?hl=en&co=GENIE.Platform%3DDesktop")[Google Photos Sharing Suggestions].
    ]
  ), (
    start: [2016],
    company: [Adobe Research],
    title: [Summer Intern],
    location: [San Jose, CA],
    description: [
      - Curated #link("https://arxiv.org/abs/1704.08614")[BAM], one of the first large-scale collections of professional commercial artwork, intended for ML object classification and emotion understanding.
      - Built a data loader system in Python and Redis to quickly analyze millions of images for ML training and inference workloads, speeding up training by 5$times$.
    ]
  ), (
    start: [2014],
    company: [Dropbox Photos Team],
    title: [Summer Intern],
    location: [San Francisco, CA],
    description: [
      - Conducted product-focused computer vision research.
      - Introduced our team to more efficient tools and technologies.
      - Maintained a computer vision evaluation and experimentation pipeline for crowdsourced data collection of face images.
    ],
  ), (
    start: [2013],
    company: [University of California, San Diego],
    title: [Research Assistant],
    location: [San Diego, CA],
  ), (
    start: [2012],
    end: [2013],
    company: [Securics, Inc.],
    title: [Software Engineer],
    location: [Colorado Springs, CO],
  ), (
    start: [2009],
    end: [2013],
    company: [Vision and Security Technology (VAST) Laboratory at UCCS],
    title: [Assistant Researcher],
    location: [Colorado Springs, CO],
  ), (
    start: [2011],
    company: [NSF REU Program, University of Colorado Colorado Springs],
    title: [Summer Researcher],
    location: [Colorado Springs, CO],
  ), (
    start: [2009],
    end: [2010],
    company: [Securics, Inc.],
    title: [NSF RAHSS High School Intern],
    location: [Colorado Springs, CO],
  )
)

#let tablecells = for exp in experience {(
  if "end" in exp [
    #exp.start -- #exp.end
  ] else [
    #exp.start
  ],
  [*#exp.title, #exp.company, #exp.location* \
    #if "description" in exp [
      #exp.description
    ]
  ]
)}

#for exp in experience [
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      gutter: 4pt,
      [
        *#exp.title, #exp.company, #exp.location*
      ],
      [
        #if "end" in exp [
          #exp.start -- #exp.end
        ] else [
          #exp.start
        ]
      ],
    )
    #if "description" in exp [
    #v(0.5em, weak: true)
      #exp.description
    ]
]

// #table(..tablecells)
// table() default already asked for two columns
// (see above set table call)

#pagebreak()
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
    WACV (Winter Conference on Applications of Computer Vision) 2012, 2013, 2014
  ],

  [2013 -- 2016], [*National Science Foundation GRFP Awardee*, UCSD/Cornell],

  [2010 -- 2013], [*Dean's List*, UCCS],

  [2010 -- 2013], [*Kane Family Foundation Scholarship Recipient*, Full tuition and books, UCCS],

  [2010 -- 2013], [*Braxton Scholarship Recipient*, UCCS],
)

== Selected Publications
_Note that some work before 2018 is published under a previous name. See #link("https://kjwilber.org/publications")[here] for the unabridged list._
#let papers = yaml("/src/_data/papers.yaml")
#table(
  ..papers.paperList.filter(p => "spotlight" in p).map(p => {
    let authors = p.authors.map(a => {
      if a == "Kimberly Wilber" or a == "M. Wilber" {
        [*#a*]
      } else {
        [#a]
      }
    }).join([; ])

    let title-content = if "pdf" in p {
      link("https://kjwilber.org/static/pdfs/" + p.pdf)[_#p.title _]
    } else {
      [_#p.title _]
    }

    let prefix = if "best_paper" in p and p.best_paper == true {
      [*Best paper award:* ]
    }

    (
      [#str(p.year)],
      [#prefix#title-content \
        #text(size: 9pt)[#authors. _#p.venue _]
      ],
    )
  }).flatten()
)
