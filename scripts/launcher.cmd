@echo off

rem 使用 UTF-8 字元編碼
    chcp 65001
    cls

@rem 標題
set title=藍眼引擎啟動器 Aoi Hitomi Engine Launcher
    title %title%

@rem 應用程式名稱
set app_name=aoi-hitomi-engine

@rem 應用程式版本
set app_version=24.9.0

@rem Python 版本
set python_version=3.12.6

@rem Python 套件清單
set python_packages=^
pip@24.2@"https://files.pythonhosted.org/packages/d4/55/90db48d85f7689ec6f81c0db0622d704306c5284850383c090e6c7195a5c/pip-24.2-py3-none-any.whl#sha256=2cd581cf58ab7fcfca4ce8efa6dcacd0de5bf8d0a3eb9ec927e07405f4d9e2a2";^
setuptools@75.1.0@"https://files.pythonhosted.org/packages/ff/ae/f19306b5a221f6a436d8f2238d5b80925004093fa3edea59835b514d9057/setuptools-75.1.0-py3-none-any.whl#sha256=35ab7fd3bcd95e6b7fd704e4a1539513edad446c097797f2985e0e4b960772f2";^
proxy-tools@0.1.0@"https://files.pythonhosted.org/packages/f2/cf/77d3e19b7fabd03895caca7857ef51e4c409e0ca6b37ee6e9f7daa50b642/proxy_tools-0.1.0.tar.gz#sha256=ccb3751f529c047e2d8a58440d86b205303cf0fe8146f784d1cbcd94f0a28010";^
bottle@0.13.1@"https://files.pythonhosted.org/packages/9d/72/e22b8be6b4fe129f48b1381f262d8cb8a3c0bc18fda3e735f16417bad4b4/bottle-0.13.1-py2.py3-none-any.whl#sha256=d5e068ad0b4ed3422231ad59bd9ea646a141f57a9c90587212d63477ec04fe96";^
win32more@0.5.5@"https://files.pythonhosted.org/packages/81/a1/8f24e10756e55cc207067973ab8a46f690f7b0f3151912d0ebedbcda532b/win32more-0.5.5-py3-none-any.whl#sha256=5d1a0e814672dc12b88cba6d7f8ca0704bcf4f879b39d76f002c3d63b2f642ac";^
typing-extensions@4.12.2@"https://files.pythonhosted.org/packages/26/9f/ad63fc0248c5379346306f8668cda6e2e2e9c95e01216d2b8ffd9ff037d0/typing_extensions-4.12.2-py3-none-any.whl#sha256=04e5ca0351e0f3f85c6853954072df659d0d13fac324d0072316b67d7794700d";^
tomlkit@0.13.2@"https://files.pythonhosted.org/packages/f9/b6/a447b5e4ec71e13871be01ba81f5dfc9d0af7e473da256ff46bc0e24026f/tomlkit-0.13.2-py3-none-any.whl#sha256=7a974427f6e119197f670fbbbeae7bef749a6c14e793db934baefc1b5f03efde";^
pycparser@2.22@"https://files.pythonhosted.org/packages/13/a3/a812df4e2dd5696d1f351d58b8fe16a405b234ad2886a0dab9183fb78109/pycparser-2.22-py3-none-any.whl#sha256=c3702b6d3dd8c7abc1afa565d7e63d53a1d0bd86cdc24edd75470f4de499cfcc";^
cffi@1.17.1@"https://files.pythonhosted.org/packages/50/b9/db34c4755a7bd1cb2d1603ac3863f22bcecbd1ba29e5ee841a4bc510b294/cffi-1.17.1-cp312-cp312-win_amd64.whl#sha256=51392eae71afec0d0c8fb1a53b204dbb3bcabcb3c9b807eedf3e1e6ccf2de903";^
clr-loader@0.2.6@"https://files.pythonhosted.org/packages/b3/1a/2801c4e3888aac8fcd4d88d32a1155a778d1c01ca040ae8137d433a39cc6/clr_loader-0.2.6-py3-none-any.whl#sha256=79bbfee4bf6ac2f4836d89af2c39e0c32dce5d0c062596185aef380f317507a6";^
pythonnet@3.0.3@"https://files.pythonhosted.org/packages/12/28/2ecca48b313c436eb0b194b74b5a70dd88f2700d79bce5424799ffc82ede/pythonnet-3.0.3-py3-none-any.whl#sha256=62486f860c7955b7dcf470e085e4d2b599512224ca24193f716e857b496c530f";^
pywebview@5.2@"https://files.pythonhosted.org/packages/d7/c7/16f6b1997f8172469db42e0cd567a1a3d52a709c82c9d87eb4f997ec0fb7/pywebview-5.2-py3-none-any.whl#sha256=07acceb74bfeed2b5bf19b9535f23ed68330ec6488ae63aea4d35290941cad7f";

rem 剖析 Python 次要版本
    for %%v in (%python_version%) do (
        for /f "delims=. tokens=1-3" %%a in ("%%v") do (
            set python_minor_version=%%b
        )
    )

rem 設定 Unicode 控制字元
set ESC=

rem 設定文字樣式
set default=%ESC%[0m
set red=%ESC%[91m
set green=%ESC%[92m
set blue=%ESC%[94m
set blue_background=%ESC%[44m
set white=%ESC%[97m

rem 設定箭頭及其樣式
set "arrow_long_right===^>"
set "arrow_green=%green%%arrow_long_right%"
set "arrow_blue=%blue%%arrow_long_right%"

rem 設定根目錄位置
set root=%cd%

rem 設定應用程式原始碼目錄位置
set sources=%root%\sources

rem 設定 Python 應用程式原始碼目錄位置
set source_python=%sources%\python

rem 設定主程式位置
set main_program=%source_python%\aoi_hitomi_engine\__main__.pyc

rem 設定執行環境目錄位置
set runtime=%root%\runtime

rem 設定 Python 執行環境目錄名稱
set python_runtime_directory_name=python

rem 設定 Python 執行環境目錄位置
set python_runtime=%runtime%\%python_runtime_directory_name%

rem 設定 Python 直譯器位置
set python=%python_runtime%\python.exe

rem 設定 Python 掛鉤檔案位置
set python_pth=%python_runtime%\python3%python_minor_version%._pth

rem 設定 Python 套件下載位置
set python_wheels=%python_runtime%\wheels

rem 設定檔案名稱：Embeddable Python for Windows 壓縮檔
set embeddable_python_for_windows_zip=python-%python_version%-embed-amd64.zip

@rem 程式進入點
:main

rem 顯示應用程式資訊
    echo %blue_background% %title% %default%
    echo.

@rem 檢查 Python 執行環境
:check_python_runtime
    echo %arrow_green% %white%檢查 Python 執行環境%default%
    echo.

    if exist %python% (
rem 如果 Python 存在則啟動應用程式
        goto :bootstrap_application
    ) else (
rem 如果 Python 不存在則初始化 Python 執行環境
        echo %red%警告%white%: Python 執行環境不存在%default%
        echo.
        goto :initialize_python_runtime
    )

@rem 初始化 Python 執行環境
:initialize_python_runtime
    echo %arrow_green% %white%初始化 Python 執行環境%default%
    echo.

rem 下載 Embeddable Python for Windows
    echo %arrow_green% %white%正在獲取 %green%Embeddable Python %python_version% for Windows%default%
    echo.
    echo %arrow_blue% %white%正在下載 https://www.python.org/ftp/python/%python_version%/%embeddable_python_for_windows_zip%%default%
    call curl --create-dirs --output-dir %python_runtime% --progress-bar --remote-name --url https://www.python.org/ftp/python/%python_version%/%embeddable_python_for_windows_zip%
    echo.

rem 解壓縮 Embeddable Python for Windows
    echo %arrow_blue% %white%正在解壓縮 %runtime%\%embeddable_python_for_windows_zip%%default%
    call tar -xf %python_runtime%\%embeddable_python_for_windows_zip% -C %python_runtime%
    echo.

rem "刪除 Embeddable Python for Windows 壓縮檔"
    echo %arrow_blue% %white%正在刪除 %runtime%\%embeddable_python_for_windows_zip%%default%
    del %python_runtime%\%embeddable_python_for_windows_zip%
    echo.

rem 啟用 Python 的 site 掛鉤
    echo %arrow_blue% %white%正在啟用 Python 的 site 掛鉤%default%
    echo python3%python_minor_version%.zip > %python_pth%
    echo .>> %python_pth%
    echo.>> %python_pth%
    echo # Uncomment to run site.main() automatically>> %python_pth%
    echo import site>> %python_pth%
    echo.

rem 下載 Standalone ZIP Application for pip
    echo %arrow_green% %white%正在獲取 %green%Standalone ZIP Application for pip%default%
    echo.
    echo %arrow_blue% %white%正在下載 https://bootstrap.pypa.io/pip/pip.pyz%default%
    call curl --create-dirs --output-dir %python_runtime% --progress-bar --remote-name --url https://bootstrap.pypa.io/pip/pip.pyz
    echo.

rem 根據 Python 套件清單下載 Python 套件
    for %%p in (%python_packages%) do (
        for /f "eol=; delims=@ tokens=1-3" %%a in ("%%p") do (
            echo %arrow_green% %white%正在獲取 %green%%%a %%b%default%
            echo.
            echo %arrow_blue% %white%正在下載 %%c%default%
            call curl --create-dirs --output-dir %python_wheels% --progress-bar --remote-name --url %%c
            echo.
        )
    )

rem 安裝 pip
    echo %arrow_blue% %white%正在安裝 pip%default%
    call %python% %python_runtime%\pip.pyz install --no-warn-script-location --no-index --no-cache-dir --find-links=%python_wheels% pip
    echo.

rem 刪除 Standalone ZIP Application for pip
    echo %arrow_blue% %white%正在刪除 Standalone ZIP Application for pip%default%
    del %python_runtime%\pip.pyz
    echo.

rem 安裝 setuptools
    echo %arrow_blue% %white%正在安裝 setuptools%default%
    call %python% -m pip install --no-index --no-cache-dir --find-links=%python_wheels% setuptools
    echo.

rem 安裝啟動應用程式所需要的所有 Python 套件
    echo %arrow_blue% %white%正在安裝啟動應用程式所需要的所有 Python 套件%default%
    call %python% -m pip install --no-warn-script-location --no-index --no-cache-dir --find-links=%python_wheels% pywebview tomlkit win32more
    echo.

rem 刪除所有 Python 套件 Wheel 檔案
    echo %arrow_blue% %white%正在刪除所有 Python 套件 Wheel 檔案%default%
    rmdir %python_wheels% /s /q
    echo.

rem 解除安裝 setuptools
    echo %arrow_blue% %white%正在解除安裝 setuptools%default%
    call %python% -m pip uninstall --yes setuptools
    echo.

rem 解除安裝 pip
    echo %arrow_blue% %white%正在解除安裝 pip%default%
    call %python% -m pip uninstall --yes pip
    echo.
    
@rem 啟動應用程式
:bootstrap_application
    echo %arrow_green% %white%正在啟動 %green%%app_name% %app_version%%default%
    echo.
    call %python% %main_program%

pause
