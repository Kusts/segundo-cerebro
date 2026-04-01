#!/bin/bash
# Quick Note Creator - Cria nota rapida com template
# Uso: ./quick-note.sh "Titulo" "tipo" "conteudo"

VAULT="/mnt/c/Users/walis/OneDrive/Desktop/Segundo_Cerebro"

title="${1:-Nova Nota}"
type="${2:-knowledge}"
content="${3:-}"

date=$(date +%Y-%m-%d)
datetime=$(date +%Y-%m-%dT%H:%M:%S)
filename="$date-$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-').md"

# Selecionar pasta baseado no tipo
case "$type" in
    project)
        folder="$VAULT/10-Projects"
        ;;
    session)
        folder="$VAULT/01-Daily/Sessions/$(date +%Y/%m)"
        ;;
    reference)
        folder="$VAULT/60-Reference"
        ;;
    *)
        folder="$VAULT/40-Knowledge"
        ;;
esac

mkdir -p "$folder"

cat > "$folder/$filename" << EOF
---
created: $datetime
updated: $datetime
tags: [$type]
type: $type
---

# $title

> **Data:** $date
> **Tipo:** $type

---

## Resumo

$content

---

## Conteudo

<!-- Seu conteudo aqui -->

---

## Ligacoes

- [[]]

## Tags

#$type

---
EOF

echo "✅ Nota criada: $folder/$filename"
