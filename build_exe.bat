@echo off
title Sajjad Tech Translator - Builder
color 0B

echo.
echo ==================================================
echo   Sajjad Tech - EXE Builder (PyInstaller)
echo ==================================================
echo.

echo.
echo Select Build Mode:
echo [1] Standard Build (PyInstaller) - Fast, standard protection.
echo [2] Secure Build (Nuitka) - Slow (~10-20 mins), compiles to C/C++ (Anti-Reverse Engineering).
echo.
set /p mode="Enter choice (1 or 2): "

if "%mode%"=="2" goto NUITKA_BUILD

:PYINSTALLER_BUILD
echo.
echo [INFO] Starting Standard Build (PyInstaller)...
:: 1. Install PyInstaller
echo [INFO] Installing PyInstaller...
pip install pyinstaller
echo.

:: 2. Build Main App
echo [INFO] Building Sajjad Tech Translator (Main App)...
echo --------------------------------------------------
:: --noconsole: Hide cmd window
:: --name: Output name
:: --clean: Clean cache
:: --onefile: Single exe (slower start) or --onedir (faster start, folder).
:: Switching to --onedir to fix "Failed to extract" errors and improve startup speed.
:: Using .spec file to include argostranslate hooks
pyinstaller --clean SajjadTechTranslator.spec
echo --------------------------------------------------
echo.

:: 3. Build KeyGen
echo [INFO] Building KeyGen Tool...
echo --------------------------------------------------
pyinstaller --noconsole --name "SajjadTech_KeyGen" --clean --onefile --icon "assets\logo.ico" keygen.py
echo --------------------------------------------------
echo.
goto ORGANIZE

:NUITKA_BUILD
echo.
echo [INFO] Installing Nuitka requirements...
pip install nuitka zstandard
echo.
echo [INFO] Starting Secure Build (Nuitka)...
echo This may take a while. Please be patient.
echo.

:: Build Main
nuitka --standalone --onefile --enable-plugin=pyside6 --windows-icon-from-ico=assets/logo.ico --include-data-dir=assets=assets --output-filename=SajjadTechTranslator.exe --disable-console main.py

:: Build KeyGen
nuitka --standalone --onefile --enable-plugin=pyside6 --windows-icon-from-ico=assets/logo.ico --output-filename=SajjadTech_KeyGen.exe --disable-console keygen.py

:ORGANIZE
echo [INFO] Organizing files...
if not exist "Build_Output" mkdir "Build_Output"

if exist "dist\SajjadTechTranslator" xcopy /E /I "dist\SajjadTechTranslator" "Build_Output\SajjadTechTranslator_App"
if exist "dist\SajjadTech_KeyGen.exe" copy "dist\SajjadTech_KeyGen.exe" "Build_Output\"

:: Copy config template if needed? The app creates it on fly usually.
:: But we might want to ensure 'config' folder exists if we use onedir.
:: Since we use onefile, the app will create config next to the exe.

echo.
echo ==================================================
echo   BUILD COMPLETE!
echo ==================================================
echo.
echo You can find your files in the "Build_Output" folder.
echo.
pause
