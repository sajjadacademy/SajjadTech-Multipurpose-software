$ErrorActionPreference = "Stop"

Write-Host "Building TranslatorApp..."

# Ensure PyInstaller is installed
pip install pyinstaller

# Clean previous builds
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "TranslatorApp.spec") { Remove-Item -Force "TranslatorApp.spec" }

# Build
# --noconsole: Don't show terminal window
# --name: Name of the exe
# --onefile: Bundle everything into one exe
pyinstaller --noconsole --name "TranslatorApp" --onefile main.py

Write-Host "Build complete. Executable is in 'dist/TranslatorApp.exe'"
