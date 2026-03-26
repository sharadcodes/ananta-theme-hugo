---
title: "Blog authoring showcase (math, figures, code, markdown)"
date: 2026-03-26
author: "Sharad Raj"
tags: ["Hugo", "Markdown", "Meta"]
params:
  math: true
---

This post is a **living reference** for everything you can drop into a normal article: front matter, math, the `fig` shortcode, plain images, highlighted code with line numbers, links, lists, and quotes. Copy the fenced blocks into your own `.md` files.

---

## 1. Front matter (YAML)

Every post starts with metadata between `---` lines:

```yaml
---
title: "Your title"
date: 2026-03-26
author: "Your Name"
tags: ["TagOne", "TagTwo"]
params:
  math: true   # load KaTeX on this page only (site default can be false)
---
```

- **`tags`**: show under the post and on `/tags/…` pages.  
- **`params.math: true`**: required for LaTeX below unless you set `math = true` globally in `config.toml`.

---

## 2. Math (KaTeX)

**Inline** (same line as text), use `\(` … `\)`:

```text
The loss is \( \mathcal{L} = -\sum_i y_i \log \hat{y}_i \).
```

Live: The loss is \( \mathcal{L} = -\sum_i y_i \log \hat{y}_i \).

**Display block** with `\[ … \]` or `$$ … $$`:

```text
\[
\mathrm{softmax}(z_i) = \frac{e^{z_i}}{\sum_j e^{z_j}}
\]
```

Live:

\[
\mathrm{softmax}(z_i) = \frac{e^{z_i}}{\sum_j e^{z_j}}
\]

---

## 3. Captions: `fig` shortcode

Hugo runs **shortcodes before Markdown**, so putting `fig` shortcode markup inside ordinary fenced code blocks still **executes** the shortcode. The copy-paste examples below use raw HTML with `&lt;` so the line shows up literally (what you copy is normal angle brackets).

**Named arguments** (easiest to read):

<pre class="content-sample"><code>{{&lt; fig src="/images/rag-pipeline.svg" alt="Short description for accessibility" caption="Caption text; **markdown** works here." >}}</code></pre>

Live:

{{< fig src="/images/rag-pipeline.svg" alt="RAG pipeline diagram" caption="**fig** shortcode: lazy-loaded image + caption." >}}

**Positional** (`src`, `alt`, `caption` in order):

<pre class="content-sample"><code>{{&lt; fig "/images/rag-pipeline.svg" "Alt text" "Optional caption." >}}</code></pre>

**Clickable image** (opens URL in a new context—use full URLs for external assets):

<pre class="content-sample"><code>{{&lt; fig src="/images/rag-pipeline.svg" alt="Diagram" caption="Thumbnail linking out" href="https://gohugo.io" >}}</code></pre>

---

## 4. Plain markdown image

File lives under **`static/`**; URL starts at site root:

```text
![Alt text only](/images/rag-pipeline.svg)
```

Live:

![Plain markdown image](/images/rag-pipeline.svg)

---

## 5. Code fences (syntax + line numbers)

Use a **language** right after the opening backticks. Hugo/Chroma adds colors and a gutter.

```python
def softmax(z):
    import math
    m = max(z)
    exps = [math.exp(x - m) for x in z]
    s = sum(exps)
    return [e / s for e in exps]
```

**Highlight specific lines** (optional fence options — array syntax as in [Hugo docs](https://gohugo.io/content-management/syntax-highlighting/#highlighting-in-code-fences)):

```python {hl_lines=[2,"4-5"]}
def line_one():
    def line_two_highlighted():
        return 2
    def line_three():
        return 3
    def line_four_highlighted():
        return 4
```

**Shell**:

```bash
hugo server -D --bind 127.0.0.1 --port 1313
```

**Inline code**: wrap with single backticks: `params.math`, `relURL`, `config.toml`.

---

## 6. Writing & structure

**Links:** [Hugo docs](https://gohugo.io/documentation/)

**Emphasis:** *italic*, **bold**, ***both***.

**List:**

- bullets
- second item

**Numbered:**

1. first  
2. second  

**Blockquote:**

> Use for callouts or citations.

**Rule:**

---

## 7. Quick checklist

| You want | What to do |
|----------|----------------|
| Equations | `params.math: true` plus `\(` `\[` or `$$` (see §2) |
| Diagram with caption | `fig` shortcode — see §3 for full snippet |
| Photo from `/static` | Markdown `![alt](/images/file.jpg)` |
| Code with highlighting | Fenced block with a language tag (see §5) |
| Tags on the post | `tags: ["a","b"]` in front matter |

---

*Tip: open `content/posts/blog-authoring-showcase.md` in your editor to compare raw markdown with this rendered page.*
