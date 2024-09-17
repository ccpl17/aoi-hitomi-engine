from argparse import ArgumentParser, Namespace
from pathlib import Path
from sys import exit as run
from sys import path
from typing import final, Final

path.insert(0,
            str(Path(__file__).parent.parent))
try:
    from aoi_hitomi_engine.core.bootstrap import BootstrapApplication
except ImportError:
    BootstrapApplication = None


@final
class AoiHitomiEngine:
    @staticmethod
    def main() -> None:
        parser: Final[ArgumentParser] = ArgumentParser()
        parser.add_argument("--dev",
                            action="store_true",
                            help="是否以開發模式啟動")

        args: Final[Namespace] = parser.parse_args()
        AoiHitomiEngine(args)

    def __init__(self,
                 args: Namespace) -> None:
        BootstrapApplication(dev_or_not=args.dev)


if __name__ == "__main__":
    run(AoiHitomiEngine.main())
