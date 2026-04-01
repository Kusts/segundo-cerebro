#!/bin/bash
# Broken Links Checker - Encontra links quebrados
# Uso: ./broken-links.sh

VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT" || exit 1

echo "🔍 Verificando links quebrados..."
echo ""

# Criar lista de arquivos existentes
> /tmp/existing_files.txt
find . -name "*.md" ! -path "*/.obsidian/*" ! -path "*/_BACKUP*" -printf "%f\n" | sort -u > /tmp/existing_files.txt

broken=0
total=0

# Verificar cada nota
while IFS= read -r note; do
    # Extrair links [[...]]
    links=$(grep -oh '\[\[[^]]*\]\]' "$note" 2>/dev/null)
    
    while IFS= read -r link; do
        total=$((total + 1))
        # Limpar link
        clean=$(echo "$link" | sed 's/\[\[//' | sed 's/\]\]//' | cut -d'|' -f1 | xargs)
        filename=$(basename "$clean" .md)
        
        # Verificar se existe
        if ! grep -qx "$filename.md" /tmp/existing_files.txt && ! grep -qx "$filename" /tmp/existing_files.txt; then
            # Também verificar se é pasta
            dir=$(dirname "$clean")
            if [ ! -d "$dir" ]; then
                echo "❌ $note: $link"
                broken=$((broken + 1))
            fi
        fi
    done <<< "$links"
done < <(find . -name "*.md" ! -path "*/.obsidian/*" ! -path "*/_BACKUP*" -type f)

echo ""
echo "=========================================="
echo "📊 Resultado: $broken links quebrados de $total total"
echo "=========================================="

rm -f /tmp/existing_files.txt
