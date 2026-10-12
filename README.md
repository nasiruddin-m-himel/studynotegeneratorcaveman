# Study Note Generator — Caveman + Bangla (Opus 5.5 Edition)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Engine](https://img.shields.io/badge/LaTeX-XeLaTeX-008080.svg)](https://tug.org/xetex/)
[![Google Antigravity](https://img.shields.io/badge/Google-Antigravity%20Skill-4285F4.svg)](https://deepmind.google)
[![Claude AI](https://img.shields.io/badge/Claude-Code%20%7C%20Opus%205.5-D97706.svg)](https://anthropic.com)
[![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB.svg)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](#requirements)

> **Generate polished, exam-ready bilingual (English + Bengali) LaTeX study notes from handwritten lecture notes, scanned textbooks, slides, or syllabus topics with 100% information retention, high-density memory hooks, exact-match TikZ diagrams, and autonomous visual inspection.**

---

## 📖 Overview & Philosophy

Preparing for competitive university exams or class tests (CTs) requires two distinct mental modes:
1. **Writing in the exam hall:** Rigorous, formal English theory, standard derivations, and precise mathematical notation.
2. **Rapid revision & intuitive retention:** Conversational mother-tongue explanation (Bengali) paired with ultra-compressed "caveman" memory hooks that eliminate fluff and wire causality directly into your brain.

**Study Note Generator (Caveman + Bangla)** is an autonomous AI agent skill built for **Google Antigravity** and **Claude** (Claude Code / Claude Desktop). It bridges this gap by enforcing an uncompromising page-by-page extraction protocol and a dual-brain layered layout.

```
                  ┌───────────────────────────────────────────────┐
                  │          SOURCE MATERIAL (Notes/PDF)          │
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │     1. Page-by-Page Extraction Protocol      │
                  │   Zero dropped formulas, margins, or hints    │
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │    2. Dual-Brain Layering & Caveman Hooks     │
                  │   English Theory + Bangla Intuition + Caveman │
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │    3. TikZ Graphics & Breakable Math Boxes    │
                  │   Exact structural matching & step solutions  │
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │    4. XeLaTeX Compilation (Bilingual Font)    │
                  │   Nirmala UI / FreeSerif with native conjuncts│
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │    5. Claude Opus 5.5 Visual Verification     │
                  │   Rasterize to PNG + Auto margin & flaw check │
                  └───────────────────────┬───────────────────────┘
                                          ▼
                  ┌───────────────────────────────────────────────┐
                  │           PERFECT EXAM-READY PDF NOTE         │
                  └───────────────────────────────────────────────┘
```

---

## ✨ Key Features

### 1. 100% Zero-Loss Extraction Protocol
- Never skims or creates lossy summaries.
- Enforces an intermediate step creating `extracted_notes/page_01.md`, `page_02.md`, etc.
- Captures margin scribbles, teacher remarks (`V.V.I`, `Exam Trap`), boundary conditions, and intermediate algebraic steps.

### 2. Dual-Brain Layered Architecture
Every topic is structured into coordinated learning layers:
- **Formal Theory (English):** Exam-ready definitions, full physical equations, and derivations.
- **Bangla Intuition (`\begin{banglabox}`):** Conversational Bengali explaining *what is actually happening physically* in friendly senior tone.
- **Caveman Hook (`\begin{cavebox}`):** High-density 1–3 line memory hook using causality arrows (`E shake electron → polarize → light slow`).
- **Key Equation (`\begin{formbox}`):** High-visibility blue box isolating formulas to memorize with parameter units.
- **Exam Warning (`\begin{exambox}`):** Highlighted traps, edge cases, and anticipated viva/exam questions.
- **Solved Numeric Examples (`\begin{mathbox}`):** Fully breakable teal boxes unrolling math step-by-step with arithmetic units.

### 3. Exact-Match TikZ Vector Engine
- No low-resolution screenshots or generic stock diagrams.
- Reusable, mathematically precise TikZ snippets for energy bands, Gaussian beam envelopes, cavity resonators, prism dispersion, Snell's law, and TIR.

### 4. 6-Red-Stars Exam Suggestion Stamping ($\bigstar\bigstar\bigstar\bigstar\bigstar\bigstar$)
- Stamped prominently on core topics flagged by teacher suggestions or syllabus priorities.
- Includes a **Master Suggestion Mapping Table & Gap Analysis** appendix at the end of every note.

### 5. Claude Opus 5.5 Visual Inspection Engine
- Never stops at zero compilation errors.
- Runs `scripts/rasterize_pdf.py` to check for:
  - Blank pages
  - Garbled unicode / font tofu (`\ufffd`)
  - Text overflowing print margins
  - Non-breakable boxes spilling over page boundaries
- Instructs the AI agent to visually inspect every rendered PNG page before returning to the user.

---

## 🎨 The Box System

| Box | Environment | Header / Theme | Purpose |
| :--- | :--- | :--- | :--- |
| 🟢 **Green** | `\begin{banglabox}` | `সহজ বাংলায় — কী ঘটছে?` | Bengali intuitive physical explanation |
| 🟠 **Orange** | `\begin{cavebox}` | `গুহামানব বলে (Caveman)` | 1–3 lines ultra-compressed recall hook |
| 🔵 **Blue** | `\begin{formbox}` | `Key Equation` | Formula isolation with unit checklist |
| 🟡 **Yellow** | `\begin{exambox}` | `Exam-e ashte pare` | Traps, typical CT questions, sign conventions |
| 🔷 **Teal** | `\begin{mathbox}{Title}` | `Solved Example X.Y` | Breakable step-by-step numerical derivation |
| 🔴 **Red** | `\suggestionspot{Title}{...}`| `EXAM SUGGESTION` | 6 Red Stars priority badge ($\bigstar\bigstar\bigstar\bigstar\bigstar\bigstar$) |

---

## 💻 Requirements & Prerequisites

### 1. LaTeX Engine: XeLaTeX
XeLaTeX is required to render Unicode Bengali fonts and complex mathematical typography seamlessly.

- **Windows:** Install [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/).
  ```powershell
  # Using winget:
  winget install MiKTeX.MiKTeX
  # or
  winget install IslandOFTeX.TeXLive
  ```
- **Ubuntu / Debian:**
  ```bash
  sudo apt update
  sudo apt install texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-lang-indic
  ```
- **macOS:**
  ```bash
  brew install --cask mactex
  ```

### 2. Bengali Fonts
- **Windows:** Built-in **Nirmala UI** (already included in Windows 10/11) provides authentic Bengali conjunct shaping and bold weights without tofu glyphs.
- **Linux:** Install `fonts-freefont-ttf` or `fonts-beng`:
  ```bash
  sudo apt install fonts-freefont-ttf fonts-beng
  ```
- **macOS:** System fonts or install [Kalpurush](https://www.omicronlab.com/bangla-fonts.html) / [Noto Serif Bengali](https://fonts.google.com/specimen/Noto+Serif+Bengali).

### 3. Python & PDF Verification
Python 3.8+ with `PyMuPDF` is used by the visual inspection engine:
```bash
pip install -r requirements.txt
```

---

## 🚀 Installation

### Option A: 1-Click Automated Installers

#### Windows (PowerShell)
```powershell
# Installs to both Antigravity and Claude
.\install.ps1

# Or target specifically:
.\install.ps1 -Target antigravity
.\install.ps1 -Target claude
.\install.ps1 -Workspace # Install to current workspace folder
```

#### Linux / macOS (Bash)
```bash
chmod +x install.sh
./install.sh

# Or target specifically:
./install.sh antigravity
./install.sh claude
./install.sh both --workspace
```

---

### Option B: Manual Installation

#### 1. Installing to Google Antigravity (AGY)

Antigravity discovers skills in global configuration or within workspace projects:

- **Global Install (Available everywhere):**
  Clone or copy this repository into your user config skills directory:
  ```bash
  # Windows:
  mkdir "%USERPROFILE%\.gemini\config\skills\studynotegeneratorcaveman"
  xcopy /E /I studynotegeneratorcaveman "%USERPROFILE%\.gemini\config\skills\studynotegeneratorcaveman"

  # Linux / macOS:
  mkdir -p ~/.gemini/config/skills/studynotegeneratorcaveman
  cp -r . ~/.gemini/config/skills/studynotegeneratorcaveman/
  ```

- **Workspace Install (Project specific):**
  Place the folder in `.gemini/skills/studynotegeneratorcaveman/` inside your repository.

- **Triggering in Chat:**
  Once installed, trigger the skill anytime using the slash command:
  ```text
  /studynotegeneratorcaveman
  ```
  Or say:
  ```text
  "Create an exam study note from these lecture notes using the caveman bangla generator."
  ```

---

#### 2. Installing to Claude (Claude Code / Desktop)

Claude Code supports custom project skills and system instructions:

- **Claude Code (Global):**
  ```bash
  mkdir -p ~/.claude/skills/studynotegeneratorcaveman
  cp -r . ~/.claude/skills/studynotegeneratorcaveman/
  ```

- **Claude Project Instructions / CLAUDE.md:**
  Add the following snippet to your `CLAUDE.md` or Project Knowledge instructions:
  ```markdown
  ## Study Note Generation Skill
  When generating study notes or exam preparation guides:
  - Adhere strictly to the rules in `SKILL.md` (studynotegeneratorcaveman).
  - Use `assets/preamble.tex` for the XeLaTeX preamble.
  - Employ the bilingual dual-brain structure (English Theory + Bengali Intuition + Caveman Hook).
  - Verify every page visually using `python scripts/rasterize_pdf.py output.pdf`.
  ```

- **Claude Desktop / Web:**
  Upload `SKILL.md`, `assets/preamble.tex`, and `references/structure-example.tex` to your **Project Knowledge**, or paste `SKILL.md` into your Custom Instructions.

---

## 🛠️ Usage Workflow

### Step 1: Provide Input Material
Supply the AI agent with your lecture material:
- Scanned PDF or images of handwritten notebook pages
- Lecture slide deck (PDF/PPTX)
- Course syllabus and teacher suggestion topics
- Or a chapter topic name and specific textbook solved problems

### Step 2: Extraction Protocol
The agent walks page-by-page, creating:
```
extracted_notes/
  page_01.md
  page_02.md
  ...
```

### Step 3: Drafting & LaTeX Compilation
The agent creates `note.tex` following `references/structure-example.tex` and compiles via **XeLaTeX**:
```bash
# Run twice to resolve TOC and cross-references
xelatex -interaction=nonstopmode -enable-installer note.tex
xelatex -interaction=nonstopmode -enable-installer note.tex
```

### Step 4: Verification & Inspection
Run the verification script to rasterize the PDF into high-resolution PNGs and inspect margins:
```bash
python scripts/rasterize_pdf.py note.pdf pdf_check 150
```
The script inspects every page:
```text
File: note.pdf | Total Pages: 6
  page 01: 1824 chars -> pdf_check/page_1.png
  page 02: 1940 chars -> pdf_check/page_2.png
  page 03: 1530 chars -> pdf_check/page_3.png
Verification Summary:
  Automated layout check passed with 0 warnings.
```
The agent opens each PNG to verify diagram placement, ensure no table or box clipping occurred, and audits teacher suggestions.

---

## 📂 Repository Structure

```
studynotegeneratorcaveman/
├── SKILL.md                         # Skill specification & AI prompt rules
├── README.md                        # Complete documentation & usage guide
├── LICENSE                          # MIT License
├── requirements.txt                 # Python dependencies (pymupdf)
├── install.ps1                      # 1-Click installer for Windows (PowerShell)
├── install.sh                       # 1-Click installer for macOS/Linux (Bash)
├── assets/
│   └── preamble.tex                 # Drop-in XeLaTeX preamble (fonts, boxes, colors)
├── references/
│   ├── diagrams.tex                 # Reusable TikZ physics & optics diagrams
│   └── structure-example.tex        # Document boilerplate & sample topic pattern
└── scripts/
    └── rasterize_pdf.py             # Opus 5.5 visual inspection & layout probe
```

---

## ❓ Frequently Asked Questions (FAQ)

### Why XeLaTeX instead of pdflatex?
`pdflatex` does not support complex OpenType Unicode script shaping required for Bengali conjunct characters (যুক্তাক্ষর like ক্ষ, দ্ধ, প্র, ন্দ, ত্র). `xelatex` using `fontspec` connects directly to system OpenType fonts (`Nirmala UI`, `FreeSerif`, `Noto`) and renders authentic conjuncts and bold weights without corrupted glyphs.

### Why do boxes need `[enhanced, breakable]`?
In LaTeX, standard `tcolorbox` elements cannot break across page boundaries by default. If a mathematical derivation or explanation spans longer than the remaining page height, it will overflow into the bottom margin. All boxes in `assets/preamble.tex` include `enhanced, breakable` so they split smoothly across pages.

### How do I avoid Greek letter "Tofu" (`□`) in math mode?
In XeLaTeX with `fontspec`, writing `\mathbf{\Delta}` produces a blank or square box because Greek capital Delta is not in the text bold font. Always use `\Delta` or `\boldsymbol{\Delta}`.

---

## 👤 Author & Contribution

Developed with ❤️ by **[Nasiruddin Mahmud Himel](https://github.com/nasiruddin-m-himel)**.

Contributions, bug reports, and TikZ diagram pull requests are welcome! Feel free to open an issue or submit a pull request.
