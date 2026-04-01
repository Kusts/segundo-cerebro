---
created: {{date}}
updated: {{date}}
tags: [dashboard, dataview, {{category}}]
type: dashboard
description: Dashboard {{name}}
---

# 📊 Dashboard: {{name}}

> Visão {{description}} | Atualizado: {{date}}

---

## 📈 Métricas

```dataview
TABLE WITHOUT ID
file.link AS "Item",
file.mtime AS "Última Atualização"
FROM "{{folder}}"
WHERE file.extension = "md"
SORT file.mtime DESC
LIMIT 10
```

---

## 🕐 Atividade Recente

```dataview
TABLE WITHOUT ID
file.link AS "Arquivo",
file.mtime AS "Modificado"
FROM "{{folder}}"
WHERE file.mtime > {{date-start}}
SORT file.mtime DESC
LIMIT 10
```

---

## 📋 Tarefas Ativas

```tasks
not done
limit 15
```

---

## 🏷️ Tags Principais

```dataview
TABLE WITHOUT ID
tag AS "Tag",
length(rows) AS "Usos"
FROM "{{folder}}"
FLATTEN file.tags AS tag
GROUP BY tag
SORT length(rows) DESC
LIMIT 10
```

---

## 🔗 Relacionado

- [[00-MOC]] - Mapa raiz
- [[{{related-dashboard}}]]
