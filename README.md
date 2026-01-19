# SajjadTech AI Translator

![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-blue.svg)
![License](https://img.shields.io/badge/license-Proprietary-red.svg)
![Status](https://img.shields.io/badge/status-Active-success.svg)
![Platform](https://img.shields.io/badge/platform-Windows-win.svg)

**SajjadTech AI Translator** is a powerful, all-in-one desktop translation suite built with **Python** and **PySide6**. It combines traditional offline/online translation engines with cutting-edge AI (LLMs) to provide a seamless multilingual experience.

Whether you need to translate text, documents, voice, or even text inside images on your screen, this application has you covered.

---

## 🌟 Key Features

### 🧠 Core Translation
*   **Dual Mode Engine**:
    *   **Offline**: Privacy-focused, local neural translation using `Argos Translate`. No internet required.
    *   **Online**: High-accuracy translation using Google Translate, DeepL, and AI models.
*   **Smart Language Detection**: Automatically identifies the source language.

### 🚀 Productionivity Tools
*   **📸 Snipping & OCR Translator**: Select any area on your screen to extract and translate text instantly. Perfect for translating text in images, protected PDFs, or games.
*   **📄 Document Translator**: Drag and drop support for full document translation.
    *   Supported formats: **PDF**, **DOCX**, **XLSX**.
    *   Preserves formatting while translating content.
*   **📧 Email Assistant**: specialised tab for drafting and polishing cross-language emails.

### 🗣️ Voice & Media
*   **🎤 AI Interpreter**: Real-time speech-to-speech translation for having conversations in different languages.
*   **🎥 Video Translator \***: Tools to handle video content translation/subtitling (*beta*).

### 🤖 AI Integration
*   **Native LLM Support**: Integrates with models like **Google Gemini** for context-aware translations and definitions.
*   **Knowledge Base**: Save and organize important translations and terminology.

### 🛡️ Enterprise Ready
*   **License Management**: Secure activation system with hardware binding.
*   **History & Logging**: Keep track of your past translations.

---

## 🛠️ Installation

### Prerequisites
*   Windows 10/11
*   Python 3.10 or higher
*   [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist) (likely required for some dependencies)

### Setup
1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-repo/translator-app.git
    cd TranslatorApp
    ```

2.  **Install Dependencies**:
    Run the provided batch script or install manually via pip.
    ```powershell
    # Option A (Recommended):
    ./install_dependencies.bat

    # Option B (Manual):
    pip install -r requirements.txt
    ```
    *Note: The first run might download offline translation models (approx. 500MB+ depending on languages).*

---

## 🚀 Usage

1.  **Run the Application**:
    ```powershell
    python main.py
    ```
2.  **Activation**:
    *   On first launch, you will be prompted to activate the product.
    *   Enter your **License Key** to proceed.
    *   *(For Developers)*: You can generate keys using `keygen.py`.

3.  **Global Hotkeys**:
    *   Use configured hotkeys (check Settings) to trigger screen translation or bring the app to foreground.

---

## 📦 Building for Distribution

To create a standalone `.exe` file that doesn't require Python to be installed on the target machine:

1.  Run the build script:
    ```powershell
    ./build_exe.bat
    ```
    *OR*
    ```powershell
    pyinstaller TranslatorApp.spec
    ```

2.  The output executable will be located in the `dist/` folder.

---

## 🔧 Technology Stack

*   **GUI**: PySide6 (Qt for Python)
*   **Offline Translation**: Argos Translate
*   **Online Translation**: Deep-Translator, Google-GenerativeAI
*   **OCR**: Tesseract / Pillow
*   **Docs**: PyPDF, Python-Docx, OpenPyXL
*   **Audio**: SpeechRecognition, PyAudio, Pyttsx3

---

## 🔒 License

Copyright © 2026 SajjadTech. All Rights Reserved.
Unauthorized copying, modification, distribution, or use of this software is strictly prohibited.
