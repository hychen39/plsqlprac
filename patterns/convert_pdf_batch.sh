# Convert all md files in this directory to pdf files in the pdf directory

# Create the pdf directory if it doesn't exist
mkdir -p pdf

# Convert all md files to pdf
for file in *.md; do
    pandoc "$file" -o "pdf/${file%.md}.pdf" --pdf-engine=xelatex --template=eisvogel.tex --listings
done

# Open the pdf directory
open pdf

