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
set app_version=24.12.0

@rem Python 版本
set python_version=3.12.7

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

rem 設定應用程式二進位檔案目錄位置
set bin=%root%\bin

rem 設定主程式位置
set main_program=%bin%\ahe.pyc

rem 設定執行環境目錄位置
set runtime=%root%\runtime

rem 設定 Python 執行環境目錄位置
set python_runtime=%runtime%

rem 設定 Python 直譯器位置
set python=%python_runtime%\python.exe

rem 設定 Standalone ZIP Application for pip 位置
set pip_pyz=%python_runtime%\pip.pyz

rem 設定 Python 掛鉤檔案位置
set python_pth=%python_runtime%\python3%python_minor_version%._pth

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

rem 安裝 setuptools
    echo %arrow_blue% %white%正在安裝 setuptools%default%
    call %python% %pip_pyz% install --no-cache-dir setuptools
    echo.

rem 安裝啟動應用程式所需要的所有 Python 套件
    echo %arrow_blue% %white%正在安裝啟動應用程式所需要的所有 Python 套件%default%
    call %python% %pip_pyz% install --no-warn-script-location --no-cache-dir pywebview rich tomlkit win32more
    echo.

rem 解除安裝 setuptools
    echo %arrow_blue% %white%正在解除安裝 setuptools%default%
    call %python% %pip_pyz% uninstall --yes setuptools
    echo.

rem 刪除 Standalone ZIP Application for pip
    echo %arrow_blue% %white%正在刪除 Standalone ZIP Application for pip%default%
    del %pip_pyz%
    echo.
    
@rem 啟動應用程式
:bootstrap_application
    echo %arrow_green% %white%正在啟動 %green%%app_name% %app_version%%default%
    echo.
    call %python% %main_program%

pause
