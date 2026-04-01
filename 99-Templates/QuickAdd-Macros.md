# QuickAdd Macros - Hermes

> Macros para QuickAdd no Obsidian

---

## 📝 Macro: Nova Tarefa

```
---
created: {{DATE}}
tags: [task]
type: task
status: pending
---

# ✅ {{TITLE}}

> **Criado:** {{DATE}}
> **Prazo:** {{DATE:1 week}}

---

## 📋 Descrição

{{TEXT}}

---

## ✅ Checklist

- [ ]

---

## 🔗 Relacionado

- [[]]

---

## 📅 Lembrete

```tasks
{{DATE}} recall {{DATE:1 week}}
```
