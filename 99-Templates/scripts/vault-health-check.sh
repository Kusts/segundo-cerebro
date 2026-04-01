#!/bin/bash
# Vault Health Check - Hermes
# Verifica saúde do vault e reporta problemas

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🏥 VAULT HEALTH CHECK - $(date)"
echo "=========================================="
echo ""

# 1. Estatísticas básicas
echo "📊 ESTATÍSTICAS"
echo "Total notas: $(find . -name '*.md' -not -path './.obsidian/*' -not -path './.smart-env/*' | wc -l)"
echo "Pastas: $(find . -type d -not -path './.obsidian/*' -not -path './.smart-env/*' | wc -l)"
echo "Plugins: $(ls -1 .obsidian/plugins/ 2>/dev/null | wc -l)"
echo ""

# 2. Notas órfãs (sem links)
echo "🔗 NOTAS ÓRFÃS (sem backlinks)"
orphan_count=0
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" | head -50); do
  backlinks=$(grep -l "\[\[$(basename $f .md)\]\]" . --include="*.md" -r 2>/dev/null | wc -l)
  outlinks=$(grep -o '\[\[[^]]*\]\]' "$f" 2>/dev/null | wc -l)
  if [ $((backlinks + outlinks)) -eq 0 ]; then
    echo "  ⚠️  $(basename $f)"
    orphan_count=$((orphan_count + 1))
  fi
done
echo "Total órfãs: $orphan_count"
echo ""

# 3. Notas muito curtas
echo "📝 NOTAS MUITO CURTAS (<200 bytes)"
short_count=0
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -size -200c 2>/dev/null); do
  echo "  📄 $(basename $f)"
  short_count=$((short_count + 1))
done
echo "Total curtas: $short_count"
echo ""

# 4. Pastas vazias
echo "📁 PASTAS VAZIAS"
find . -type d -empty -not -path "./.obsidian/*" -not -path "./.smart-env/*" 2>/dev/null | while read d; do
  echo "  📂 $d"
done
echo ""

# 5. Status do Git
echo "📦 GIT STATUS"
if git status --porcelain | grep -q .; then
  echo "  ⚠️  Mudanças não commitadas!"
  git status --porcelain | head -5
else
  echo "  ✅ Tudo commitado"
fi
echo ""

# 6. Auto-Doc Stats
echo "📚 AUTO-DOC"
if [ -d "30-Auto-Doc" ]; then
  echo "  AI-Agents: $(ls 30-Auto-Doc/AI-Agents/*.md 2>/dev/null | wc -l) notas"
  echo "  Errors: $(ls 30-Auto-Doc/Errors/*.md 2>/dev/null | wc -l) notas"
  echo "  YouTube: $(ls 30-Auto-Doc/YouTube/*.md 2>/dev/null | wc -l) notas"
fi
echo ""

echo "=========================================="
echo "✅ HEALTH CHECK COMPLETO"
echo "=========================================="
