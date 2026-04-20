#!/bin/bash
# Usage: ./scripts/build_pdf.sh <path_to_markdown_file>
# Example: ./scripts/build_pdf.sh sets/sets.md

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_markdown_file>"
    exit 1
fi

INPUT_FILE=$1
BASENAME=$(basename "$INPUT_FILE" .md)
DIRNAME=$(dirname "$INPUT_FILE")
TEMP_MD="${DIRNAME}/${BASENAME}_pdf_temp.md"
OUTPUT_PDF="${DIRNAME}/${BASENAME}.pdf"

echo "Preprocessing emojis..."
python3 scripts/build_pdf.py "$INPUT_FILE" "$TEMP_MD"

echo "Converting SVGs to PDF..."
ASSETS_DIR="${DIRNAME}/assets"
if [ -d "$ASSETS_DIR" ]; then
    for svg in "$ASSETS_DIR"/*.svg; do
        [ -f "$svg" ] || continue
        pdf="${svg%.svg}.pdf"
        python3 -c "import cairosvg; cairosvg.svg2pdf(url='$svg', write_to='$pdf')" && echo "  $svg -> $pdf"
    done
    sed -i '' 's/\.svg)/.pdf)/g' "$TEMP_MD"
fi

echo "Generating PDF via Pandoc..."
pandoc "$TEMP_MD" -o "$OUTPUT_PDF" \
    --pdf-engine=xelatex \
    --resource-path="${DIRNAME}" \
    --syntax-highlighting=tango \
    -V geometry:"b5paper,left=1.5cm,right=1.5cm,top=1.5cm,bottom=2cm,footskip=0.8cm" \
    -V colorlinks=true \
    -V mainfont="Palatino" \
    -V fontsize=12pt \
    -V header-includes="\usepackage{amssymb}" \
    --include-in-header="scripts/code_style.tex"

echo "Cleaning up..."
rm "$TEMP_MD"

echo "Done! Generated $OUTPUT_PDF"
