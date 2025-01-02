from os import getenv
from pathlib import Path
from platform import system
from typing import final


@final
class PathHelper:
    def __new__(cls,
                *args,
                **kwargs) -> None:
        message: str = str(f"Can't instantiate static class {cls.__name__}")
        raise TypeError(message)

    @staticmethod
    def root_dir() -> Path:
        return Path(__file__).parent.parent.parent.parent

    @classmethod
    def static_assets_dir(cls) -> Path:
        return cls.root_dir() / "wwwroot"

    @staticmethod
    def app_data_dir() -> Path:
        if system() == "Windows":
            return Path(getenv("APPDATA")) / "aoi-hitomi-engine"
        elif system() == "Darwin":
            return Path(Path.home() / "Library" / "Application Support" / "aoi-hitomi-engine")

    @classmethod
    def app_log_dir(cls) -> Path:
        return cls.app_data_dir() / "logs"
