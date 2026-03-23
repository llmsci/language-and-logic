import sys

def build_pdf_friendly_md(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        text = f.read()
        
    replacements = {
        '✅': '$\\checkmark$',
        '❌': '$\\times$',
        '✗': '$\\times$',
        '→': '$\\rightarrow$',
        '💡': '**Tip:** '
    }
    
    for old, new in replacements.items():
        text = text.replace(old, new)
        
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(text)

if __name__ == "__main__":
    build_pdf_friendly_md(sys.argv[1], sys.argv[2])
