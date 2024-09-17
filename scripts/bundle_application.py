from argparse import ArgumentParser, Namespace
from os import chdir, walk, remove
from pathlib import Path
from shutil import make_archive, rmtree

# 引數剖析器
parser: ArgumentParser = ArgumentParser()
parser.add_argument("version")

# 剖析引數
args: Namespace = parser.parse_args()

# 設定根目錄位置
root: Path = Path(__file__).parent.parent

# 應用程式名稱
app_name: str = root.parts[-1]

# 應用程式版本
app_version: str = args.version

# 應用程式封裝名稱
app_bundle_name: str = f"{app_name}-v{app_version}-bundle"

# 設定封裝目錄位置
bundle: Path = root / "bundle"

# 設定未封裝目錄位置
unpacked_bundle: Path = bundle / "unpacked"

# `__pycache__` 資料夾清單
pycache_directories: list[Path] = []

# 切換工作目錄
chdir(bundle)

# 刪除所有副檔名為 `py` 的檔案以及找出所有 `__pycache__` 資料夾
for directory, subdirectories, files in walk(unpacked_bundle):
    for file_name in files:
        file: Path = Path(directory) / file_name
        directory: Path = Path(directory)

        if file.suffix == ".py":
            remove(file)

        if directory.parts[-1] == "__pycache__":
            pycache_directories.append(directory)

# 刪除所有 `__pycache__` 資料夾
for directory in list(set(pycache_directories)):
    rmtree(directory)

# 封裝應用程式
make_archive(
    base_name=app_bundle_name,
    format="zip",
    root_dir=unpacked_bundle
)
