# Example site for Ananta Theme Hugo

This folder is a demo Hugo site for the theme in the parent directory.

## Run locally

From the repository root:

```powershell
.\scripts\prepare-example-site.ps1
cd exampleSite
hugo server
```

On macOS/Linux:

```bash
bash ./scripts/prepare-example-site.sh
cd exampleSite && hugo server
```

The prepare script creates `themes/ananta-theme-hugo` as a link (junction/symlink) to the repo root so `theme = "ananta-theme-hugo"` resolves correctly.

## Build

```bash
cd exampleSite
hugo --minify
```

Output is written to `exampleSite/public/`.
