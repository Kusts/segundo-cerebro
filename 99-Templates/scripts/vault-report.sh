#!/bin/bash
# Vault Report - Hermes
# Gera relatório de atividade do vault

VAULT_PATH="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"
cd "$VAULT_PATH"

REPORT_FILE="70-Archive/Logs/Vault-Report-$(date +'%Y-%m-%d').md"

echo "📊 Gerando relatório..."
echo ""

# Criar relatório
cat > "$REPORT_FILE" << EOF
---
type: report
tags: [vault, report, $(date +'%Y-%m')]
created: $(date +'%Y-%m-%d')
---

# 📊 Vault Report - $(date +'%Y-%m-%d')

> Relatório automático do Segundo Cérebro

---

## 📈 Estatísticas

| Métrica | Valor |
|---------|-------|
| Total notas | $(find . -name '*.md' -not -path './.obsidian/*' -not -path './.smart-env/*' | wc -l) |
| Total pastas | $(find . -type d -not -path './.obsidian/*' -not -path './.smart-env/*' | wc -l) |
| Plugins | $(ls -1 .obsidian/plugins/ 2>/dev/null | wc -l) |

---

## 🕐 Atividade Recente

\`\`\`dataview
TABLE WITHOUT ID
file.link AS "Nota",
file.mtime AS "Modificado"
FROM ""
WHERE file.mtime > $(date -d '7 days ago' +%Y-%m-%d)
SORT file.mtime DESC
LIMIT 10
\`\`\`

---

## 📅 Notas Criadas Hoje

\`\`\`dataview
TABLE WITHOUT ID
file.link AS "Nota",
file.ctime AS "Criada"
FROM ""
WHERE file.ctime > $(date +%Y-%m-%d)
\`\`\`

---

## 📋 Tarefas Pendentes

\`\`\`tasks
not done
due before tomorrow
limit 10
\`\`\`

---

## 🔗 Notas Recentes Sem Links

\`\`\`dataview
TABLE WITHOUT ID
file.link AS "Nota"
FROM ""
WHERE length(file.outlinks) = 0 AND length(file.inlinks) = 0
SORT file.ctime DESC
LIMIT 5
\`\`\`

---

*Relatório gerado automaticamente por Hermes*
EOF

echo "✅ Relatório gerado: $REPORT_FILE"
