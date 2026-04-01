---
type: dashboard
tags:
  - dashboard
  - learning
  - dataview
description: Dashboard de Aprendizado
created: 2026-04-01
---

# 📚 Dashboard: Learning

> Aprendizados, pesquisas e recursos | Atualizado: 2026-04-01

---

## 📺 YouTube - Aprendizados Recentes

```dataview
TABLE WITHOUT ID
file.link AS "Título",
file.ctime AS "Data",
file.tags AS "Tópicos"
FROM "30-Auto-Doc/YouTube"
WHERE file.extension = "md"
SORT file.ctime DESC
LIMIT 15
```

---

## 📚 Recursos Organizados

```dataview
TABLE WITHOUT ID
file.link AS "Recurso",
file.tags AS "Categoria"
FROM "50-Learning"
WHERE file.extension = "md"
SORT file.mtime DESC
LIMIT 15
```

---

## 🏷️ Tópicos de Estudo

| Tópico | Recursos | Progresso |
|--------|----------|-----------|
| AI Agents | [[AI-Agents MOC]] | 🟢 |
| n8n | [[Automation MOC]] | 🟢 |
| Windmill | [[Automation MOC]] | 🟡 |
| Claude Code | [[Claude-Code]] | 🟢 |
| MLOps | Skills | 🟡 |
| SaaS Business | [[Business MOC]] | 🟢 |

---

## 📖 Livros/Links Salvos

```dataview
TABLE WITHOUT ID
file.link AS "Link",
file.ctime AS "Salvo em"
FROM ""
WHERE file.tags CONTAINS "book" OR file.tags CONTAINS "reference"
SORT file.ctime DESC
LIMIT 10
```

---

## 🎓 Deep Dives

```dataview
TABLE WITHOUT ID
file.link AS "Deep Dive",
file.ctime AS "Data"
FROM "50-Learning/04-Research/Deep-Dives"
WHERE file.extension = "md"
SORT file.ctime DESC
```

---

## 📝 Auto-Doc: Aprendizados

```dataview
TABLE WITHOUT ID
file.link AS "Documento",
file.ctime AS "Gerado"
FROM "30-Auto-Doc/Research"
WHERE file.extension = "md"
SORT file.ctime DESC
LIMIT 10
```

---

## 🔗 Relacionado

- [[Learning MOC]]
- [[AI-Agents MOC]]
- [[Business MOC]]
- [[00-MOC]]
