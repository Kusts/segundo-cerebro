#!/bin/bash
# Search by Tag - Busca notas por tag
# Uso: ./search-by-tag.sh "#tag"

VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT" || exit 1

tag="${1:-#knowledge}"

echo "🏷️ Buscando notas com tag: $tag"
echo ""

# Remover # se existir
clean_tag=$(echo "$tag" | tr -d '#')

# Buscar no frontmatter e no corpo
results=$(grep -rl "tags:.*$clean_tag" --include="*.md" . 2>/dev/null)

if [ -z "$results" ]; then
    echo "Nenhuma nota encontrada com: $tag"
else
    count=$(echo "$results" | wc -l)
    echo "✅ Encontradas $count nota(s):"
    echo ""
    while IFS= read -r file; do
        title=$(grep -m1 "^# " "$file" | sed 's/^# //')
        echo "📄 $file"
        echo "   Título: $title"
        echo ""
    done <<< "$results"
fi
