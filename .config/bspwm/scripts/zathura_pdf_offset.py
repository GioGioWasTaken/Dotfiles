import sys
import fitz  # pip install PyMuPDF
import re

pdf_file = sys.argv[1]
doc = fitz.open(pdf_file)

offset = None

for i, page in enumerate(doc):
    # Get only the top text (e.g., first 100 pixels)
    rect = fitz.Rect(0, 0, page.rect.width, 100)
    text = page.get_textbox(rect).strip()

    # Match a page number at the start of the line
    if re.match(r"^\d+\b", text):
        page_number = int(re.match(r"^\d+", text).group())
        offset = i - (page_number - 1)
        print(f"Detected offset: {offset}")
        break

if offset is None:
    print("Could not detect offset automatically")
else:
    print(f"Launch Zathura with: zathura '{pdf_file}'")
