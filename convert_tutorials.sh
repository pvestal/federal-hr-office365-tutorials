#!/bin/bash

# Convert MD tutorials to multiple formats for SharePoint/Teams
# Usage: ./convert_tutorials.sh

echo "🚀 Converting MD tutorials to SharePoint/Teams formats..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "❌ pandoc is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install -y pandoc texlive-latex-base texlive-fonts-recommended
fi

# Create output directories
mkdir -p pdf docx html

# Convert each .md file
for file in *.md; do
    if [ -f "$file" ]; then
        filename="${file%.md}"
        echo "📄 Converting: $file"
        
        # Convert to PDF
        echo "  → Creating PDF..."
        pandoc "$file" -o "pdf/${filename}.pdf" \
            --pdf-engine=pdflatex \
            -V geometry:margin=1in \
            -V fontsize=11pt \
            -V colorlinks=true \
            2>/dev/null || echo "  ⚠️  PDF conversion failed for $file"
        
        # Convert to DOCX
        echo "  → Creating Word document..."
        pandoc "$file" -o "docx/${filename}.docx" \
            --reference-doc=reference.docx \
            2>/dev/null || pandoc "$file" -o "docx/${filename}.docx"
        
        # Convert to HTML
        echo "  → Creating HTML..."
        pandoc "$file" -o "html/${filename}.html" \
            --standalone \
            --toc \
            --toc-depth=3 \
            --css=style.css \
            --metadata title="${filename//_/ }" \
            2>/dev/null || pandoc "$file" -o "html/${filename}.html" --standalone
    fi
done

echo ""
echo "✅ Conversion complete! Files created in:"
echo "  📁 pdf/    - For SharePoint document libraries"
echo "  📁 docx/   - For Teams file sharing"
echo "  📁 html/   - For SharePoint pages"
echo ""
echo "📤 Next steps:"
echo "  1. Upload PDF files to SharePoint Document Library"
echo "  2. Share DOCX files in Teams Files tab"
echo "  3. Embed HTML files in SharePoint pages"