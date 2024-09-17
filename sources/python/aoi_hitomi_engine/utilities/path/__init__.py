from os import getenv
from pathlib import Path


def engine_root() -> Path:
    return Path(__file__).parent.parent.parent.parent.parent.parent


def source_root() -> Path:
    return engine_root() / "sources"


def source_angular() -> Path:
    return source_root() / "angular"


def source_python() -> Path:
    return source_root() / "python"


def app_data() -> Path:
    return Path(getenv("APPDATA")) / "aoi-hitomi-engine"
