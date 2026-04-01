---
type: MOC
tags:
  - MOC
  - business
  - projects
  - saas
description: Mapa de Conhecimento - Business & Projetos
created: 2026-04-01
---

# 💼 Business MOC

> Projetos, Monetização, SaaS e Oportunidades

---

## 🚀 Projetos Ativos

### Synkroo
- **Status:** 🟡 Em desenvolvimento
- **Tipo:** Ecossistema SaaS
- **Docs:** [[Synkroo Overview]]
- **Kanban:** [[Kanban: Synkroo]]

### Hermes Agency
- **Status:** 🟢 Operacional
- **Tipo:** Software Agency
- **Docs:** [[Hermes Agency]]

---

## 📈 Kanbans de Projetos

| Projeto | Status | Link |
|---------|--------|------|
| Synkroo | Em progresso | [[Kanban: Synkroo]] |
| Hermes Dev | Contínuo | [[Kanban: Hermes Development]] |

---

## 💰 Modelos de Monetização

| Modelo | Descrição | Referência |
|--------|-----------|------------|
| SaaS | Assinatura mensal | [[SaaS Reference]] |
| Agency | Serviços sob demanda | [[Agency Model]] |
| White-label | Licenciamento | [[White-Label Guide]] |

---

## 🎯 Oportunidades

```dataview
TABLE file.ctime as "Data", tags
FROM "50-Learning/Business"
WHERE type != "folder"
SORT file.mtime DESC
LIMIT 10
```

---

## 📊 Auto-Doc: Business

```dataview
TABLE file.ctime as "Data"
FROM "30-Auto-Doc/Business"
WHERE type != "folder"
SORT file.mtime DESC
LIMIT 10
```

---

## 🔗 Links

- [[00-MOC]] - Mapa raiz
- [[Development MOC]] - Desenvolvimento
- [[Learning MOC]] - Aprendizado

---

## 📋 Tasks Ativas

```tasks
not done
due today
```

```tasks
not done
due before tomorrow
limit 5
```
