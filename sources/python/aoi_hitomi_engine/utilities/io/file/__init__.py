from pathlib import Path

from webview import FOLDER_DIALOG, OPEN_DIALOG, SAVE_DIALOG
from webview.window import Window as WebviewWindow


def pick_single_file(file_types: tuple,
                     webview_window: WebviewWindow) -> Path | None:
    path: tuple | None = webview_window.create_file_dialog(OPEN_DIALOG,
                                                           file_types=file_types)
    return Path(path[0]) if path is not None \
        else None


def pick_single_folder(webview_window: WebviewWindow) -> Path | None:
    path: str | None = webview_window.create_file_dialog(FOLDER_DIALOG)

    return Path(path) if path is not None \
        else None


def pick_save_file(file_types: tuple,
                   webview_window: WebviewWindow) -> Path | None:
    path: str | None = webview_window.create_file_dialog(SAVE_DIALOG,
                                                         file_types=file_types)
    return Path(path) if path is not None \
        else None
