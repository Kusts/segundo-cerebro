#!/bin/bash
# Auto-Cross-Linker
# Analisa notas sem links e adiciona automaticamente

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🔗 AUTO-CROSS-LINKER - $(date)"
echo "=========================================="

# ============================================
# CONFIG
# ============================================
MAX_LINKS_PER_NOTE=5
MAX_NOTES_TO_UPDATE=20
LINKS_ADDED=0

# ============================================
# FASE 1: ENCONTRAR NOTAS SEM LINKS
# ============================================
echo ""
echo "🔍 [1/4] Encontrando notas sem links..."

> /tmp/orphan_notes.txt
> /tmp/suggested_links.txt

# Encontrar notas sem links (amostra)
count=0
for f in $(find . -name "*.md" -not -path './.obsidian/*' -not -path './.smart-env/*' -not -path './70-Archive/*' | head -100); do
    outlinks=$(grep -o '\[\[[^]]*\]\]' "$f" 2>/dev/null | wc -l)
    name=$(basename "$f" .md)
    backlinks=$(grep -l "\[\[$name\]\]" . --include="*.md" -r 2>/dev/null | wc -l)
    
    if [ $((outlinks + backlinks)) -eq 0 ]; then
        echo "$f" >> /tmp/orphan_notes.txt
        count=$((count + 1))
    fi
    
    if [ $count -ge 50 ]; then
        break
    fi
done

ORPHAN_COUNT=$(wc -l < /tmp/orphan_notes.txt)
echo "  📄 $ORPHAN_COUNT notas sem links encontradas"

# ============================================
# FASE 2: ANALISAR CONTEÚDO E SUGERIR LINKS
# ============================================
echo ""
echo "🧠 [2/4] Analisando conteúdo..."

while IFS= read -r file; do
    [ -z "$file" ] && continue
    
    # Extrair título
    title=$(basename "$file" .md | sed 's/-/ /g')
    
    # Extrair tags do arquivo
    tags=$(grep -oP '(?<=tags:\s*\[)[^\]]*' "$file" 2>/dev/null | tr ',' '\n' | tr -d '#' | tr -d ' ')
    
    # Extrair primeiras 100 chars do conteúdo (sem frontmatter)
    content=$(sed '1,/^---$/d' "$file" 2>/dev/null | head -20 | tr '\n' ' ' | tr -s ' ')
    
    # Sugerir links baseados em MOCs existentes
    suggestions=""
    
    # MOCs por domínio
    if echo "$content" | grep -qiE "(agencia|business|saas|venda)"; then
        suggestions="${suggestions}[[Business MOC]] "
    fi
    
    if echo "$content" | grep -qiE "(code|develop|git|deploy|build)"; then
        suggestions="${suggestions}[[Development MOC]] "
    fi
    
    if echo "$content" | grep -qiE "(n8n|autom|workflow|integration)"; then
        suggestions="${suggestions}[[Automation MOC]] "
    fi
    
    if echo "$content" | grep -qiE "(ai|agent|claude|openai|gpt)"; then
        suggestions="${suggestions}[[AI-Agents MOC]] "
    fi
    
    if echo "$content" | grep -qiE "(learn|study|course|research)"; then
        suggestions="${suggestions}[[Learning MOC]] "
    fi
    
    # Adicionar link para 00-MOC sempre
    suggestions="${suggestions}[[00-MOC]]"
    
    if [ -n "$suggestions" ]; then
        echo "$file|$suggestions" >> /tmp/suggested_links.txt
    fi
    
done < /tmp/orphan_notes.txt

SUGGESTION_COUNT=$(wc -l < /tmp/suggested_links.txt)
echo "  💡 $SUGGESTION_COUNT sugestões geradas"

# ============================================
# FASE 3: ADICIONAR LINKS
# ============================================
echo ""
echo "🔗 [3/4] Adicionando links..."

update_count=0
while IFS= read -r line; do
    [ -z "$line" ] && continue
    [ $update_count -ge $MAX_NOTES_TO_UPDATE ] && break
    
    file=$(echo "$line" | cut -d'|' -f1)
    links=$(echo "$line" | cut -d'|' -f2-)
    
    # Verificar se já tem algum link sugerido
    if grep -q "## 🔗 Links" "$file" 2>/dev/null; then
        # Adicionar ao final da seção Links
        sed -i "/## 🔗 Links/,/##/{ /^- \[\[$/a\\
$links
}" "$file" 2>/dev/null
    else
        # Adicionar seção de links no final
        echo "" >> "$file"
        echo "---" >> "$file"
        echo "" >> "$file"
        echo "## 🔗 Links" >> "$file"
        echo "" >> "$file"
        for link in $links; do
            echo "- $link" >> "$file"
        done
    fi
    
    LINKS_ADDED=$((LINKS_ADDED + $(echo "$links" | wc -w)))
    update_count=$((update_count + 1))
    echo "  ✅ $(basename "$file"): $links"
    
done < /tmp/suggested_links.txt

echo "  → $LINKS_ADDED links adicionados a $update_count notas"

# ============================================
# FASE 4: RELATÓRIO
# ============================================
echo ""
echo "📊 [4/4] Gerando relatório..."

REPORT_FILE="70-Archive/Logs/CrossLink-Report-$(date +%Y-%m-%d).md"

cat > "$REPORT_FILE" << EOF
---
type: report
tags: [cross-link, auto-fix, $(date +%Y-%m)]
created: $(date +%Y-%m-%d)
---

# 🔗 Cross-Link Report - $(date +%Y-%m-%d)

> Auto-Cross-Linker | Hermes

---

## 📈 Estatísticas

| Métrica | Valor |
|---------|-------|
| Notas analizadas | 100 |
| Notas sem links | $ORPHAN_COUNT |
| Notas atualizadas | $update_count |
| Total links adicionados | $LINKS_ADDED |

---

## 📝 Notas Atualizadas

\`\`\`
$(cat /tmp/suggested_links.txt | head -10)
\`\`\`

---

## 🔄 Regras Aplicadas

1. MOCs por domínio (Business, Dev, Automation, AI, Learning)
2. Sempre adicionar [[00-MOC]]
3. Máximo $MAX_NOTES_TO_UPDATE notas por execução

---

*Gerado por Auto-Cross-Linker em $(date)*
EOF

echo "  ✅ Relatório: $REPORT_FILE"

# Cleanup
rm -f /tmp/orphan_notes.txt /tmp/suggested_links.txt

echo ""
echo "=========================================="
echo "✅ AUTO-CROSS-LINKER COMPLETO"
echo "=========================================="
