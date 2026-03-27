# Ananta Theme Hugo — example site

Example site using the **Ananta Theme Hugo** theme (`themes/ananta-theme-hugo/`). The theme name **Ananta** comes from Hindi/Sanskrit **अनन्त** (*anant*), meaning **without end** — infinite or boundless. See **`themes/ananta-theme-hugo/README.md`** for a short note on the word.

## Quick start

1. Install [Hugo](https://gohugo.io/) (v0.145.0+).
2. From this directory:

```powershell
hugo server
```

3. Open http://localhost:1313/

## Build

```powershell
hugo
```

Output goes to `public/` for deployment (GitHub Pages, Netlify, Vercel, any static host).

## Layout

```
.
├── config.toml                 # Site title, params, section/nav order, socials
├── static/                     # Served at site root: e.g. static/images/a.png → /images/a.png
│   └── images/                 # Figures, diagrams, photos
├── content/
│   ├── _index.md               # Homepage intro (shown in About preview + home)
│   ├── about/_index.md         # Full about page at /about/
│   ├── posts/                  # Blog posts
│   ├── papers/                 # Research papers
│   ├── projects/               # Projects
│   └── experience/             # CV / roles
└── themes/
    └── ananta-theme-hugo/        # Theme (layouts, static CSS, README)
```

## New content

```powershell
hugo new posts/my-post.md
hugo new papers/my-paper.md
hugo new projects/my-project.md
hugo new experience/my-role.md
```

For a **single reference post** (math, `fig`, images, code, line highlights, markdown patterns), see `content/posts/blog-authoring-showcase.md` and open it in the browser at `/posts/blog-authoring-showcase/`.

## Configuration

See `config.toml` for a working example. Full parameter list and behavior: **`themes/ananta-theme-hugo/README.md`**.

## Theme documentation

**[themes/ananta-theme-hugo/README.md](themes/ananta-theme-hugo/README.md)** — installation, front matter, `homeSectionOrder`, `navOrder`, social links (including Google Scholar), tags, and customization.
