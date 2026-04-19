#!/usr/bin/env python3

import os
import subprocess
import sys
from functools import partial
from pathlib import Path
from textwrap import dedent

import typer

eprint = partial(print, file=sys.stderr)

ROOT = Path(__file__).parent
RECIPE_DIR = ROOT / "src" / "Pages" / "03-recipes"
assert RECIPE_DIR.is_dir()

SECTIONS = {path.name[3:]: path for path in RECIPE_DIR.iterdir() if path.is_dir()}


def template(title: str):
    return dedent(f"""
    #import "/formatting.typ": *

    = {title}
    """).strip()


app = typer.Typer()


@app.command()
def main(section: str, title: str):
    section = section.strip().lower()
    target_directory = SECTIONS.get(section)
    if target_directory is None:
        eprint(
            f"Invalid section '{section};\n  expected one of: '{"', '".join(SECTIONS)}'"
        )
        raise typer.Abort()

    target = target_directory / (title.strip() + ".typ")
    if target.exists():
        eprint("Target already exists.")
        raise typer.Abort()

    _ = target.write_text(template(title))
    print("Wrote to path:", target)

    os.chdir(ROOT)
    _ = subprocess.run(("git", "add", "-N", target.as_posix()), check=True)
    print("Began tracking new path in git.")
    _ = subprocess.run(("doit", "build_index"), check=True)
    print("Regenerated index file.")


if __name__ == "__main__":
    app()
