# cookbook

A cookbook written in Typst.

## Development

### Requirements

- git (duh)
- [`prek`](https://prek.j178.dev/installation/) (NOT pre-commit)
- [`uv`](https://docs.astral.sh/uv/getting-started/installation/) (optional)
- [`tinymist`](https://github.com/Myriad-Dreamin/tinymist) (optional)

  You will need to set the formatter to `typstyle`, `lineLength=90`, prose
  wrapping, and `/path/to/checkout/src/` base directory. I find it works better
  in neovim, for whatever reason.

Setup:

```bash
prek install

# optional, for Python scripts
uv sync
```

### Utilities

- Run formatters & linters: `prek`
- Build: `doit`
- Generate new recipe: `./new.py <section> <name>`
