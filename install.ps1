<#
.SYNOPSIS
    Installs Study Note Generator (Caveman + Bangla) for Google Antigravity or Claude.
.DESCRIPTION
    Copies skill files to either Antigravity's global skill directory or Claude's skills directory.
    Verifies system prerequisites (XeLaTeX, Python, PyMuPDF, Bengali Fonts).
.PARAMETER Target
    "antigravity" (default), "claude", or "both"
.PARAMETER Workspace
    If specified, installs to the current workspace instead of global config.
#>
[CmdletBinding()]
param (
    [ValidateSet("antigravity", "claude", "both")]
    [string]$Target = "both",

    [switch]$Workspace
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Study Note Generator (Caveman + Bangla) Installer" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1. Check Prerequisites
Write-Host "`n[1/3] Checking system prerequisites..." -ForegroundColor Yellow

# XeLaTeX
if (Get-Command xelatex -ErrorAction SilentlyContinue) {
    Write-Host "  [OK] XeLaTeX found: $((Get-Command xelatex).Source)" -ForegroundColor Green
} else {
    Write-Host "  [WARNING] xelatex not found in PATH. Install MiKTeX or TeX Live to compile PDFs." -ForegroundColor Red
}

# Python & PyMuPDF
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "  [OK] Python found: $((Get-Command python).Source)" -ForegroundColor Green
    python -c "import pymupdf" 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  [OK] PyMuPDF (fitz) is installed." -ForegroundColor Green
    } else {
        Write-Host "  [INFO] PyMuPDF not found. Installing via 'pip install pymupdf'..." -ForegroundColor Yellow
        pip install pymupdf
    }
} else {
    Write-Host "  [WARNING] Python not found. Automated visual verification will be unavailable." -ForegroundColor Red
}

# Bengali Font
$Nirmala = Test-Path "C:\Windows\Fonts\Nirmala.ttf"
if ($Nirmala) {
    Write-Host "  [OK] Nirmala UI font detected (native Windows Bengali shaping)." -ForegroundColor Green
} else {
    Write-Host "  [INFO] Nirmala UI font not found at standard path. Ensure a Bengali Unicode font is available." -ForegroundColor Yellow
}

# 2. Installation targets
Write-Host "`n[2/3] Installing files..." -ForegroundColor Yellow

$FilesToCopy = @("SKILL.md", "assets", "references", "scripts")

# Install to Antigravity
if ($Target -eq "antigravity" -or $Target -eq "both") {
    if ($Workspace) {
        $AgyDest = Join-Path (Get-Location) ".gemini\skills\studynotegeneratorcaveman"
    } else {
        $AgyDest = Join-Path $HOME ".gemini\config\skills\studynotegeneratorcaveman"
    }

    Write-Host "  -> Installing to Antigravity at: $AgyDest" -ForegroundColor Cyan
    New-Item -ItemType Directory -Path $AgyDest -Force | Out-Null

    foreach ($item in $FilesToCopy) {
        $sourcePath = Join-Path $ScriptDir $item
        if (Test-Path $sourcePath) {
            Copy-Item -Path $sourcePath -Destination $AgyDest -Recurse -Force
        }
    }
    Write-Host "  [SUCCESS] Installed to Antigravity!" -ForegroundColor Green
}

# Install to Claude
if ($Target -eq "claude" -or $Target -eq "both") {
    if ($Workspace) {
        $ClaudeDest = Join-Path (Get-Location) ".claude\skills\studynotegeneratorcaveman"
    } else {
        $ClaudeDest = Join-Path $HOME ".claude\skills\studynotegeneratorcaveman"
    }

    Write-Host "  -> Installing to Claude at: $ClaudeDest" -ForegroundColor Cyan
    New-Item -ItemType Directory -Path $ClaudeDest -Force | Out-Null

    foreach ($item in $FilesToCopy) {
        $sourcePath = Join-Path $ScriptDir $item
        if (Test-Path $sourcePath) {
            Copy-Item -Path $sourcePath -Destination $ClaudeDest -Recurse -Force
        }
    }
    Write-Host "  [SUCCESS] Installed to Claude!" -ForegroundColor Green
}

# 3. Usage hints
Write-Host "`n[3/3] Ready to use!" -ForegroundColor Green
Write-Host "----------------------------------------------------------"
Write-Host "In Antigravity:" -ForegroundColor Cyan
Write-Host "  Type: /studynotegeneratorcaveman [your request or notes]"
Write-Host "In Claude Code / Desktop:" -ForegroundColor Cyan
Write-Host "  Instruct Claude: 'Use the studynotegeneratorcaveman skill to generate my notes.'"
Write-Host "----------------------------------------------------------`n"
