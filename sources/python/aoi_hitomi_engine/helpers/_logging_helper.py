from datetime import datetime
from logging import basicConfig, FileHandler, Formatter, info, INFO
from pathlib import Path
from typing import Any, final

from rich.logging import RichHandler

from aoi_hitomi_engine.helpers._path_helper import PathHelper


@final
class RichLogger:
    def __new__(cls,
                *args,
                **kwargs) -> None:
        message: str = str(f"Can't instantiate static class {cls.__name__}")
        raise TypeError(message)

    @staticmethod
    def initialize() -> None:
        timestamp: str = datetime.now().strftime("%Y-%m-%d_%H-%M-%S_%f")
        filename_for_log: str = str(f"ahe_{timestamp}.log")

        format_for_logging: str = "[%(asctime)s] %(levelname)-8s %(message)s"
        format_for_rich_logging: str = "%(message)s"

        rich_handler: RichHandler = RichHandler(show_level=True,
                                                rich_tracebacks=True,
                                                log_time_format="[%Y-%m-%d %X]")
        rich_handler.setFormatter(Formatter(format_for_rich_logging))

        app_log_dir: Path = PathHelper.app_log_dir()
        app_log_dir.mkdir(parents=True,
                          exist_ok=True)

        file_handler: FileHandler = FileHandler(filename=app_log_dir / filename_for_log,
                                                encoding="utf-8")

        basicConfig(format=format_for_logging,
                    level=INFO,
                    handlers=[file_handler,
                              rich_handler])

    @staticmethod
    def log(message: str):
        def decorator(method_to_be_decorated: ()) -> ():
            def wrapper(*args, **kwargs):
                info(message)

                result: Any = method_to_be_decorated(*args, **kwargs)

                info(f"{message}...完成")

                return result

            return wrapper

        return decorator
