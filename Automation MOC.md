---
type: MOC
tags:
  - MOC
  - automation
  - n8n
  - windmill
description: Mapa de Conhecimento - Automação
created: 2026-04-01
---

# ⚡ Automation MOC

> Domínio de Automação - Workflows, n8n, Windmill, integrações

---

## 🛠️ Plataformas de Automação

### n8n
- [[N8N Workflows]] - Workflows criados
- [[N8N Templates]] - Templates prontos
- [[N8N Nodes]] - Nodes personalizados
- [[N8N Error Handling]] - Tratamento de erros

### Windmill
- [[Windmill Setup]] - Configuração
- [[Windmill Scripts]] - Scripts
- [[Windmill Flows]] - Flows
- [[Windmill Apps]] - Apps internos

---

## 🔄 Workflows Principais

```dataview
TABLE file.ctime as "Criado", status as "Status"
FROM "30-Auto-Doc/Automation"
WHERE type != "folder"
SORT file.mtime DESC
LIMIT 15
```

---

## 📡 Integrações

| Plataforma | Status | Docs |
|-----------|--------|------|
| WhatsApp | 🟢 Ativo | [[WhatsApp Integration]] |
| Telegram | 🟢 Ativo | [[Telegram Bot]] |
| Google Drive | 🟢 Ativo | [[Google Drive API]] |
| Discord | 🟡 Em dev | [[Discord Integration]] |

---

## 🧩 Scripts & Ferramentas

| Script | Descrição |
|--------|--------|
| [[Chrome Browser Automation]] | Automação via Chrome DevTools |
| [[Web Scraping Scripts]] | Extração de dados |
| [[Stack-Tecnico]] | Stack técnico (n8n, Windmill, Typebot) |

## 🔗 Stack Técnico (Automação)

```dataview
TABLE file.link AS "Stack", file.mtime AS "Atualizado"
FROM ""
WHERE contains(file.name, "Stack-Tecnico")
```

---

## 🔗 Links

- [[00-MOC]] - Mapa raiz
- [[Development MOC]] - Desenvolvimento
- [[Business MOC]] - Business

---

## 📊 Métricas

```dataview
LIST count()
FROM "30-Auto-Doc/Automation"
WHERE type != "folder"
```
