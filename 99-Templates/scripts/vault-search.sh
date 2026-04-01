#!/bin/bash
# Vault Search - Busca avançada no vault
# Uso: ./vault-search.sh "pattern" [pasta]

VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT" || exit 1

pattern="${1:-}"
folder="${2:-.}"

if [ -z "$pattern" ]; then
    echo "Uso: $0 \"pattern\" [pasta]"
    exit 1
fi

echo "🔍 Buscando: '$pattern' em $folder"
echo ""

# Buscar com contexto
grep -rn --include="*.md" -i "$pattern" "$folder" 2>/dev/null | while IFS=: read -r file line content; do
    # Limpar output
    clean_content=$(echo "$content" | sed 's/^[[:space:]]*//' | cut -c1-100)
    echo "📄 $file:$line"
    echo "   $clean_content..."
    echo ""
done
