#!/bin/bash
# Tag-Enforcer
# Padroniza tags seguindo o Tag-Schema

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

echo "=========================================="
echo "🏷️ TAG-ENFORCER - $(date)"
echo "=========================================="

# ============================================
# CONFIG - TAG SCHEMA
# ============================================

# Tags proibidas (devem ser removidas)
PROHIBITED_TAGS="note|info|test|temp|tmp|untitled|sem-titulo|draft"

# Mapeamento de tags antigas -> novas
declare -A TAG_MAP=(
    ["agencia"]="agencia"
    ["business"]="business"
    ["dev"]="development"
    ["code"]="code"
    ["coding"]="code"
    ["ai-agent"]="ai-agent"
    ["aiagents"]="ai-agent"
    ["auto-doc"]="auto-doc"
    ["autodoc"]="auto-doc"
    ["hermes"]="hermes"
    ["sae"]="sae"
    ["synkroo"]="synkroo"
    ["openclaw"]="openclaw"
    ["automation"]="automation"
    ["automacao"]="automation"
)

# Tags obrigatórias por tipo
TYPE_TAGS="MOC|dashboard|kanban|canvas|project|reference|knowledge|template|script"

# ============================================
# FASE 1: ANÁLISE
# ============================================
echo ""
echo "🔍 [1/4] Analisando tags..."

> /tmp/tags_analysis.txt
> /tmp/tags_to_fix.txt

#收集所有标签
ALL_TAGS=$(grep -roh '#[[:alnum:]_-]*' . --include="*.md" 2>/dev/null | tr -d '#' | sort | uniq -c | sort -rn)

echo "=== TOP 20 TAGS ===" > /tmp/tags_analysis.txt
echo "$ALL_TAGS" | head -20 >> /tmp/tags_analysis.txt

echo ""
echo "Tags mais usadas:"
echo "$ALL_TAGS" | head -10

# Encontrar tags problemáticas
echo ""
echo "Tags a corrigir:"

echo "$ALL_TAGS" | while read count tag; do
    [ -z "$tag" ] && continue
    
    # Verificar se é proibida
    if echo "$tag" | grep -qiE "($PROHIBITED_TAGS)"; then
        echo "⚠️  $tag (proibida)"
        echo "PROHIBITED:$tag" >> /tmp/tags_to_fix.txt
    fi
    
    # Verificar se tem maiúsculas
    if echo "$tag" | grep -qE '[A-Z]'; then
        echo "🔠 $tag (maiúsculas)"
        echo "UPPERCASE:$tag" >> /tmp/tags_to_fix.txt
    fi
done

FIX_COUNT=$(wc -l < /tmp/tags_to_fix.txt)
echo ""
echo "  → $FIX_COUNT tags para corrigir"

# ============================================
# FASE 2: CORRIGIR FRONTMATTER
# ============================================
echo ""
echo "🔧 [2/4] Corrigindo frontmatter..."

FIXED_FILES=0
PROHIBITED_FIXED=0
UPPERCASE_FIXED=0

# Para cada nota com tags problemáticas
while IFS= read -r line; do
    [ -z "$line" ] && continue
    
    type=$(echo "$line" | cut -d: -f1)
    tag=$(echo "$line" | cut -d: -f2-)
    
    # Encontrar arquivos com essa tag
    if [ "$type" = "PROHIBITED" ]; then
        files=$(grep -rl "#$tag" . --include="*.md" 2>/dev/null | grep -v ".obsidian" | head -10)
        for f in $files; do
            # Remover tag do frontmatter
            sed -i "s/#$tag//g" "$f"
            sed -i "s/,$tag,/,/g" "$f"
            sed -i "s/,$tag//g" "$f"
            sed -i "s/$tag,//g" "$f"
            PROHIBITED_FIXED=$((PROHIBITED_FIXED + 1))
            FIXED_FILES=$((FIXED_FILES + 1))
            echo "  ❌ $tag removida de $(basename "$f")"
        done
    elif [ "$type" = "UPPERCASE" ]; then
        files=$(grep -rl "#$tag" . --include="*.md" 2>/dev/null | grep -v ".obsidian" | head -10)
        for f in $files; do
            # Converter para lowercase
            new_tag=$(echo "$tag" | tr '[:upper:]' '[:lower:]')
            sed -i "s/#$tag/#$new_tag/g" "$f"
            UPPERCASE_FIXED=$((UPPERCASE_FIXED + 1))
            FIXED_FILES=$((FIXED_FILES + 1))
            echo "  🔠 $(basename "$f"): $tag → $new_tag"
        done
    fi
    
done < /tmp/tags_to_fix.txt

echo "  → $FIXED_FILES arquivos corrigidos"

# ============================================
# FASE 3: ADICIONAR TAGS OBRIGATÓRIAS
# ============================================
echo ""
echo "➕ [3/4] Adicionando tags obrigatórias..."

# Para notas sem type tag
echo "Verificando notas sem type tag..."

for f in $(find . -name "*.md" -not -path './.obsidian/*' -not -path './.smart-env/*' -not -path './70-Archive/*' | head -50); do
    # Verificar se tem frontmatter
    if ! head -1 "$f" | grep -q "^---"; then
        continue
    fi
    
    # Verificar se tem type tag
    has_type=$(grep -A5 "^---" "$f" 2>/dev/null | grep -E "^tags:|#type" | grep -ciE "($TYPE_TAGS)")
    
    if [ $has_type -eq 0 ]; then
        # Adicionar type:note se não tem
        if ! grep -q "^type:" "$f"; then
            sed -i "/^---$/a type: note" "$f" 2>/dev/null
            echo "  ✅ $(basename "$f"): added type: note"
        fi
    fi
done

# ============================================
# FASE 4: RELATÓRIO
# ============================================
echo ""
echo "📊 [4/4] Gerando relatório..."

REPORT_FILE="70-Archive/Logs/TagEnforcer-Report-$(date +%Y-%m-%d).md"

cat > "$REPORT_FILE" << EOF
---
type: report
tags: [tag-enforcer, cleanup, $(date +%Y-%m)]
created: $(date +%Y-%m-%d)
---

# 🏷️ Tag-Enforcer Report - $(date +%Y-%m-%d)

> Hermes Tag-Enforcer

---

## 📈 Estatísticas

| Métrica | Valor |
|---------|-------|
| Tags removidas (proibidas) | $PROHIBITED_FIXED |
| Tags convertidas (maiúsculas) | $UPPERCASE_FIXED |
| Total arquivos corrigidos | $FIXED_FILES |

---

## 🏷️ Tags Mais Frequentes (Top 20)

\`\`\`
$(cat /tmp/tags_analysis.txt)
\`\`\`

---

## 🔄 Ações Tomadas

1. ❌ Tags proibidas removidas: $PROHIBITED_FIXED
2. 🔠 Tags em maiúsculas convertidas: $UPPERCASE_FIXED
3. ✅ Tags obrigatórias verificadas

---

## 📋 Tag-Schema Aplicado

\`\`\`
# Tags TYPE:
$MYPE_TAGS

# Tags PROIBIDAS:
$PROHIBITED_TAGS
\`\`\`

---

*Gerado por Tag-Enforcer em $(date)*
EOF

echo "  ✅ Relatório: $REPORT_FILE"

# Cleanup
rm -f /tmp/tags_analysis.txt /tmp/tags_to_fix.txt

echo ""
echo "=========================================="
echo "✅ TAG-ENFORCER COMPLETO"
echo "=========================================="
echo "Tags proibidas removidas: $PROHIBITED_FIXED"
echo "Tags convertidas: $UPPERCASE_FIXED"
echo "Arquivos corrigidos: $FIXED_FILES"
