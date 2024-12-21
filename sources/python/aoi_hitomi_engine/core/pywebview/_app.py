from typing import final, Final

from webview import create_window as create_webview_window
from webview import settings as webview_settings
from webview import start as webview_start
from webview.window import Window as WebviewWindow

from aoi_hitomi_engine.core.pywebview._bridge import InteropBridge
from aoi_hitomi_engine.utilities.path import source_angular


@final
class BootstrapApplication:
    __main_window: WebviewWindow
    __main_window_title: Final[str] = "藍眼引擎 Aoi Hitomi Engine"
    __main_window_url: str
    __main_window_width: Final[int] = 1280
    __main_window_height: Final[int] = 720
    __bridge: Final[InteropBridge] = InteropBridge()
    __is_dev: bool = False

    def __init__(self,
                 dev_or_not: bool = False) -> None:
        self.__check_dev_or_not(dev_or_not)
        self.__construct_webview_window()
        self.__activate_interop_bridge_of_native_side_and_web_side()
        self.__prevent_open_devtools_in_debug_mode()
        self.__start_webview_window_session()

    def __check_dev_or_not(self,
                           dev_or_not: bool) -> None:
        match dev_or_not:
            case True:
                self.__main_window_url = "http://localhost:4200/"
                self.__is_dev = True
            case _:
                self.__main_window_url = str(source_angular() / "aoi-hitomi-engine" / "browser" / "index.html")

    def __construct_webview_window(self) -> None:
        self.__main_window = create_webview_window(title=self.__main_window_title,
                                                   url=self.__main_window_url,
                                                   js_api=self.__bridge,
                                                   width=self.__main_window_width,
                                                   height=self.__main_window_height)

    def __activate_interop_bridge_of_native_side_and_web_side(self) -> None:
        self.__bridge(webview_window=self.__main_window)

    @staticmethod
    def __prevent_open_devtools_in_debug_mode() -> None:
        webview_settings["OPEN_DEVTOOLS_IN_DEBUG"] = False

    def __start_webview_window_session(self) -> None:
        webview_start(debug=self.__is_dev)
