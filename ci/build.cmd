@echo off

rem 使用 UTF-8 字元編碼
    chcp 65001
    cls

@rem 標題
set title=藍眼引擎建置器 Aoi Hitomi Engine Builder
    title %title%

@rem 應用程式名稱
set app_name=aoi-hitomi-engine

@rem 應用程式版本
set app_version=25.2.0

@rem Node.js 版本
set node_version=22.13.1

@rem Python 版本
set python_version=3.13.1

@rem Yarn 版本
set yarn_version=4.6.0

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

rem 切換工作目錄至根目錄
    cd ..

rem 設定根目錄位置
set root=%cd%

rem 設定應用程式原始碼目錄位置
set sources=%root%\sources

rem 設定 Angular 應用程式原始碼目錄位置
set source_angular=%sources%\aoi-hitomi-engine

rem 設定 Python 應用程式原始碼目錄位置
set source_python=%sources%\python-app-core

rem 設定腳本目錄位置
set scripts=%root%\scripts

rem 設定封裝目錄位置
set bundle=%root%\bundle

rem 設定未封裝目錄位置
set bundle_unpacked=%bundle%\unpacked

rem 設定 Angular 應用程式原始碼封裝目錄位置
set bundle_angular=%bundle_unpacked%\wwwroot

rem 設定 Python 應用程式原始碼封裝目錄位置
set bundle_python=%bundle_unpacked%\bin

rem 設定執行環境目錄位置
set runtime=%root%\runtimes

rem 設定 Node.js 執行環境目錄名稱
set node_runtime_directory_name=node

rem 設定 Python 執行環境目錄名稱
set python_runtime_directory_name=python

rem 設定 Node.js 執行環境目錄位置
set node_runtime=%runtime%\%node_runtime_directory_name%

rem 設定 Python 執行環境目錄位置
set python_runtime=%runtime%\%python_runtime_directory_name%

rem 設定 Node.js 直譯器位置
set node=%node_runtime%\node.exe

rem 設定 Python 直譯器位置
set python=%python_runtime%\python.exe

rem 設定 npm 程式位置
set npm=%node_runtime%\npm

rem 設定 Corepack 程式位置
set corepack=%node_runtime%\corepack

rem 設定 Yarn 程式位置
set yarn=%node_runtime%\yarn

rem 設定檔案名稱：Embeddable Python for Windows 壓縮檔
set embeddable_python_for_windows_zip=python-%python_version%-embed-amd64.zip

rem 設定檔案名稱：Node.js Prebuilt Binaries for Windows 壓縮檔
set node_prebuilt_binaries_for_windows_zip=node-v%node_version%-win-x64.zip

@rem 程式進入點
:main

rem 顯示應用程式資訊
    echo %blue_background% %title% %default%
    echo.

@rem 檢查 Node.js 執行環境
:check_node_runtime
    echo %arrow_green% %white%檢查 Node.js 執行環境%default%
    echo.

    if exist %node% (
rem 如果 Node.js 存在則開始建置應用程式
        goto :build
    ) else (
rem 如果 Node.js 不存在則初始化 Node.js 執行環境
        echo %red%警告%white%: Node.js 執行環境不存在%default%
        echo.
        goto :initialize_node_runtime
    )

@rem 初始化 Node.js 執行環境
:initialize_node_runtime
    echo %arrow_green% %white%初始化 Node.js 執行環境%default%
    echo.

rem 下載 Node.js Prebuilt Binaries for Windows
    echo %arrow_green% %white%正在獲取 %green%Node.js %node_version% Prebuilt Binaries for Windows%default%
    echo.
    echo %arrow_blue% %white%正在下載 https://nodejs.org/dist/v%node_version%/%node_prebuilt_binaries_for_windows_zip%%default%
    call curl --create-dirs --output-dir %runtime% --progress-bar --remote-name --url https://nodejs.org/dist/v%node_version%/%node_prebuilt_binaries_for_windows_zip%
    echo.

rem 解壓縮 Node.js Prebuilt Binaries for Windows
    echo %arrow_blue% %white%正在解壓縮 %runtime%\%node_prebuilt_binaries_for_windows_zip%%default%
    call tar -xf %runtime%\%node_prebuilt_binaries_for_windows_zip% -C %runtime%
    echo.

rem "刪除 Node.js Prebuilt Binaries for Windows 壓縮檔"
    echo %arrow_blue% %white%正在刪除 %runtime%\%node_prebuilt_binaries_for_windows_zip%%default%
    del %runtime%\%node_prebuilt_binaries_for_windows_zip%
    echo.

rem 重新命名解壓縮完成的 Node.js 執行環境目錄
    rename %runtime%\node-v%node_version%-win-x64 %node_runtime_directory_name%

rem 安裝 Corepack 與 Yarn
    echo %arrow_blue% %white%正在安裝 corepack%default%
    call %npm% install --global corepack
    echo.

    echo %arrow_blue% %white%正在安裝 yarn%default%
    call %corepack% install --global yarn@%yarn_version%
    echo.

@rem 建置應用程式
:build
    echo %arrow_green% %white%建置應用程式%default%
    echo.

rem 建置 Angular 應用程式
    echo %arrow_blue% %white%正在建置 Angular 應用程式%default%
    cd %source_angular%
    if not exist %source_angular%\node_modules call %yarn%
    call %yarn% build
    cd %root%
    title %title%

rem 清除未封裝目錄
    if exist %bundle_unpacked% (
        echo %arrow_blue% %white%正在清除未封裝目錄%default%
        rmdir %bundle_unpacked% /s /q
        echo.
    )

rem 複製已完成建置的 Angular 應用程式
    echo %arrow_blue% %white%正在複製已完成建置的 Angular 應用程式%default%
    xcopy %source_angular%\dist\aoi-hitomi-engine\browser %bundle_angular% /q /i /e /y
    echo.

rem "複製 Python 應用程式原始碼"
    echo %arrow_blue% %white%正在複製 Python 應用程式原始碼%default%
    xcopy %source_python%\aoi_hitomi_engine %bundle_python%\aoi_hitomi_engine /q /i /e /y
    echo.

rem 複製應用程式腳本
    echo %arrow_blue% %white%正在複製應用程式腳本%default%
    copy /y %scripts%\launcher.cmd %bundle_unpacked%\launcher.cmd
    echo.

rem "複製開放原始碼授權條款"
    echo %arrow_blue% %white%正在複製開放原始碼授權條款%default%
    mkdir %bundle_unpacked%\licenses
    copy /y %root%\LICENSE.aoi-hitomi-engine %bundle_unpacked%\licenses\LICENSE.aoi_hitomi_engine.txt
    copy /y %source_angular%\dist\aoi-hitomi-engine\3rdpartylicenses.txt %bundle_unpacked%\licenses\3rdpartylicenses.txt
    echo.

@rem 檢查 Python 執行環境
:check_python_runtime
    echo %arrow_green% %white%檢查 Python 執行環境%default%
    echo.

    if exist %python% (
rem 如果 Python 存在則開始封裝應用程式
        goto :bundle_application
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

@rem 封裝應用程式
:bundle_application
    echo %arrow_green% %white%封裝應用程式%default%
    echo.
    echo %arrow_blue% %white%正在封裝 %green%%app_name% %app_version%%default%
    call %python% -m compileall %bundle_python% -f -q -b -j 0 --invalidation-mode "checked-hash" -o 2
    call %python% %scripts%\bundle_application.py %app_version%
    echo.

pause
