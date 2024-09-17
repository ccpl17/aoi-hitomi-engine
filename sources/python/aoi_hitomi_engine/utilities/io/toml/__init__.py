from pathlib import Path

from tomlkit.api import dump, load
from tomlkit.toml_document import TOMLDocument


def load_a_toml_document(file: Path) -> TOMLDocument:
    with open(file=file,
              mode="r") as toml_file:
        return load(toml_file)


def save_a_toml_document(file: TOMLDocument,
                         to: Path) -> None:
    with open(file=to,
              mode="w") as toml_file:
        dump(data=file,
             fp=toml_file)
