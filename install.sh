#!/usr/bin/env bash
# ==============================================================================
# Install Study Note Generator (Caveman + Bangla) for Antigravity or Claude
# ==============================================================================

set -e

TARGET="${1:-both}"
WORKSPACE=false

if [ "$2" == "--workspace" ] || [ "$1" == "--workspace" ]; then
    WORKSPACE=true
    if [ "$1" == "--workspace" ]; then
        TARGET="both"
    fi
fi

echo "=========================================================="
echo " Study Note Generator (Caveman + Bangla) Installer"
echo "=========================================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Prerequisites check
echo ""
echo "[1/3] Checking system prerequisites..."

# XeLaTeX
if command -v xelatex >/dev/null 2>&1; then
    echo "  [OK] XeLaTeX found: $(command -v xelatex)"
else
    echo "  [WARNING] xelatex not found. Install texlive-xetex (e.g., sudo apt install texlive-xetex texlive-lang-indic)"
fi

# Python & PyMuPDF
if command -v python3 >/dev/null 2>&1; then
    echo "  [OK] Python 3 found: $(command -v python3)"
    if python3 -c "import pymupdf" >/dev/null 2>&1; then
        echo "  [OK] PyMuPDF (fitz) is installed."
    else
        echo "  [INFO] Installing pymupdf..."
        pip install pymupdf || pip3 install pymupdf || true
    fi
else
    echo "  [WARNING] Python 3 not found. PDF verification script will not run."
fi

# Fonts check (FreeSerif, Noto Serif Bengali, etc.)
if fc-list : family | grep -qi "FreeSerif\|Bengali"; then
    echo "  [OK] Bengali fonts detected."
else
    echo "  [INFO] Ensure a Bengali font is installed (e.g., fonts-freefont-ttf or fonts-beng)."
fi

# 2. Installation targets
echo ""
echo "[2/3] Installing files..."

FILES=("SKILL.md" "assets" "references" "scripts")

# Install to Antigravity
if [ "$TARGET" == "antigravity" ] || [ "$TARGET" == "both" ]; then
    if [ "$WORKSPACE" = true ]; then
        AGY_DEST="$(pwd)/.gemini/skills/studynotegeneratorcaveman"
    else
        AGY_DEST="$HOME/.gemini/config/skills/studynotegeneratorcaveman"
    fi

    echo "  -> Installing to Antigravity at: $AGY_DEST"
    mkdir -p "$AGY_DEST"
    for item in "${FILES[@]}"; do
        if [ -e "$SCRIPT_DIR/$item" ]; then
            cp -rf "$SCRIPT_DIR/$item" "$AGY_DEST/"
        fi
    done
    echo "  [SUCCESS] Installed to Antigravity!"
fi

# Install to Claude
if [ "$TARGET" == "claude" ] || [ "$TARGET" == "both" ]; then
    if [ "$WORKSPACE" = true ]; then
        CLAUDE_DEST="$(pwd)/.claude/skills/studynotegeneratorcaveman"
    else
        CLAUDE_DEST="$HOME/.claude/skills/studynotegeneratorcaveman"
    fi

    echo "  -> Installing to Claude at: $CLAUDE_DEST"
    mkdir -p "$CLAUDE_DEST"
    for item in "${FILES[@]}"; do
        if [ -e "$SCRIPT_DIR/$item" ]; then
            cp -rf "$SCRIPT_DIR/$item" "$CLAUDE_DEST/"
        fi
    done
    echo "  [SUCCESS] Installed to Claude!"
fi

echo ""
echo "[3/3] Ready to use!"
echo "----------------------------------------------------------"
echo "In Antigravity:"
echo "  Type: /studynotegeneratorcaveman [your request or notes]"
echo "In Claude Code / Desktop:"
echo "  Instruct Claude: 'Use the studynotegeneratorcaveman skill to generate my notes.'"
echo "----------------------------------------------------------"
