# Ananta Theme Hugo

Minimal, research-oriented Hugo theme with [Alegreya](https://fonts.google.com/specimen/Alegreya) and [Bootstrap Icons](https://icons.getbootstrap.com/). Suited to academics and engineers who want a small, readable portfolio.

[License: MIT](https://opensource.org/licenses/MIT) | [Hugo](https://gohugo.io)

## About the name *Ananta* (Hindi / Sanskrit)

In **Hindi** and **Sanskrit**, the word is usually written **अनन्त** and read ***anant*** (sometimes spelled *ananta* in Roman type). It is built from a negating prefix and *ant* ("end" / "limit"), so it literally means **"without end."** Common glosses you will see in dictionaries are **infinite**, **endless**, **boundless**, or **eternal**. This theme uses the name to suggest a site that can keep growing—posts, papers, and projects without a fixed "stopping point."

## Features

- Posts, papers, projects, experience, and a full **About** page
- Homepage built from partials; **section order** and **nav order** configurable in `config.toml`
- **Tags** with list/term pages and kind filters (post / paper / project) where relevant
- **Breadcrumbs** on inner pages (Home → section → page)
- Optional **profile image** in the header (URL or static path); fit modes `fill`, `contain`, `cover`
- **Footer social links**: Twitter/X, LinkedIn, **Google Scholar**, GitHub, email
- **Responsive layout**: mobile header with centered block, larger tap targets, homepage shows **photo above title** on narrow viewports
- **Math support**: KaTeX for LaTeX equations
- **Code highlighting**: Chroma with line numbers and language-specific styling
- **Lazy-loaded images** and optimized performance

## Quick Start

### Try the demo locally

This repository **is** the theme: `layouts/`, `static/`, `theme.toml`, and `hugo.toml` live at the repo root. A full demo site lives under `[exampleSite/](exampleSite/)`.

**Prerequisites:** [Hugo 0.145.0+](https://gohugo.io/installation/) (extended)

**Setup:**

1. Clone or download this repository
2. Link the theme to the example site:
  - **Windows (PowerShell):** `./scripts/prepare-example-site.ps1`
  - **macOS / Linux:** `bash ./scripts/prepare-example-site.sh`
3. Start the dev server:
  ```bash
   cd exampleSite && hugo server
  ```
4. Open [http://localhost:1313/](http://localhost:1313/)

### Use in your own site

See [Installation](#installation) below.

## Installation

### Option 1: Git submodule (recommended)

```bash
git submodule add https://github.com/sharadcodes/ananta-theme-hugo.git themes/ananta-theme-hugo
```

### Option 2: Clone directly

```bash
git clone https://github.com/sharadcodes/ananta-theme-hugo.git themes/ananta-theme-hugo
```

### Option 3: Hugo modules

In your site's `config.toml`:

```toml
[module]
  [[module.imports]]
    path = "github.com/sharadcodes/ananta-theme-hugo"
```

Then run:

```bash
hugo mod get -u
```

### Configure your site

1. Set the theme in `config.toml`:

```toml
baseURL = "https://example.com/"
languageCode = "en-us"
title = "Your Name"
theme = "ananta-theme-hugo"
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

1. Create your content in `content/` (see [Content Structure](#content-structure) below)

## Configuration

### Google Scholar

Set `googleScholar` to either:

- The `**user=**` value from your profile URL  
`https://scholar.google.com/citations?user=**AbCdEfGh**` → use `AbCdEfGh`, or  
- The **full profile URL** if it starts with `http://` or `https://` (any regional domain).

Leave empty to hide the footer link.

### Extra `<head>` content

Override or extend by replacing the theme file, or in your site add  
`layouts/partials/head-custom.html` — it is rendered at the end of `<head>` in `baseof.html`.

## Content Structure

### Homepage (`content/_index.md`)

Markdown body is used as the short "About" preview on the home page (with a link to `/about/`). Front matter is optional.

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

#### Code highlighting

Fenced code blocks with a language tag (e.g., `python`, `bash`, `text`) are highlighted by Hugo's Chroma highlighter. This theme uses:

- **Line numbers** enabled (`lineNos = true`, `lineNumbersInTable = true`)
- **Class-based colors** (`noClasses = false`) with `static/css/chroma-github.css`
- Regenerate styles: `hugo gen chromastyles --style=github > static/css/chroma-github.css`
- Configure in `config.toml` under `[markup.highlight]`

#### Line highlights

Per-fence options (e.g., line highlights) require Goldmark block attributes. Enable in `config.toml`:

```toml
[markup.goldmark.parser.attribute]
  block = true
```

Example with highlighted lines:

```markdown
```python {hl_lines=[2,"4-5"]}
def hello():
    print("line 2 highlighted")
    print("line 3")
    print("line 4 highlighted")
    print("line 5 highlighted")
```
```

See `content/posts/blog-authoring-showcase.md` for a full demo.

#### Math (KaTeX)

Goldmark **passthrough** is enabled in `config.toml` for:

- Inline: `\(...\)`
- Display: `\[...\]` or `$$...$$`

To load KaTeX on a page, set in front matter:

```yaml
params:
  math: true
```

Or enable globally in `config.toml`:

```toml
[params]
  math = true
```

See [Mathematics in Markdown](https://gohugo.io/content-management/mathematics/) in Hugo docs.

#### Images

1. Place image files in `static/` (e.g., `static/images/diagram.png`)
2. Reference with root path: `![alt text](/images/diagram.png)`
3. Supports [page bundles](https://gohugo.io/content-management/page-bundles/) for co-located assets

#### Figures with captions

Use the `fig` shortcode for captioned figures with lazy-loading and optional links:

```markdown
{{< fig src="/images/diagram.png" alt="Description" caption="Caption supports **markdown**." >}}

{{< fig "/images/diagram.png" "Alt text" "Caption (positional args)." >}}

{{< fig src="/images/a.png" alt="..." caption="..." href="https://example.com/full.png" >}}
```

Hugo's built-in `[figure` shortcode](https://gohugo.io/content-management/shortcodes/#figure) also works if you prefer it.

**Note:** Hugo processes shortcodes before Markdown, so `{{< … >}}` inside fenced code blocks is still executed. To show shortcode source, use raw HTML `<pre><code>` with `<` instead of `<`, or reference samples from a file.

### Papers (`content/papers/`)

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

#### External links

The theme displays external links on paper pages, lists, and tag pages. Choose one:

**With DOI:**

```yaml
doi: "10.1234/example"
# or full URL:
doi: "https://doi.org/10.1234/example"
```

**Without DOI — single link:**

```yaml
paperUrl: "https://arxiv.org/abs/1234.5678"
paperUrlLabel: "arXiv"
```

**Without DOI — multiple links:**

```yaml
paperLinks:
  - name: "PDF"
    url: "https://example.com/paper.pdf"
  - name: "Publisher"
    url: "https://journal.example/article"
```

### Projects (`content/projects/`)

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

#### Timeline and status

- `**startDate**` and `**endDate**`: ISO dates (e.g., `2024-06-15`) — drives timeline visualization
- `**status**`: Optional override. Auto-inferred if omitted:
  - **Planned**: start date in the future
  - **Active**: no end date, or end date today or later
  - **Completed**: end date in the past
- `**year`**: Legacy string field (still shown if start/end dates not set)

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

#### Front matter fields

- `**title**`: Job title or role name
- `**company**`: Organization name
- `**period**`: Display string (e.g., "2024 – Present")
- `**date**`: ISO date for sorting (earliest first)
- `**weight**`: Sort order (lower numbers appear first)

## Navigation and URLs

### Header and footer

- **Home** and **About** appear in the header on inner pages only
- Internal links use relative permalinks suitable for any `baseURL`

### Generated sections

Default paths for content types:


| Path            | Content             |
| --------------- | ------------------- |
| `/posts/`       | Post list           |
| `/papers/`      | Paper list          |
| `/projects/`    | Project list        |
| `/experience/`  | Experience list     |
| `/about/`       | About page          |
| `/tags/`        | All tags            |
| `/tags/<name>/` | Items with that tag |


## Customization

### Styling

**Colors, spacing, mobile rules:**

- File: `static/css/style.css`
- Edit CSS variables at the top of the file
- Rebuild with `hugo` to see changes

### Typography

**Font selection:**

- File: `layouts/_default/baseof.html`
- Change Google Fonts import link
- Adjust font-family in `static/css/style.css`

### Icons

**Icon library:** [Bootstrap Icons](https://icons.getbootstrap.com/)

Theme uses icon names like:

- `bi-house` — home
- `bi-mortarboard` — education/scholar
- `bi-github` — GitHub
- `bi-linkedin` — LinkedIn
- `bi-twitter-x` — Twitter/X

Browse all available icons at [icons.getbootstrap.com](https://icons.getbootstrap.com/)

## Theme Layout Reference

### Template files


| Area              | Location                                                              |
| ----------------- | --------------------------------------------------------------------- |
| Shell (base HTML) | `layouts/_default/baseof.html`                                        |
| Home page         | `layouts/_default/home.html` + `layouts/partials/home-section-*.html` |
| List pages        | `layouts/_default/list.html`                                          |
| Single pages      | `layouts/_default/single.html`                                        |
| Posts             | `layouts/posts/single.html`                                           |
| Papers            | `layouts/papers/single.html`                                          |
| Projects          | `layouts/projects/single.html`                                        |
| About             | `layouts/about/list.html`                                             |
| Experience        | `layouts/experience/list.html`                                        |
| Tags              | `layouts/taxonomy/list.html`, `terms.html`                            |
| Header            | `layouts/partials/header.html`                                        |
| Footer            | `layouts/partials/footer.html`                                        |
| Breadcrumb        | `layouts/partials/breadcrumb.html`                                    |


### Partial templates

Home page sections:

- `layouts/partials/home-section-about.html`
- `layouts/partials/home-section-experience.html`
- `layouts/partials/home-section-posts.html`
- `layouts/partials/home-section-papers.html`
- `layouts/partials/home-section-projects.html`

Utilities:

- `layouts/partials/math.html` — KaTeX loader
- `layouts/partials/head-custom.html` — Custom head content (override in your site)

## Browser Support

- ✓ Modern browsers (Chrome, Firefox, Safari, Edge)
- ✓ Mobile-first responsive design
- ✓ No JavaScript dependencies
- ✓ Works without JavaScript enabled

## Performance

- ✓ Static HTML output (no runtime overhead)
- ✓ Minimal CSS (~8 KB minified)
- ✓ Optimized for fast page loads
- ✓ Lazy-loaded images
- ✓ No external dependencies or CDN calls (except Google Fonts)

## Contributing

Found a bug or have a feature request?

- **Report issues:** [GitHub Issues](https://github.com/sharadcodes/ananta-theme-hugo/issues)
- **Submit changes:** [GitHub Pull Requests](https://github.com/sharadcodes/ananta-theme-hugo/pulls)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history, updates, and breaking changes.

## License

MIT — use freely. See [LICENSE](LICENSE) for full details.

## Author

**Sharad Raj**

- Website: [sharadraj.in](https://sharadraj.com)
- GitHub: [@sharadcodes](https://github.com/sharadcodes)
- LinkedIn: [srsmaurya](https://www.linkedin.com/in/srsmaurya)

---

Made with ❤️ for academics and engineers.