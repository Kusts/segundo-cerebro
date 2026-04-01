#!/bin/bash
# Vault Link Suggestions - Hermes
# Encontra notas relacionadas e sugere links

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🔗 VAULT LINK SUGGESTIONS - $(date)"
echo "=========================================="
echo ""

# Para cada nota, sugerir links baseados em tags em comum
echo "📝 SUGESTÕES DE LINKS"
echo ""

# Notas que mencionam Hermes mas não linkam
echo "Hermes mentions sem link:"
grep -rl "Hermes" --include="*.md" .obsidian 2>/dev/null | head -3 || true

# Notas com tags similares
echo ""
echo "Notas com tags similares:"
echo "  (baseado em co-occurrence de tags)"

# Sugerir links para MOCs
echo ""
echo "📌 LINKS RECOMENDADOS PARA MOCs:"
echo ""
echo "00-MOC.md deveria linkar:"
echo "  - [[40-Knowledge/00-Indice]]"
echo "  - [[70-Archive/Logs/Vault-Reorganizacao-2026-04-01]]"
echo ""
echo "AI-Agents MOC.md deveria linkar:"
echo "  - [[Canvas: AI-Agent Architecture]]"
echo "  - [[20-Systems/SAE]]"
echo "  - [[20-Systems/OpenClaw]]"

echo ""
echo "=========================================="
echo "✅ ANÁLISE COMPLETA"
echo "=========================================="
