// const nodePandoc_ = require("node-pandoc");
const util = require("util");
const fs = require("fs");
//const nodePandoc = util.promisify(nodePandoc_)
const { DateTime } = require("luxon");
const pluginSEO = require("eleventy-plugin-seo");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const yaml = require("js-yaml");
const process = require("process");
const eleventyNavigation = require("@11ty/eleventy-navigation");
const eleventyPluginTypst = require("eleventy-plugin-typst");
const { eleventyImageTransformPlugin } = require("@11ty/eleventy-img");
const path = require("path");

process.env.NODE_ENV = process.env.NODE_ENV || "development"; // fix typst build issue

// nodePandoc = util.promisify(nodePandoc_);

const metadata = {
  title: "Kimmy's Site",
  description:
    "Personal webpage of Kimberly Wilber",
  language: "en",
  url: "https://kjwilber.org",
  image:
    "https://kjwilber.org/static/kimmy-profile.jpg",
  author: "Kimberly Wilber",
  authorEmail: "kimmy@kjwilber.org",
};

module.exports = function (eleventyConfig) {
  eleventyConfig.addPreprocessor("drafts", "*", (data, content) => {
    if (data.draft && process.env.ELEVENTY_RUN_MODE !== "serve") {
      return false;
    }
  });

  eleventyConfig.addPassthroughCopy("static");

  eleventyConfig.addDataExtension("yaml", (contents) => yaml.load(contents));


  /*
  eleventyConfig.addTemplateFormats("org");
  eleventyConfig.addExtension("org", {
    compile: async (inputContent, inputPath) => {
      const output = await nodePandoc(inputContent, "-f org -t html");
      return async () => {
        return output;
      };
    },
    getData: true,
    getInstanceFromInputPath: async (inputPath) => {
      let data = {};
      fs.readFileSync(inputPath, "utf-8")
        .split(/\r?\n/)
        .forEach((line) => {
          let match = /^#\+(.*): (.*)/.exec(line);
          if (match) {
            let key = match[1].toLowerCase(),
              val = match[2].trim();
            if (key == "date") {
              data["date"] = val.split(" ")[0].replace(/<|>/g, "");
            } else {
              data[key] = val;
            }
          }
        });
      return { data: data };
    },
  });
  */

  eleventyConfig.addTemplateFormats("typ");
  eleventyConfig.addPlugin(eleventyPluginTypst.default, {
    targets: ["pdf"], // Output formats
    fontPaths: ["fonts"], // Paths to custom fonts
  });

  eleventyConfig.addPlugin(pluginSEO, metadata);

  eleventyConfig.addPlugin(eleventyNavigation);

  // RSS support
  eleventyConfig.addPlugin(pluginRss);
  eleventyConfig.addGlobalData("metadata", metadata);
  eleventyConfig.addGlobalData("isServing", process.env.ELEVENTY_RUN_MODE === "serve");

  eleventyConfig.addPlugin(eleventyImageTransformPlugin, {
    formats: ["webp", "jpeg"],
    widths: [600], // Pick your own srcset widths
    defaultAttributes: {
      loading: "lazy",
      decoding: "async",
    },
  });

  // Rewrite relative image srcs to source file paths so they resolve on listing pages
  eleventyConfig.addFilter("absoluteImagePaths", function(content, inputPath) {
    const dir = path.dirname(inputPath);
    return content.replace(/src="(?:\.\/)?(?!\/|https?:\/\/)([^"]+)"/g, (match, filename) => {
      return `src="./${path.join(dir, filename)}"`;
    });
  });

  eleventyConfig.addFilter("otherTags", (collections, categories) => {
    return Object.keys(collections).filter(tag =>
      tag !== "posts" && tag !== "all" && !(tag in categories)
    );
  });

  eleventyConfig.addFilter("date", (dateObj, format) => {
    if (dateObj === "now") dateObj = new Date();
    return DateTime.fromJSDate(dateObj, { zone: "utc" }).toFormat(format);
  });

  eleventyConfig.addFilter("urlMatches", (navEntry, currentPage) => {
    // Handle trailing slashes by normalizing both URLs
    if (navEntry.url == '/') return currentPage.url == '/'; // Special case for homepage
    return currentPage.url.startsWith(navEntry.url);
  });

  eleventyConfig.addCollection("posts", function (collection) {
    const coll = collection
      .getFilteredByTag("posts")
      .sort((a, b) => b.data.date - a.data.date);

    // From: https://github.com/11ty/eleventy/issues/529#issuecomment-568257426
    // Adds {{ prevPost.url }} {{ prevPost.data.title }}, etc, to our njks templates
    for (let i = 0; i < coll.length; i++) {
      const prevPost = coll[i - 1];
      const nextPost = coll[i + 1];

      coll[i].data["prevPost"] = prevPost;
      coll[i].data["nextPost"] = nextPost;
    }

    return coll;
  });

  return {
    markdownTemplateEngine: "njk",
    dir: {
      // input: "src",
      //"layouts": "layouts"
    },
  };
};
