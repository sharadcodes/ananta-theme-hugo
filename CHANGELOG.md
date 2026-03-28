# Changelog

All notable changes to **Ananta Theme Hugo** are documented here. Versions follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and match `theme.toml` and release tags (`v*`) where possible.

## [Unreleased]

## [1.1.0] - 2026-03-28

### Added

- **SEO / discovery** in `layouts/baseof.html`: conditional `<meta name="description">` (front matter → summary → `params.description`), `<link rel="canonical">`, Hugo `_internal/opengraph.html` and `_internal/twitter_cards.html`, and `<link rel="alternate">` for RSS/Atom via `AlternativeOutputFormats`.
- **Self-hosted Alegreya** (`static/fonts/*.woff2`, latin + latin-ext) with `@font-face` in `static/css/style.css`; `preload` for WOFF2 in `<head>` when fonts are used.
- **LCP-oriented hints** when `profileImage` is set: `preconnect` + `preload` for the image URL; profile `<img>` uses `fetchpriority="high"`, explicit `width`/`height`, and `decoding="async"`.

### Changed

- **Critical request chain**: removed render-blocking Google Fonts stylesheet; **Chroma** and **Bootstrap Icons** stylesheets load non-blocking (`media="print"` + `onload`); `preconnect` to `cdn.jsdelivr.net` for deferred icons.
- **Primary navigation** markup: `<li>` items wrapped in `<ul>` inside `<nav class="nav-links">`; flex styles target `.nav-links ul`.
- **Footer credit link** (`p.footer-meta`): underlined by default and darker blue for contrast so links are not identifiable by color alone (WCAG 1.4.1).
- **Documentation**: README features and configuration aligned with SEO, fonts, and RSS; `exampleSite` `params.description` sample.

## [1.0.2] - 2026-03-28

### Added

- Subtle background and text colors for **Post** and **Paper** badges on taxonomy term (tag) pages.

### Changed

- Header: social icon row moved below the site title/tagline in the intro column; primary nav lists every configured item with the current section shown as a disabled, greyed `<a>` (`aria-current`, `aria-disabled`).
- Footer trimmed to copyright (and Hugo credit where applicable); social links live in the header partial.
- README updated for minimum Hugo version, layout paths (`layouts/_partials`, etc.), and header/social behavior.

## [1.0.1] - 2026-03-27

### Added

- `version` in `theme.toml` for release tracking.
- GitHub Actions workflow to support release automation (see `.github/workflows/create-release.yml`).

### Changed

- Theme and config adjustments aligned with semver-based releases.

## [1.0.0] - 2026-03-27

### Added

- Initial public release as a Hugo **0.146+** theme: root `layouts/` (`baseof`, `home`, `list`, section singles), `layouts/_partials`, `layouts/_shortcodes`, `layouts/_markup`.
- Taxonomy list page (`taxonomy.html`) and term page (`term.html`) with **Post** / **Paper** / **Project** / **Page** kind badges on tag listings.
- Responsive header, breadcrumbs, tags, KaTeX and Chroma-oriented setup as documented in the README.
