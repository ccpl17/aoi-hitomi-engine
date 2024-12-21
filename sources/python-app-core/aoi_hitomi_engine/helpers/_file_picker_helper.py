from pathlib import Path
from typing import final

from webview import FOLDER_DIALOG, OPEN_DIALOG, SAVE_DIALOG
from webview.window import Window as WebViewWindow


@final
class FilePickerHelper:
    def __new__(cls,
                *args,
                **kwargs) -> None:
        message: str = str(f"Can't instantiate static class {cls.__name__}")
        raise TypeError(message)

    @staticmethod
    def pick_single_file(file_types: tuple,
                         webview_window: WebViewWindow) -> Path | None:
        path: tuple | None = webview_window.create_file_dialog(OPEN_DIALOG,
                                                               file_types=file_types)
        return Path(path[0]) if path is not None \
            else None

    @staticmethod
    def pick_single_folder(webview_window: WebViewWindow) -> Path | None:
        path: str | None = webview_window.create_file_dialog(FOLDER_DIALOG)

        return Path(path) if path is not None \
            else None

    @staticmethod
    def pick_save_file(file_types: tuple,
                       webview_window: WebViewWindow) -> Path | None:
        path: str | None = webview_window.create_file_dialog(SAVE_DIALOG,
                                                             file_types=file_types)
        return Path(path) if path is not None \
            else None
