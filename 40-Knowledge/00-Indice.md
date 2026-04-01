---
type: MOC
tags:
  - MOC
  - knowledge
  - 40-Knowledge
description: Índice do 40-Knowledge
created: 2026-04-01
---

# 📚 40-Knowledge - Índice

> Base de conhecimento central | 77 notas organizadas

---

## 📁 Estrutura

```
40-Knowledge/
├── 2026/              # Notas temporais (03/)
├── Aprendizados/      # Aprendizados por categoria
│   ├── AI-Tools/
│   ├── Arquitetura/
│   ├── Codigo/
│   ├── Growth/
│   ├── Marketing/
│   ├── Produtividade/
│   └── Vendas/
├── Architecture/      # Arquiteturas de software
├── Business/          # Business & estratégia
│   ├── Methodology/
│   └── Strategy/
├── Claude-Code/       # Conhecimento Claude Code
├── Consolidados/      # Documentos consolidados
├── Desenvolvimento/    # Desenvolvimento
├── N8N/               # n8n
└── Solutions/         # Soluções (SAE)
```

---

## 🔥 Notas Principais

| Nota | Descrição | Categoria |
|------|-----------|----------|
| [[Synkroo-Overview]] | Projeto SaaS clínicas | Business |
| [[SAE Context Engineering]] | Context engineering SAE | SAE |
| [[SAE Deploy Essentials]] | Deploy guide | SAE |
| [[Claude-Code MOC]] | Guia Claude Code | Development |

---

## 📊 Métricas

```dataview
TABLE WITHOUT ID
file.folder AS "Pasta",
length(rows) AS "Notas"
FROM "40-Knowledge"
WHERE file.extension = "md"
GROUP BY file.folder
SORT length(rows) DESC
```

---

## 🏷️ Tags Mais Frequentes

```dataview
TABLE WITHOUT ID
tag AS "Tag",
length(rows) AS "Usos"
FROM "40-Knowledge"
FLATTEN file.tags AS tag
GROUP BY tag
SORT length(rows) DESC
LIMIT 10
```

---

## 🔗 Relacionado

- [[00-MOC]] - Mapa raiz
- [[Development MOC]]
- [[Business MOC]]
- [[Learning MOC]]
