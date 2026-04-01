#!/bin/bash
# Session-Consolidator
# Limpa sessões da Inbox e consolida em arquivo único

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "📝 SESSION-CONSOLIDATOR - $(date)"
echo "=========================================="

# ============================================
# CONFIG
# ============================================
ARCHIVE_DIR="00-Inbox/Archive"
mkdir -p "$ARCHIVE_DIR"

# ============================================
# FASE 1: LISTAR SESSÕES
# ============================================
echo ""
echo "📋 [1/4] Listando sessões na Inbox..."

SESSIONS=$(find 00-Inbox -maxdepth 1 -name "session-*.md" 2>/dev/null)
SESSION_COUNT=$(echo "$SESSIONS" | grep -c . || echo 0)

echo "  📄 $SESSION_COUNT sessões encontradas"

if [ $SESSION_COUNT -eq 0 ]; then
    echo "  ✅ Nenhuma sessão para consolidar"
    exit 0
fi

# ============================================
# FASE 2: ANALISAR E EXTRAIR INSIGHTS
# ============================================
echo ""
echo "🧠 [2/4] Analisando sessões..."

> /tmp/session_insights.txt
> /tmp/session_dates.txt
> /tmp/session_topics.txt

for session in $SESSIONS; do
    [ ! -f "$session" ] && continue
    
    # Extrair data
    date=$(grep "^created:" "$session" 2>/dev/null | cut -d' ' -f2 || echo "unknown")
    echo "$date" >> /tmp/session_dates.txt
    
    # Extrair topics (tags)
    topics=$(grep "^tags:" "$session" 2>/dev/null | grep -oP '(?<=\[)[^\]]*' | tr ',' '\n' | tr -d '#' | tr -d ' ')
    echo "$topics" >> /tmp/session_topics.txt
    
    # Extrair primeiros parágrafos
    echo "=== $(basename "$session") ===" >> /tmp/session_insights.txt
    sed '1,/^---$/d' "$session" 2>/dev/null | head -10 >> /tmp/session_insights.txt
    echo "" >> /tmp/session_insights.txt
done

TOPICS=$(cat /tmp/session_topics.txt | tr '\n' ' ' | tr -s ' ')

# ============================================
# FASE 3: CRIAR CONSOLIDADO
# ============================================
echo ""
echo "📦 [3/4] Criando consolidado..."

TODAY=$(date +%Y-%m-%d)
CONSOLIDATED="30-Auto-Doc/Sessions/Consolidated-Sessions-${TODAY}.md"

# Obter range de datas
DATES=$(sort /tmp/session_dates.txt | uniq)
FIRST_DATE=$(echo "$DATES" | head -1)
LAST_DATE=$(echo "$DATES" | tail -1)

cat > "$CONSOLIDATED" << EOF
---
type: consolidated
tags: [sessions, consolidated, $(date +%Y-%m)]
created: $TODAY
description: Sessões consolidadas
---

# 📚 Sessões Consolidadas

> **Período:** $FIRST_DATE a $LAST_DATE
> **Total:** $SESSION_COUNT sessões
> **Gerado:** $(date)

---

## 📅 Datas das Sessões

$(echo "$DATES" | sort -r | uniq -c | awk '{print "- " $2 ": " $1 " sessão(ões)"}')

---

## 🏷️ Tópicos Discutidos

$(echo "$TOPICS" | tr ' ' '\n' | sort | uniq -c | sort -rn | head -15 | awk '{print "- **" $2"**: " $1" vez(es)"}')

---

## 📝 Resumo das Sessões

\`\`\`
$(cat /tmp/session_insights.txt | head -100)
\`\`\`

---

## 🔗 Links para Sessões Originais

$(for session in $SESSIONS; do
    echo "- [[$(basename "$session")]]"
done)

---

## 📋 Action Items Extraídos

\`\`\`tasks
not done
\`\`\`

---

## 🏷️ Tags Consolidadas

#sessions #consolidated #auto-doc #$(date +%Y-%m)

---

*Consolidado por Session-Consolidator em $(date)*
EOF

echo "  ✅ Consolidado criado: $CONSOLIDATED"

# ============================================
# FASE 4: MOVER SESSÕES PARA ARCHIVE
# ============================================
echo ""
echo "📦 [4/4] Arquivando sessões..."

moved=0
for session in $SESSIONS; do
    [ ! -f "$session" ] && continue
    mv "$session" "$ARCHIVE_DIR/"
    echo "  📦 $(basename "$session")"
    moved=$((moved + 1))
done

echo "  → $moved sessões arquivadas"

# Cleanup
rm -f /tmp/session_insights.txt /tmp/session_dates.txt /tmp/session_topics.txt

# Commit
echo ""
echo "📝 Commitando..."

if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "auto-consolidate: $moved sessions archived - $(date +%Y-%m-%d)" 2>/dev/null
    echo "  ✅ Commitado"
fi

echo ""
echo "=========================================="
echo "✅ SESSION-CONSOLIDATOR COMPLETO"
echo "=========================================="
echo "Sessões consolidadas: $moved"
echo "Arquivo: $CONSOLIDATED"
