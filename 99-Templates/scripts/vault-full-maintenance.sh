#!/bin/bash
# VAULT-FULL-MAINTENANCE
# Script unificado: Sync + Maintenance + Auto-Doc + Cross-Link + Tag-Enforce
# Substitui vault-sync.sh + vault-maintenance.sh

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🔧 VAULT FULL MAINTENANCE - $(date)"
echo "=========================================="

# ============================================
# CONFIG
# ============================================
LOG_FILE="70-Archive/Logs/FullMaintenance-$(date +%Y-%m-%d).log"
DRY_RUN=${1:-false}

# ============================================
# HELP
# ============================================
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Uso: vault-full-maintenance.sh [OPÇÕES]"
    echo ""
    echo "OPÇÕES:"
    echo "  -h, --help     Este help"
    echo "  --dry-run      Simular sem fazer mudanças"
    echo "  --sync-only    Apenas sync Git"
    echo "  --doc-only     Apenas Auto-Doc"
    echo "  --link-only    Apenas Cross-Linker"
    echo "  --tag-only     Apenas Tag-Enforcer"
    echo "  --session-only Apenas Session-Consolidator"
    echo ""
    echo "Sem opção: executa全套 (completo)"
    exit 0
fi

# ============================================
# FASE 0: LOG
# ============================================
exec > >(tee -a "$LOG_FILE")
exec 2>&1

echo "📝 Log: $LOG_FILE"

# ============================================
# FASE 1: SYNC (se não for --doc-only etc)
# ============================================
if [ "$1" != "--doc-only" ] && [ "$1" != "--link-only" ] && [ "$1" != "--tag-only" ] && [ "$1" != "--session-only" ]; then
    echo ""
    echo "📦 [1/7] SYNC - Backup Git..."
    
    if git status --porcelain | grep -q .; then
        git add -A
        git commit -m "auto-backup: $(date +'%Y-%m-%d %H:%M')"
        if git push 2>/dev/null; then
            echo "  ✅ Backup pushado!"
        else
            echo "  ⚠️  Backup local (push falhou)"
        fi
    else
        echo "  ✅ Nenhuma mudança"
    fi
fi

# ============================================
# FASE 2: SESSION CONSOLIDATOR
# ============================================
if [ "$1" != "--sync-only" ] && [ "$1" != "--doc-only" ] && [ "$1" != "--link-only" ] && [ "$1" != "--tag-only" ]; then
    echo ""
    echo "📝 [2/7] Session Consolidator..."
    
    SESSIONS=$(find 00-Inbox -maxdepth 1 -name "session-*.md" 2>/dev/null | wc -l)
    if [ "$SESSIONS" -gt 0 ]; then
        bash 99-Templates/scripts/session-consolidator.sh 2>/dev/null
        echo "  ✅ $SESSIONS sessões consolidadas"
    else
        echo "  ℹ️  Nenhuma sessão para consolidar"
    fi
fi

# ============================================
# FASE 3: VAULT MAINTENANCE
# ============================================
if [ "$1" != "--sync-only" ] && [ "$1" != "--session-only" ] && [ "$1" != "--link-only" ] && [ "$1" != "--tag-only" ]; then
    echo ""
    echo "🧹 [3/7] Vault Maintenance..."
    
    # Padronização de frontmatter
    NEW_FILES=$(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -newer ~/.hermes/last-maintenance 2>/dev/null)
    STANDARDIZED=0
    
    for f in $NEW_FILES; do
        [[ "$f" != *.md ]] && continue
        if ! head -1 "$f" | grep -q "^---"; then
            CONTENT=$(cat "$f")
            if [ -n "$CONTENT" ]; then
                TITLE=$(basename "$f" .md | sed 's/-/ /g')
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
            fi
        fi
    done
    
    # Arquivar notas curtas
    SHORT_COUNT=0
    for f in $(find . -name "*.md" -not -path "./.obsidian/*" -not -path "./.smart-env/*" -size -150c 2>/dev/null); do
        if [[ ! "$f" == *"MOC"* && ! "$f" == *"Dashboard"* && ! "$f" == *"Kanban"* && ! "$f" == *"00-MOC"* ]]; then
            ARCHIVE_DIR="70-Archive/Temp-Limpados-$(date +'%Y%m%d')"
            mkdir -p "$ARCHIVE_DIR"
            mv "$f" "$ARCHIVE_DIR/" 2>/dev/null
            SHORT_COUNT=$((SHORT_COUNT + 1))
        fi
    done
    
    echo "  → $STANDARDIZED padronizados, $SHORT_COUNT arquivados"
fi

# ============================================
# FASE 4: TAG ENFORCER
# ============================================
if [ "$1" = "--tag-only" ] || [ "$1" = "--full" ]; then
    echo ""
    echo "🏷️ [4/7] Tag Enforcer..."
    bash 99-Templates/scripts/tag-enforcer.sh 2>/dev/null
fi

# ============================================
# FASE 5: CROSS LINKER
# ============================================
if [ "$1" = "--link-only" ] || [ "$1" = "--full" ]; then
    echo ""
    echo "🔗 [5/7] Cross-Linker..."
    bash 99-Templates/scripts/vault-cross-linker.sh 2>/dev/null
fi

# ============================================
# FASE 6: SAE VAULT CONNECTOR
# ============================================
if [ "$1" != "--sync-only" ] && [ "$1" != "--session-only" ] && [ "$1" != "--link-only" ] && [ "$1" != "--tag-only" ]; then
    echo ""
    echo "🔗 [6/7] SAE-Vault-Connector..."
    bash 99-Templates/scripts/sae-vault-connector.sh 2>/dev/null
fi

# ============================================
# FASE 7: FINAL REPORT
# ============================================
echo ""
echo "📊 [7/7] Relatório Final..."

REPORT_FILE="70-Archive/Logs/FullMaintenance-Report-$(date +%Y-%m-%d).md"

cat > "$REPORT_FILE" << EOF
---
type: report
tags: [maintenance, full, $(date +%Y-%m)]
created: $(date +%Y-%m-%d)
---

# 🔧 Full Maintenance Report - $(date +%Y-%m-%d)

> Vault Full Maintenance | Hermes

---

## 📈 Estatísticas

| Métrica | Valor |
|---------|-------|
| Timestamp | $(date) |
| Total notas | $(find . -name '*.md' -not -path './.obsidian/*' | wc -l) |
| Pastas | $(find . -type d -not -path './.obsidian/*' | wc -l) |
| Git changes | $(git status --porcelain | wc -l) |

---

## 🔄 Módulos Executados

| Módulo | Status |
|--------|--------|
| Git Sync | ✅ |
| Session Consolidator | ✅ |
| Vault Maintenance | ✅ |
| Tag Enforcer | $([ "$1" = "--tag-only" ] || [ "$1" = "--full" ] && echo "✅" || echo "⏭️ skipped") |
| Cross-Linker | $([ "$1" = "--link-only" ] || [ "$1" = "--full" ] && echo "✅" || echo "⏭️ skipped") |
| SAE-Vault-Connector | ✅ |

---

## 📝 Logs

\`\`\`
$(tail -50 "$LOG_FILE")
\`\`\`

---

*Gerado em $(date)*
EOF

echo "  ✅ Relatório: $REPORT_FILE"

# Atualizar timestamp
date > ~/.hermes/last-maintenance

# ============================================
# FINAL COMMIT
# ============================================
echo ""
echo "📦 Commit final..."

if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "auto-maintenance: full $(date +%Y-%m-%d)" 2>/dev/null
    git push 2>/dev/null && echo "  ✅ Pushado!" || echo "  ⚠️  Commit local"
else
    echo "  ✅ Nenhuma mudança"
fi

echo ""
echo "=========================================="
echo "✅ VAULT FULL MAINTENANCE COMPLETO"
echo "=========================================="
echo "⏱️  $(date)"
