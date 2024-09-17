from typing import final

from webview.window import Window as WebviewWindow


@final
class InteropBridge:
    __webview_window: WebviewWindow

    def __call__(self,
                 webview_window: WebviewWindow) -> None:
        self.__webview_window = webview_window

    def toggle_app_window_fullscreen(self) -> None:
        self.__webview_window.toggle_fullscreen()
