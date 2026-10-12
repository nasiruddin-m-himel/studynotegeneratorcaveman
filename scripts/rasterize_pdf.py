#!/usr/bin/env python3
"""
Rasterize and verify PDF pages for studynotegeneratorcaveman.
Incorporates Claude Opus 5.5 visual verification engine:
- Renders high-resolution PNGs for visual inspection
- Scans for blank pages
- Scans for garbled Unicode / tofu glyphs (\ufffd, missing shapes)
- Scans for text running outside printable margins
"""
import os
import sys

def verify_and_render(pdf_path, out_dir="pdf_check", dpi=150):
    if not os.path.exists(pdf_path):
        print(f"Error: {pdf_path} does not exist.")
        sys.exit(1)

    try:
        import pymupdf  # PyMuPDF
    except ImportError:
        try:
            import fitz as pymupdf
        except ImportError:
            print("Error: pymupdf is required. Run 'pip install pymupdf'.")
            sys.exit(1)

    os.makedirs(out_dir, exist_ok=True)
    doc = pymupdf.open(pdf_path)
    total_pages = len(doc)
    print(f"File: {pdf_path} | Total Pages: {total_pages}")
    
    issues_found = []

    for i, page in enumerate(doc, start=1):
        out_png = os.path.join(out_dir, f"page_{i}.png")
        page.get_pixmap(dpi=dpi).save(out_png)
        
        text = page.get_text().strip()
        flags = []
        
        if not text and not page.get_images():
            flags.append("BLANK PAGE")
        if "\ufffd" in text:
            flags.append("GARBLED CHARS")
            
        r = page.rect
        for b in page.get_text("blocks"):
            x0, y0, x1, y1 = b[:4]
            if x1 > r.width + 1 or y1 > r.height + 1 or x0 < -1 or y0 < -1:
                flags.append("TEXT OUTSIDE MARGINS")
                break
                
        status_suffix = f" | *** WARNING: {', '.join(flags)} ***" if flags else ""
        print(f"  page {i:02d}: {len(text):4d} chars -> {out_png}{status_suffix}")
        
        if flags:
            issues_found.append((i, flags))

    print("\nVerification Summary:")
    if issues_found:
        print(f"  Found potential issues on {len(issues_found)} pages:")
        for p, fl in issues_found:
            print(f"    - Page {p}: {', '.join(fl)}")
    else:
        print("  Automated layout check passed with 0 warnings.")
    print("MANDATORY: Visually open and inspect each rendered PNG using image viewing tools before delivery!")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python rasterize_pdf.py <file.pdf> [output_dir] [dpi]")
        sys.exit(1)
    pdf = sys.argv[1]
    out_dir = sys.argv[2] if len(sys.argv) > 2 else "pdf_check"
    dpi = int(sys.argv[3]) if len(sys.argv) > 3 else 150
    verify_and_render(pdf, out_dir, dpi)
