#!/bin/bash
# Vault Organizer - Hermes
# Organiza automaticamente notas

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🧹 VAULT ORGANIZER - $(date)"
echo "=========================================="
echo ""

# 1. Arquivar notas curtas (<200 bytes)
echo "📝 Arquivando notas curtas..."
ARCHIVE_DIR="70-Archive/Temp-Limpados-$(date +'%Y%m%d')"
mkdir -p "$ARCHIVE_DIR"

short_count=0
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -size -200c 2>/dev/null); do
  # Não arquivar MOCs ou Dashboards
  if [[ ! "$f" == *"MOC"* && ! "$f" == *"Dashboard"* ]]; then
    mv "$f" "$ARCHIVE_DIR/"
    short_count=$((short_count + 1))
    echo "  📦 $(basename $f)"
  fi
done
echo "  → $short_count notas arquivadas"
echo ""

# 2. Remover pastas vazias
echo "📁 Removendo pastas vazias..."
find . -type d -empty -not -path "./.obsidian/*" -not -path "./.smart-env/*" -delete 2>/dev/null
echo "  ✅ Pastas vazias removidas"
echo ""

# 3. Renomear notas sem título
echo "🏷️ Verificando nomes de notas..."
find . -name "Sem*t*tulo*.md" -o -name "Untitled*.md" 2>/dev/null | while read f; do
  echo "  ⚠️  $(basename $f)"
  # Gerar nome baseado em data
  new_name="${ARCHIVE_DIR}/nota-$(date +%Y%m%d-%H%M%S).md"
  mv "$f" "$new_name"
  echo "  → Movida para archive"
done
echo ""

# 4. Verificar duplicatas
echo "🔍 Verificando duplicatas..."
find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" | \
  sed 's/.*\///' | sort | uniq -c | sort -rn | grep -v "^   1 " | head -5 | while read count name; do
  echo "  ⚠️  $name ($count cópias)"
done
echo ""

echo "=========================================="
echo "✅ ORGANIZAÇÃO COMPLETA"
echo "=========================================="
