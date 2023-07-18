const nodePandoc_ = require("node-pandoc");
const util = require("util");
const fs = require("fs");
//const nodePandoc = util.promisify(nodePandoc_)
const { DateTime } = require("luxon");
const pluginSEO = require("eleventy-plugin-seo");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const yaml = require("js-yaml");
const luatex = require("netlify-lualatex").default;
const os = require("os");
const process = require("process");
const nunjucks = require("nunjucks");

const isDevServer = /serve/.test(process.argv.join(" "));

nodePandoc = util.promisify(nodePandoc_);

const metadata = {
  "glitch-help-instructions":
    "For a custom domain, change the 'url' parameter from 'glitch-default' to your domain _without_ a traling slash, like 'https://www.example.com'",
  title: "Hello Eleventy!",
  description:
    "A simple Eleventy blog, built with Glitch. Remix it to get your own.",
  language: "en",
  url: "https://kjwilber.org",
  image:
    "https://cdn.glitch.com/605e2a51-d45f-4d87-a285-9410ad350515%2Fhello-eleventy-social.png?v=1616712747908",
  author: {
    name: "Kimberly Wilber",
    email: "kimmy@kjwilber.org",
  },
};

module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("static");

  eleventyConfig.addDataExtension("yaml", (contents) => yaml.load(contents));

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

  /* Tex support! */
  eleventyConfig.addTemplateFormats("tex");
  eleventyConfig.addExtension("tex", {
    outputFileExtension: "pdf",
    compile: async function (inputContent, inputPath) {
      return async function (data) {
        if (isDevServer) return;
        let path = fs.mkdtempSync(os.tmpdir() + "/") + "output.pdf";
        let e = new nunjucks.Environment(null, {
          tags: {
            blockStart: "<%",
            blockEnd: "%>",
            variableStart: "<$",
            variableEnd: "$>",
            commentStart: "<#",
            commentEnd: "#>",
          },
        });
        templatedContent = e.renderString(inputContent, data);
        await luatex(path, templatedContent);
        return fs.readFileSync(path);
      };
    },
  });

  /* From: https://github.com/artstorm/eleventy-plugin-seo
  
  Adds SEO settings to the top of all pages
  The "glitch-default" bit allows someone to set the url in seo.json while
  still letting it have a proper glitch.me address via PROJECT_DOMAIN
  */

  eleventyConfig.addPlugin(pluginSEO, metadata);

  // RSS support
  eleventyConfig.addPlugin(pluginRss);
  eleventyConfig.addGlobalData("metadata", metadata);

  // Filters let you modify the content https://www.11ty.dev/docs/filters/
  eleventyConfig.addFilter("htmlDateString", (dateObj) => {
    return DateTime.fromJSDate(dateObj, { zone: "utc" }).toFormat("yyyy-LL-dd");
  });

  /* Build the collection of posts to list in the site
     - Read the Next Steps post to learn how to extend this
  */
  eleventyConfig.addCollection("posts", function (collection) {
    /* The posts collection includes all posts that list 'posts' in the front matter 'tags'
       - https://www.11ty.dev/docs/collections/
    */

    // EDIT HERE WITH THE CODE FROM THE NEXT STEPS PAGE TO REVERSE CHRONOLOGICAL ORDER
    // (inspired by https://github.com/11ty/eleventy/issues/898#issuecomment-581738415)
    const coll = collection.getFilteredByTag("posts");

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
    dir: {
      input: "src",
      //"layouts": "layouts"
    },
  };
};
