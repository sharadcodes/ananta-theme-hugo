# Research Portal Hugo theme

Minimal, research-oriented Hugo theme with [Alegreya](https://fonts.google.com/specimen/Alegreya) and [Bootstrap Icons](https://icons.getbootstrap.com/). Suited to academics and engineers who want a small, readable portfolio.

## Features

- Posts, papers, projects, experience, and a full **About** page
- Homepage built from partials; **section order** and **nav order** configurable in `config.toml`
- **Tags** with list/term pages and kind filters (post / paper / project) where relevant
- **Breadcrumbs** on inner pages (Home → section → page)
- Optional **profile image** in the header (URL or static path); fit modes `fill`, `contain`, `cover`
- **Footer social links**: Twitter/X, LinkedIn, **Google Scholar**, GitHub, email
- **Responsive layout**: mobile header with centered block, larger tap targets, homepage shows **photo above title** on narrow viewports

## Installation

1. Copy or clone the theme into `themes/research-portal` (or add as a submodule).

2. In `config.toml`:

```toml
baseURL = "https://example.com/"
languageCode = "en-us"
title = "Your Name"
theme = "research-portal"
summaryLength = 30

[params]
  tagline = "Your tagline"

  # Optional header image: HTTPS URL or path under /static, e.g. "images/profile.jpg"
  profileImage = ""
  profileImageAlt = "Your Name profile photo"
  profileImageFit = "contain"   # fill | contain | cover

  showPosts = true
  showPapers = true
  showProjects = true
  showExperience = true
  experienceLimit = 2           # Recent jobs on homepage; 0 hides the block

  # Homepage sections, top to bottom. Keys: about, experience, posts, papers, projects
  # Omit a key to hide that block on the home page.
  homeSectionOrder = ["about", "experience", "posts", "papers", "projects"]

  # Header links, left to right. Keys: posts, papers, projects, about (no home — site title links to /)
  # Omit a key to remove that link. about is hidden on the homepage.
  navOrder = ["posts", "papers", "projects", "about"]

  twitter = "handle"            # optional
  linkedin = "handle"           # optional — linkedin.com/in/{handle}
  googleScholar = ""            # optional — Scholar user ID or full profile URL
  github = "handle"             # optional
  email = "you@example.com"     # optional

[markup.goldmark.renderer]
  unsafe = true                 # allow raw HTML in markdown if you need it
```

### Google Scholar

Set `googleScholar` to either:

- The **`user=`** value from your profile URL  
  `https://scholar.google.com/citations?user=**AbCdEfGh**` → use `AbCdEfGh`, or  
- The **full profile URL** if it starts with `http://` or `https://` (any regional domain).

Leave empty to hide the footer link.

### Extra `<head>` content

Override or extend by replacing the theme file, or in your site add  
`layouts/partials/head-custom.html` — it is rendered at the end of `<head>` in `baseof.html`.

## Content structure

### Homepage (`content/_index.md`)

Markdown body is used as the short “About” preview on the home page (with a link to `/about/`). Front matter is optional.

### About (`content/about/_index.md`)

Full bio at `/about/`. Example:

```markdown
---
title: "About"
---

Your long-form bio…
```

### Posts (`content/posts/`)

```markdown
---
title: "Post Title"
date: 2026-03-15
author: "Your Name"
tags: ["tag1", "tag2"]
---

Content…
```

Fenced code blocks with a language tag (for example `python`, `bash`, `text`) are highlighted by Hugo’s Chroma highlighter. This site uses **line numbers** (`lineNos = true`, `lineNumbersInTable = true`) and class-based colors (`noClasses = false`) with `static/css/chroma-github.css` (regenerate with `hugo gen chromastyles --style=github` if you change `style`). Tweak behavior in `config.toml` under `[markup.highlight]`.

Per-fence options (e.g. **line highlights**) need Goldmark block attributes: `[markup.goldmark.parser.attribute]` with `block = true` (see `config.toml`). Example: ` ```python {hl_lines=[2,"4-5"]} `. A full demo lives in `content/posts/blog-authoring-showcase.md`.

**Math (KaTeX):** Goldmark **passthrough** is enabled in `config.toml` for `\(...\)`, `\[...\]`, and `$$...$$`. Set `params.math: true` in a page’s front matter to load KaTeX (or set `math = true` under `[params]` to load on every page). See [Mathematics in Markdown](https://gohugo.io/content-management/mathematics/) in the Hugo docs.

**Images:** Put files under `static/` (e.g. `static/images/diagram.png`). Reference them with a root path: `![alt text](/images/diagram.png)`.

**`fig` shortcode** (theme): captioned figures with lazy-loading and optional link.

Hugo processes **shortcodes before Markdown**, so `{{< … >}}` inside a normal fenced code block is still **executed**. To show shortcode source in a post, use raw HTML `<pre><code>` and write the opening `&lt;` instead of `<`, or put samples in a file and `readFile` them from a tiny shortcode (see `blog-authoring-showcase.md`).

```markdown
{{< fig src="/images/diagram.png" alt="Description" caption="Caption supports **markdown**." >}}

{{< fig "/images/diagram.png" "Alt text" "Caption (positional args)." >}}

{{< fig src="/images/a.png" alt="..." caption="..." href="https://example.com/full.png" >}}
```

Hugo’s built-in [`figure`](https://gohugo.io/content-management/shortcodes/#figure) still works if you prefer it. [Page bundles](https://gohugo.io/content-management/page-bundles/) are supported for co-located assets.

### Papers (`content/papers/`)

**External links** (home, list, tag pages, paper page): With **`doi`**, a **DOI** link is shown (use `10.xxx/...` or a full `https://doi.org/...` string). Without a DOI, set **`paperUrl`** and optional **`paperUrlLabel`**, or **`paperLinks`** as a list of `{ name, url }`.

```markdown
---
title: "Paper Title"
date: 2026-03-01
authors: ["Author 1", "Author 2"]
doi: "10.1234/example"
abstract: "…"
tags: ["ml"]
references:
  - "Reference 1"
---

Content…
```

No DOI — one link:

```yaml
paperUrl: "https://arxiv.org/abs/1234.5678"
paperUrlLabel: "arXiv"
```

No DOI — several links:

```yaml
paperLinks:
  - name: "PDF"
    url: "https://example.com/paper.pdf"
  - name: "Publisher"
    url: "https://journal.example/article"
```

### Projects (`content/projects/`)

Optional **`startDate`** and **`endDate`** (ISO dates, e.g. `2024-06-15`) drive the timeline line on the project page, list, and home preview. If **`status`** is omitted, it is inferred: **Planned** (start in the future), **Active** (no end date, or end date today or later), **Completed** (end date in the past). Set **`status`** explicitly to override. Legacy **`year`** (string) is still shown when start/end are not set.

```markdown
---
title: "Project Title"
date: 2026-03-01
startDate: 2025-01-10
endDate: 2026-02-28
# status: "Active"   # optional override
technologies: ["Go", "Hugo"]
tags: ["dev"]
repo: "https://github.com/…"
live: "https://…"
docs: "https://…"
---

Content…
```

### Experience (`content/experience/`)

```markdown
---
title: "Role"
company: "Org"
period: "2024 – Present"
date: 2024-01-01
weight: 1
---

Description…
```

## Navigation and URLs

- **Home** and **About** appear in the header on inner pages only.
- Internal links use relative permalinks suitable for any `baseURL`.

Generated sections (default paths):

| Path | Content |
|------|---------|
| `/posts/` | Post list |
| `/papers/` | Paper list |
| `/projects/` | Project list |
| `/experience/` | Experience list |
| `/about/` | About page |
| `/tags/` | All tags |
| `/tags/<name>/` | Items with that tag |

## Customization

- **Colors, spacing, mobile rules**: `themes/research-portal/static/css/style.css`
- **Font**: `layouts/_default/baseof.html` (Google Fonts link)
- **Icons**: [Bootstrap Icons](https://icons.getbootstrap.com/) — theme uses names like `bi-house`, `bi-mortarboard` (Scholar), etc.

## Theme layout reference

| Area | Location |
|------|----------|
| Shell | `layouts/_default/baseof.html` |
| Home | `layouts/_default/home.html` + `layouts/partials/home-section-*.html` |
| Lists / singles | `layouts/_default/list.html`, `single.html`, kind-specific under `posts/`, `papers/`, `projects/` |
| About | `layouts/about/list.html` |
| Experience | `layouts/experience/list.html` |
| Tags | `layouts/taxonomy/list.html`, `terms.html` |
| Header / footer / breadcrumb | `layouts/partials/*.html` |

## License

MIT — use freely.

## Credits

- [Alegreya](https://fonts.google.com/specimen/Alegreya)
- [Bootstrap Icons](https://icons.getbootstrap.com/)
- [Hugo](https://gohugo.io/)
