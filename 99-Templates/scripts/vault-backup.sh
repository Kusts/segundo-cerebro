#!/bin/bash
# Vault Backup - Hermes
# Faz backup e push para GitHub

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "💾 VAULT BACKUP - $(date)"
echo "=========================================="
echo ""

# 1. Verificar status Git
echo "📦 Verificando Git..."
if git status --porcelain | grep -q .; then
  echo "  📝 Mudanças detectadas, commitando..."
  
  # Adicionar tudo
  git add -A
  
  # Commit com timestamp
  git commit -m "backup: $(date +'%Y-%m-%d %H:%M')"
  
  # Push
  echo "  📤 Fazendo push..."
  if git push; then
    echo "  ✅ Push concluído!"
  else
    echo "  ❌ Erro no push!"
    exit 1
  fi
else
  echo "  ✅ Nenhuma mudança para commitar"
fi

echo ""
echo "=========================================="
echo "✅ BACKUP COMPLETO - $(date)"
echo "=========================================="
