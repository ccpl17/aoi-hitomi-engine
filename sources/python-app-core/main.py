from logging import exception
from pathlib import Path
from sys import exit as run
from sys import path

path.insert(0,
            str(Path(__file__).parent))
try:
    from aoi_hitomi_engine.core.pywebview import BootstrapApplication
    from aoi_hitomi_engine.helpers import RichLogger
except ImportError:
    BootstrapApplication = None
    RichLogger = None

try:
    RichLogger.initialize()
    run(BootstrapApplication())
except Exception as error:
    exception(error)
