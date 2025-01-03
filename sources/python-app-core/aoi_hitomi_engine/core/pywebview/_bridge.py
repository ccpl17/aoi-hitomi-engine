from typing import final

from webview.window import Window as WebViewWindow


@final
class InteropBridge:
    __webview_window: WebViewWindow

    def __call__(self,
                 webview_window: WebViewWindow) -> None:
        self.__webview_window = webview_window

    def toggle_app_window_fullscreen(self) -> None:
        self.__webview_window.toggle_fullscreen()
