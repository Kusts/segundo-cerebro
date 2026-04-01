#!/bin/bash
# Análise completa do vault para eu processar
VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT"

echo "=== VAULT ANALYSIS ==="
echo ""

echo "📊 ESTATÍSTICAS GERAIS"
echo "Total notas: $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" | wc -l)"
echo "Total pastas: $(find . -type d -not -path "./.obsidian/*" -not -path "./.smart-env/*" | wc -l)"
echo ""

echo "📁 NOTAS POR PASTA"
find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -printf '%h\n' | sort | uniq -c | sort -rn | head -15
echo ""

echo "🏷️ TAGS MAIS USADAS"
grep -roh '#[[:alnum:]_-]*' . --include="*.md" | grep -v "#[[:alnum:]_-]*#" | sort | uniq -c | sort -rn | head -20
echo ""

echo "🔗 NOTAS COM MAIS LINKS SAÍDAS"
for f in $(find . -name "*.md" -not -path "./.obsidian/*" | head -20); do
  links=$(grep -o '\[\[[^]]*\]\]' "$f" | wc -l)
  if [ $links -gt 0 ]; then
    echo "$links $f"
  fi
done | sort -rn | head -10
echo ""

echo "📄 NOTAS SEM LINKS (ÓRFÃS)"
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" | head -50); do
  links=$(grep -o '\[\[[^]]*\]\]' "$f" 2>/dev/null | wc -l)
  backlinks=$(grep -l "\[\[$(basename $f .md)\]\]" . --include="*.md" -r 2>/dev/null | wc -l)
  total=$((links + backlinks))
  if [ $total -eq 0 ]; then
    echo "  ÓRFÃ: $f"
  fi
done | head -20
echo ""

echo "📝 NOTAS MUITO CURTAS (< 100 chars)"
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*"); do
  size=$(wc -c < "$f")
  if [ $size -lt 100 ]; then
    echo "  CURTA ($size bytes): $f"
  fi
done | head -15
echo ""

echo "=== FIM DA ANÁLISE ==="
