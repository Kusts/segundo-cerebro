#!/bin/bash
# SAE-Vault-Connector
# Conecta SAE ao vault - documentação automática inteligente

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🔗 SAE-VAULT-CONNECTOR - $(date)"
echo "=========================================="

# ============================================
# FASE 1: CAPTURA DE DECISÕES SAE
# ============================================
echo ""
echo "📋 [1/5] Analisando logs SAE..."

SAE_LOG="$HOME/.hermes/logs/sae-evolve.log"
if [ -f "$SAE_LOG" ]; then
    LAST_RUN=$(tail -100 "$SAE_LOG" 2>/dev/null | grep -E "(GAP|RESOLVED|EVOLVED|metric|decision)" | tail -20)
    if [ -n "$LAST_RUN" ]; then
        echo "  ✅ SAE ativo - decisões detectadas"
    fi
fi

# ============================================
# FASE 2: GERAÇÃO AUTO-DOC
# ============================================
echo ""
echo "📝 [2/5] Gerando Auto-Doc..."

# Criar dirs se não existirem
mkdir -p "30-Auto-Doc/Decisions"
mkdir -p "30-Auto-Doc/Sessions"
mkdir -p "30-Auto-Doc/Metrics"

TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S)

# Auto-Doc: Daily Summary
SUMMARY_FILE="30-Auto-Doc/Reports/Daily-Summary-${TODAY}.md"
mkdir -p "30-Auto-Doc/Reports"

cat > "$SUMMARY_FILE" << EOF
---
type: auto-doc
tags: [auto-doc, daily, summary, $(date +%Y-%m)]
created: $TODAY
description: Resumo diário automático
---

# 📊 Auto-Doc: Resumo Diário - $TODAY

> Gerado automaticamente por Hermes SAE-Vault-Connector

---

## 🕐 Timestamp

\`\`\`
Gerado: $(date)
\`\`\`

---

## 📈 Métricas do Vault

| Métrica | Valor |
|---------|-------|
| Total notas | $(find . -name '*.md' -not -path './.obsidian/*' | wc -l) |
| Notas hoje | $(find . -name "*.md" -not -path './.obsidian/*' -newer ~/.hermes/last-maintenance 2>/dev/null | wc -l) |
| Pastas | $(find . -type d -not -path './.obsidian/*' | wc -l) |
| Git changes | $(git status --porcelain | wc -l) |

---

## 🔄 Atividades Recentes

\`\`\`dataview
TABLE file.link AS "Nota",
file.mtime AS "Modificado"
FROM ""
WHERE file.mtime > "$TODAY"
SORT file.mtime DESC
LIMIT 10
\`\`\`

---

## 📅 Tarefas do Dia

\`\`\`tasks
not done
due $TODAY
\`\`\`

---

## 🔗 Notas Sem Links (Últimas)

\`\`\`dataview
TABLE WITHOUT ID
file.link AS "Nota"
FROM ""
WHERE length(file.outlinks) = 0 AND length(file.inlinks) = 0
SORT file.ctime DESC
LIMIT 5
\`\`\`

---

*Gerado por SAE-Vault-Connector*
EOF

echo "  ✅ Daily Summary gerado: $SUMMARY_FILE"

# ============================================
# FASE 3: SESSION DOC
# ============================================
echo ""
echo "📝 [3/5] Documentando sessão..."

SESSION_FILE="30-Auto-Doc/Sessions/Session-${TIMESTAMP}.md"

cat > "$SESSION_FILE" << EOF
---
type: session-doc
tags: [session, auto-doc, $(date +%Y-%m)]
created: $(date +%Y-%m-%d)
description: Documentação automática de sessão
---

# 📝 Session Doc - $(date +%H:%M)

> Documentação automática | SAE-Vault-Connector

---

## 📋 Resumo

| Item | Valor |
|------|-------|
| Timestamp | $(date) |
| Vault | Segundo Cérebro |
| Git Status | $(git status --porcelain | wc -l) changes |

---

## 🔄 Ações Realizadas

1. SAE-Vault-Connector executado
2. Auto-Doc gerado
3. Métricas atualizadas

---

## 📊 Estado Atual

\`\`\`dataview
TABLE length(rows) AS "Count"
FROM ""
WHERE file.extension = "md"
\`\`\`

---

*Gerado automaticamente por Hermes*
EOF

echo "  ✅ Session Doc gerado: $SESSION_FILE"

# ============================================
# FASE 4: INSIGHTS
# ============================================
echo ""
echo "💡 [4/5] Gerando insights..."

INSIGHTS_FILE="30-Auto-Doc/Insights/Insights-${TODAY}.md"
mkdir -p "30-Auto-Doc/Insights"

# Analisar tags
TOP_TAGS=$(grep -roh '#[[:alnum:]_-]*' . --include="*.md" 2>/dev/null | grep -v "^#type" | sort | uniq -c | sort -rn | head -5 | awk '{print $2}')

cat > "$INSIGHTS_FILE" << EOF
---
type: insights
tags: [insights, daily, $(date +%Y-%m)]
created: $TODAY
description: Insights diários do vault
---

# 💡 Insights - $TODAY

> Gerado automaticamente | SAE-Vault-Connector

---

## 🏷️ Tags Mais Frequentes

| Tag | Usos |
|-----|------|
$(grep -roh '#[[:alnum:]_-]*' . --include="*.md" 2>/dev/null | grep -v "^#type" | sort | uniq -c | sort -rn | head -10 | awk '{print "| `"$2"` | "$1" |"}')

---

## 📊 Saúde do Vault

| Métrica | Valor | Status |
|---------|-------|--------|
| Total notas | $(find . -name '*.md' -not -path './.obsidian/*' | wc -l) | 🟢 |
| Notas sem links | $(find . -name '*.md' -not -path './.obsidian/*' -exec grep -L '\[\[' {} \; 2>/dev/null | wc -l) | 🟡 |
| Git sync | $(git status --porcelain | wc -l) | $([ $(git status --porcelain | wc -l) -eq 0 ] && echo "🟢" || echo "🟡") |

---

## 🎯 Recomendações

1. **Cross-links**: Adicionar links às notas órfãs
2. **Tags**: Padronizar seguindo Tag-Schema
3. **Sessions**: Limpar sessões antigas da Inbox

---

*Gerado por SAE-Vault-Connector em $(date)*
EOF

echo "  ✅ Insights gerados: $INSIGHTS_FILE"

# ============================================
# FASE 5: COMMIT
# ============================================
echo ""
echo "📦 [5/5] Commitando..."

if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "auto-doc: SAE-Vault-Connector $(date +%Y-%m-%d)" 2>/dev/null
    echo "  ✅ Commitado"
else
    echo "  ℹ️  Nenhuma mudança para commitar"
fi

echo ""
echo "=========================================="
echo "✅ SAE-VAULT-CONNECTOR COMPLETO"
echo "=========================================="
