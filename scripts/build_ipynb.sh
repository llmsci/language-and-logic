#!/bin/bash
# Usage: ./scripts/build_ipynb.sh <path_to_markdown_file>
# Example: ./scripts/build_ipynb.sh bool/bool.md

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_markdown_file>"
    exit 1
fi

INPUT_FILE=$1
BASENAME=$(basename "$INPUT_FILE" .md)
DIRNAME=$(dirname "$INPUT_FILE")
OUTPUT_IPYNB="${DIRNAME}/${BASENAME}.ipynb"

echo "Generating ipynb via Jupytext..."
.venv/bin/jupytext --to ipynb "$INPUT_FILE" -o "$OUTPUT_IPYNB"

echo "Done! Generated $OUTPUT_IPYNB"
