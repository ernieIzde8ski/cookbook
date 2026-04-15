from collections.abc import Iterator
from functools import partial
from hashlib import sha256
from pathlib import Path

import yaml

LIBRARY_DIRECTORY = Path("src")
VARIANT_DIRECTORY = LIBRARY_DIRECTORY / "variants"
TARGET_DIRECTORY = Path("target")

TYPST_SOURCES = set(LIBRARY_DIRECTORY.rglob("*.typ"))
VARIANTS = {
    path for path in VARIANT_DIRECTORY.rglob("*.typ") if not path.name.startswith("_")
}
INDICES = set(LIBRARY_DIRECTORY.rglob("index.yaml"))
LIBRARIES = TYPST_SOURCES | INDICES - VARIANTS


def Action(*args: str | Path) -> list[str]:
    result: list[str] = []
    for value in args:
        if isinstance(value, Path):
            value = value.as_posix()
        result.append(value)
    return result


def task_compile():
    def actions(source: Path, target: Path) -> list[list[str]]:
        return [Action("tinymist", "compile", "--save-lock", "--root", "src/", "--", source, target)]
    libs = list(LIBRARIES)
    for variant in VARIANTS:
        name = variant.name.removesuffix(variant.suffix)
        target = TARGET_DIRECTORY / (name + ".pdf")
        yield {
            "name": name,
            "actions": actions(variant, target),
            "file_dep": [variant] + libs,
            "targets": (target,),
        }

    name = "webpage"
    source = VARIANT_DIRECTORY / "_base.typ"
    target = TARGET_DIRECTORY / (name + ".html")
    yield {
        "name": name,
        "actions": actions(source, target),
        "file_dep": libs,
        "targets": (target,),
    }


def _generate_flat_index(root: Path) -> Iterator[str]:
    files: list[str] = []
    for path in sorted(root.iterdir()):
        if path.name.startswith(".") or path.name.startswith("_"):
            continue
        if path.is_dir():
            yield path.name + "/"
            for child in _generate_flat_index(path):
                yield f"{path.name}/{child}"
        elif path.is_file() and path.suffix == ".typ":
            files.append(path.name)
    yield from files


def _build_index(index: Path):
    paths = list(_generate_flat_index(index.parent))
    with open(index, "w") as file:
        yaml.dump(paths, file)


def task_build_index():
    for index_path in INDICES:
        path_bytes = index_path.as_posix().encode()
        hash = sha256(path_bytes).digest()
        short_hash = hash.hex()[:6]

        yield {
            "name": f"{short_hash}-{index_path.parent.name}",
            "actions": [partial(_build_index, index_path)],
            "file_dep": [*index_path.parent.rglob("*.typ")],
            "targets": (index_path,),
        }
