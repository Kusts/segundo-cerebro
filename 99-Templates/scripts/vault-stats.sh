#!/bin/bash
# Vault Stats - Mostra estatísticas do vault
# Uso: ./vault-stats.sh

VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT" || exit 1

echo "=========================================="
echo "📊 ESTATÍSTICAS DO VAULT"
echo "=========================================="
echo ""

# Total de notas
total=$(find . -name "*.md" ! -path "*/.obsidian/*" ! -path "*/_BACKUP*" | wc -l)
echo "📝 Total de notas: $total"

# Por pasta
echo ""
echo "📁 Notas por pasta:"
for dir in 30-Auto-Doc 40-Knowledge 50-Learning 20-Systems 70-Archive 80-MOCS; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -name "*.md" | wc -l)
        echo "   $dir: $count"
    fi
done

# Notas hoje
hoje=$(find . -name "*.md" ! -path "*/.obsidian/*" -mtime -1 | wc -l)
echo ""
echo "📅 Notas modificadas hoje: $hoje"

# Links
links=$(grep -roh '\[\[.*\]\]' --include="*.md" . 2>/dev/null | wc -l)
echo "🔗 Total de links: $links"

# Tags
tags=$(grep -roh '#[[:alnum:]-]*' --include="*.md" . 2>/dev/null | sort -u | wc -l)
echo "🏷️ Tags únicas: $tags"

echo ""
echo "=========================================="
