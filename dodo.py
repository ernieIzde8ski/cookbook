from pathlib import Path

def Action(*args: str | Path) -> list[str]:
    result: list[str] = []
    for value in args:
        if isinstance(value, Path):
            value = value.as_posix()
        result.append(value)
    return result

def task_compile():
    working_directory = Path("src")
    targets_directory = Path("target")
    variant_directory = working_directory / "variants"
    variants = {path for path in variant_directory.glob("*.typ") if not path.name.startswith("_")}
    sources = list({*working_directory.rglob("*.typ")} - variants)
    for variant in variants:
        name = variant.name.removesuffix(variant.suffix)
        target = targets_directory / (name + ".pdf")
        yield {
            "name": name,
            "actions": [
                Action(
                    "tinymist",
                    "compile",
                    "--save-lock",
                    "--root",
                    "src/",
                    "--",
                    variant,
                    target
                )
            ],
            "file_dep": [variant] + sources,
            "targets": (target, )
        }
