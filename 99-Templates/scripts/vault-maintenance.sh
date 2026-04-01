#!/bin/bash
# Vault Maintenance - Hermes
# Backup + Organização + Padronização + Relatório

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

LOG_FILE="70-Archive/Logs/Maintenance-$(date +'%Y-%m-%d').log"
REPORT_FILE="70-Archive/Logs/Maintenance-Report-$(date +'%Y-%m-%d').md"

echo "=========================================="
echo "🔧 VAULT MAINTENANCE - $(date)"
echo "=========================================="

# ============================================
# FASE 1: BACKUP
# ============================================
echo ""
echo "📦 [1/5] Fazendo backup..."

if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "auto-backup: $(date +'%Y-%m-%d %H:%M')"
    if git push 2>/dev/null; then
        echo "  ✅ Backup concluído e pushado!"
    else
        echo "  ⚠️  Backup local (push falhou)"
    fi
else
    echo "  ✅ Nenhuma mudança para commitar"
fi

# ============================================
# FASE 2: ANÁLISE DE NOVOS ARQUIVOS
# ============================================
echo ""
echo "🔍 [2/5] Analisando novos arquivos..."

NEW_FILES=$(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -newer ~/.hermes/last-maintenance 2>/dev/null)
NEW_COUNT=$(echo "$NEW_FILES" | grep -c . || echo 0)
echo "  📄 $NEW_COUNT novos arquivos encontrados"

# ============================================
# FASE 3: PADRONIZAÇÃO
# ============================================
echo ""
echo "📋 [3/5] Verificando padrões..."

STANDARDIZED=0
for f in $NEW_FILES; do
    # Pular se não for .md
    [[ "$f" != *.md ]] && continue
    
    # Verificar se tem frontmatter
    if ! head -1 "$f" | grep -q "^---"; then
        echo "  📝 $(basename $f) - precisa frontmatter"
        
        # Adicionar frontmatter básico se a nota tiver conteúdo
        CONTENT=$(cat "$f")
        if [ -n "$CONTENT" ]; then
            # Gerar frontmatter
            TITLE=$(basename "$f" .md | sed 's/-/ /g' | sed 's/\b\(.\)/\U\1/g')
            DATE=$(date +'%Y-%m-%d')
            
            cat > "$f" << EOF
---
created: $DATE
tags: []
type: note
---

$CONTENT
EOF
            STANDARDIZED=$((STANDARDIZED + 1))
            echo "    ✅ Padronizado"
        fi
    fi
done

if [ $STANDARDIZED -gt 0 ]; then
    echo "  → $STANDARDIZED arquivos padronizados"
fi

# ============================================
# FASE 4: ORGANIZAÇÃO
# ============================================
echo ""
echo "🧹 [4/5] Organizando..."

# Arquivar notas muito curtas (<150 bytes - excluindo MOCs/Dashboards)
SHORT_COUNT=0
for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -size -150c 2>/dev/null); do
    if [[ ! "$f" == *"MOC"* && ! "$f" == *"Dashboard"* && ! "$f" == *"Kanban"* && ! "$f" == *"00-MOC"* ]]; then
        ARCHIVE_DIR="70-Archive/Temp-Limpados-$(date +'%Y%m%d')"
        mkdir -p "$ARCHIVE_DIR"
        mv "$f" "$ARCHIVE_DIR/"
        SHORT_COUNT=$((SHORT_COUNT + 1))
    fi
done

# Remover pastas vazias
EMPTY_DIRS=$(find . -type d -empty -not -path "./.obsidian/*" -not -path "./.smart-env/*" 2>/dev/null | wc -l)
find . -type d -empty -not -path "./.obsidian/*" -not -path "./.smart-env/*" -delete 2>/dev/null

echo "  → $SHORT_COUNT notas curtas arquivadas"
echo "  → $EMPTY_DIRS pastas vazias removidas"

# ============================================
# FASE 5: RELATÓRIO
# ============================================
echo ""
echo "📊 [5/5] Gerando relatório..."

cat > "$REPORT_FILE" << EOF
---
type: report
tags: [maintenance, vault, $(date +'%Y-%m')]
created: $(date +'%Y-%m-%d')
---

# 🔧 Maintenance Report - $(date +'%Y-%m-%d')

> Executado automaticamente por Hermes

---

## 📈 Estatísticas

| Métrica | Valor |
|---------|-------|
| Novos arquivos | $NEW_COUNT |
| Padronizados | $STANDARDIZED |
| Arquivados | $SHORT_COUNT |
| Pastas vazias | $EMPTY_DIRS |

---

## 🕐 Timestamp

\`\`\`
$(date)
\`\`\`

---

## 📋 Ações Tomadas

1. ✅ Backup Git executado
2. ✅ Novos arquivos analisados
3. ✅ Frontmatter verificado/adicionado
4. ✅ Notas curtas arquivadas
5. ✅ Pastas vazias removidas

---

## 📝 Novos Arquivos

EOF

for f in $NEW_FILES; do
    echo "- \`$f\`" >> "$REPORT_FILE"
done

echo "" >> "$REPORT_FILE"
echo "\`\`\`" >> "$REPORT_FILE"

# Atualizar timestamp da última manutenção
date > ~/.hermes/last-maintenance

# ============================================
# COMMITS
# ============================================
echo ""
echo "📦 Commitando mudanças..."

if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "auto-maintenance: $(date +'%Y-%m-%d %H:%M')" 2>/dev/null
    if git push 2>/dev/null; then
        echo "  ✅ Mudanças pushadas!"
    else
        echo "  ⚠️  Mudanças commitadas localmente"
    fi
else
    echo "  ✅ Nenhuma mudança"
fi

echo ""
echo "=========================================="
echo "✅ MANUTENÇÃO COMPLETA - $(date)"
echo "=========================================="
echo "📄 Relatório: $REPORT_FILE"
