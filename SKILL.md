---
name: studynotegeneratorcaveman
description: >-
  Generate a polished, exam-ready bilingual (English + Bengali) STUDY NOTE as a
  PDF from source material — handwritten lecture notes, scanned textbook pages, a
  syllabus, slides, or just a topic/chapter name — keeping the source's own flow.
  The format layers rigorous English theory (exam-ready) with Bengali intuition
  boxes, short "caveman" memory-hook boxes, colored Key-Equation and Exam-hint
  boxes, exact matching TikZ diagrams, and fully worked step-by-step numeric examples.
  Includes a page-by-page intermediate markdown extraction protocol, rigorous diagram
  fidelity verification, 6-red-star exam suggestion stamping, and the Claude Opus 5.5
  self-verification and visual inspection engine.
---

# Study Note Generator — Caveman + Bangla (Opus 5.5 Edition)

This skill produces a **bilingual (English + Bengali) study-note PDF** engineered for **flawless exam preparation**. The output balances three core requirements:
1. **100% Information Retention:** Zero dropped topics, equations, margin notes, or solved examples from the source material.
2. **Bilingual Dual-Brain Layering:** Rigorous English theory for writing in the exam hall, paired with warm Bengali intuition boxes and ultra-concise "caveman" memory hooks for instant recall.
3. **Claude Opus 5.5 Verification Rigor:** You are not done when LaTeX compiles without error; you are done when you have rasterized and visually inspected **every single page**, verified diagram accuracy against the source, eliminated layout clipping, and audited coverage against teacher suggestions.

---

## 0. The Core Workflow Loop

$$\text{Extract (Page-by-Page .md)} \longrightarrow \text{Understand \& Calibrate} \longrightarrow \text{Build \& Match Diagrams} \longrightarrow \text{Compile} \longrightarrow \text{Visual Verification Loop} \longrightarrow \text{Report}$$

---

## 1. Page-by-Page Extraction Protocol (Never Miss Any Info)

**Rule: Never attempt to skim or summarize an entire multi-page document in a single pass.** When given multi-page handwritten notes or scanned slides:

1. **Step-by-step decomposition:** Walk through the source **page by page**.
2. **Intermediate Markdown Files:** For every source page, create a dedicated extraction markdown file in an `extracted_notes/` directory:
   - `extracted_notes/page_01.md`
   - `extracted_notes/page_02.md`
   - ... up to `page_N.md`
3. **Mandatory elements to extract per page:**
   - **Section hierarchy:** Exact section numbers, headings, sub-headings.
   - **Mathematical formulas:** Full expressions, definitions of all variables, subscripts, boundary conditions, units.
   - **Margin notes & annotations:** Teacher remarks, arrows, questions (`Q: Why heterojunction?`), side caveats, starred hints (`V.V.I`, `Exam`).
   - **Diagram blueprints:** Detailed descriptions of hand-drawn sketches (axes, labels, energy levels, beam profiles, physical boundaries).
   - **Numerical examples:** Problem statements, input parameters, intermediate algebraic substitutions, final numerical values with units.
4. **Pre-build audit:** Before writing any LaTeX, review the generated page markdown files against the source. Confirm zero omissions.

---

## 2. Deep Comprehension & Scope Calibration

1. **Check all pages repeatedly:** Re-read the notes across all pages to understand the broader physics, module structure, and how earlier derivations feed into later chapters.
2. **Preserve Handwritten Scope vs. Textbook Filler:**
   - **Keep:** Everything the student/teacher wrote in class (all lecture theory, diagrams, derivations, class examples).
   - **Include:** Textbook solved examples, reference tables, or topics explicitly assigned or requested by the teacher.
   - **Do NOT pad:** Avoid inserting dozens of pages of historical textbook background, advanced tensor physics, or unassigned end-of-chapter exercises that were never in the lecture note. The note should be dense, complete, and faithful—not artificially bloated.

---

## 3. Diagram Fidelity Engine (Exact Match to Study Note)

**Rule: Diagrams must match the study note exactly. Check again and again until perfect.**

1. **No generic placeholders:** Never drop in a stock diagram if the student's note contains a specific hand-drawn physical representation.
2. **Exact structural matching:**
   - Energy band diagrams: Replicate exact band bending, Fermi level alignments, bandgap discontinuities ($\Delta E_c, \Delta E_v$), carrier confinement regions, and optical refractive index step profiles ($\Delta n$).
   - Wave & beam optics: Match electric ($\vec{E}$) and magnetic ($\vec{B}$) field orientations, beam waist envelopes ($w_0, w(z)$), Rayleigh range ($z_R$), and divergence angles ($2\theta$).
   - Cavities & resonators: Match mirror reflectivities ($M_1, M_2, R_1, R_2$), standing wave modes ($m\lambda/2$), and optical axes.
   - Energy level systems: Show exact transitions (pump $E_1 \to E_3$, fast non-radiative decay, metastable lifetime, laser output photons $h\nu$).
3. **Iterative Visual Verification Loop:**
   - Write the TikZ code.
   - Render the page to PNG.
   - Open and view the rendered image using `view_file`.
   - Compare directly with the source drawing.
   - Check label placement, arrow directions, and proportions. Fix any collisions or inaccuracies. Repeat until flawless.

---

## 4. The Layered Topic Format

Every topic in the final document follows this layered structure:

1. **Theory (English):** Rigorous, exam-ready prose with proper LaTeX math. Complete physical derivations, boundary conditions, and sign conventions.
2. **সবুজ box — `\begin{banglabox}` (`সহজ বাংলায় — কী ঘটছে?`):**
   - Intuitive, conversational Bengali explaining the physical picture ("ইলেকট্রনকে ধাক্কা দেয় $\to$ পোলারাইজেশন $\to$ আলোর বেগ কমে যায়").
   - Plain language, friendly senior tone. Ends sentences with danda (`।`).
3. **কমলা box — `\begin{cavebox}` (`গুহামানব বলে (Caveman)`):**
   - 1–3 lines max of compressed caveman English.
   - Drop articles, pleasantries, and filler words. Use arrows for causality: `E push electron → polarize → light slow`.
   - Keep technical terms and formulas exact.
4. **নীল box — `\begin{formbox}` (`Key Equation`):**
   - Isolates the core formula(s) to memorize with variable definitions and units.
5. **হলুদ box — `\begin{exambox}` (`Exam-e ashte pare`):**
   - Flags exam traps, typical CT/exam questions, tricky sign conventions, or "why does X happen" conceptual Q&As.
6. **Diagram (TikZ):**
   - Clean, high-fidelity vector diagram mirroring the lecture note figure.
7. **Teal box — `\begin{mathbox}{Problem Title}` (Worked Math Examples):**
   - Step-by-step arithmetic with all units shown.
   - Explains *why* each step is taken and highlights potential exam pitfalls (e.g. converting $\text{eV}$ to Joules via $1.602\times 10^{-19}\text{ J}$, or distinguishing half-angle $\theta$ from full divergence $2\theta$).
   - **Crucial:** All math boxes must be `[enhanced, breakable]` so multi-step solutions flow smoothly across page breaks without overflowing bottom margins.

---

## 5. Teacher Suggestions & 6 Red Stars System ($\bigstar\bigstar\bigstar\bigstar\bigstar\bigstar$)

When the user provides teacher suggestions, exam tips, or a syllabus list:

1. **6 Red Stars Marking:**
   - Stamp **6 red stars** ($\bigstar\bigstar\bigstar\bigstar\bigstar\bigstar$) and a dedicated suggestion badge on every topic, working principle, or math problem flagged in the suggestions.
   - In LaTeX headings: `\section*{\sugstars \quad Topic Name}`
   - In spotlights: `\suggestionspot{Suggestion Title}{Description}`
   - On existing base pages: Draw vector polygon stars with dedicated badge rectangles via PyMuPDF.
2. **Master Suggestion Mapping Table & Gap Analysis (At Document End):**
   - Include a final 2-page appendix at the very end:
     - **Table A:** Mapping of all Core Working Principles & Compulsory chapters (Topic, physical mechanism, location in note, page number).
     - **Table B:** Mapping of all Solved Example Maths & Reference Tables (Example number, key formula, numerical answer, location, page number).
     - **Gap Analysis Box (`\begin{exambox}`):** Explicitly state what was found, what is 100% solved, what was intentionally omitted (e.g. "Exercise math dekha lagbe na"), and what was missing from the user's files (e.g. past year CT/Mid question scripts).

---

## 6. Claude Opus 5.5 Visual Verification Engine

**Never report a document as finished without visual inspection.**

### Automated Layout Probe (`scripts/rasterize_pdf.py`):
Run `python scripts/rasterize_pdf.py <file.pdf> pdf_check 150` on the compiled PDF. It automatically flags:
- `BLANK PAGE`: Any page missing text and images.
- `GARBLED CHARS`: Unicode errors or `\ufffd` replacement characters.
- `TEXT OUTSIDE MARGINS`: Any text block running beyond page dimensions.

### Human-Grade Visual Inspection Loop:
1. **Open and inspect EVERY page PNG** using `view_file`.
2. **Check for the 7 Fatal Layout Flaws:**
   - **Table Overflow:** Ensure table columns use `p{...}` with fixed widths that sum to $\le \text{textwidth}$ (17 cm on A4 with 2 cm margins). Never use unbounded `l` for long prose.
   - **Box Splitting / Overflow:** Verify all `tcolorbox` definitions include `enhanced, breakable`. Non-breakable boxes will overflow the bottom margin into oblivion.
   - **One-Line Orphan Pages:** If an appendix or section spills 1–3 lonely lines onto an extra page, tighten `\arraystretch`, margin geometry (`\newgeometry`), or padding to bring it onto the preceding page.
   - **Math Glyph Tofu:** In XeLaTeX with fontspec, never write `\mathbf{\Delta}` (causes square `□` tofu because Greek capital Delta is not in the text bold font). Write `\Delta` or `\boldsymbol{\Delta}`.
   - **Label Collisions:** Verify TikZ diagram labels have clear breathing room and do not touch lines or borders.
   - **Font Weights:** Verify Bengali conjuncts (ক্ষ, দ্ধ, প্র, ন্দ, ত্র) render authentically without broken glyphs.
3. If ANY issue is detected: fix the root cause in the LaTeX source, recompile twice, re-render, and re-inspect until zero flaws remain.

---

## 7. Technical Preamble & Compilation Rules

- **Engine: `xelatex`** (never `pdflatex` or `lualatex`).
- **Font Setup:** Use `Nirmala UI` on Windows; `FreeSerif` with `AutoFakeBold=2.4` on Linux/sandbox.
- **Compilation Flags:** `xelatex -interaction=nonstopmode -enable-installer file.tex` (run **twice** for TOC and citations).
- **Copy `assets/preamble.tex`:** Always use the skill's drop-in preamble containing the tuned color palette, breakable box definitions, table packages, and `\sugstars`.

---

## 8. Summary Checklist Before Final Delivery

- [ ] Page-by-page extraction completed with intermediate `.md` files; zero source details missed.
- [ ] Read and re-read all pages to calibrate scope; no artificial textbook bloat.
- [ ] Every diagram inspected and confirmed an exact match to the study note drawing.
- [ ] Worked math examples unrolled step-by-step with arithmetic, units, and exam trap warnings.
- [ ] Suggestion topics stamped with 6 red stars ($\bigstar\bigstar\bigstar\bigstar\bigstar\bigstar$).
- [ ] Master Suggestion Mapping Table & Gap Analysis placed at the very end.
- [ ] Compiled twice with XeLaTeX; zero missing font or undefined reference warnings.
- [ ] Automated layout check run with `scripts/rasterize_pdf.py`.
- [ ] Every single page PNG visually viewed and inspected with `view_file`.
- [ ] Final deliverables saved to the requested directory (e.g. Desktop).
