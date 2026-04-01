---
type: dashboard
tags:
  - dashboard
  - dataview
  - overview
description: Dashboard principal do vault
created: 2026-04-01
---

# 📊 Dashboard Principal

> Visão geral do Segundo Cérebro | Atualizado: 2026-04-01

---

## 📈 Métricas do Vault

```dataview
TABLE WITHOUT ID
file.link AS "Nota",
file.ctime AS "Criado",
file.mtime AS "Modificado"
FROM ""
WHERE file.folder != ".obsidian" AND file.folder != ".smart-env"
SORT file.mtime DESC
LIMIT 10
```

---

## 🕐 Atividade Recente

```dataview
TABLE WITHOUT ID
file.link AS "Arquivo",
file.mtime AS "Última Modificação"
FROM ""
WHERE file.folder != ".obsidian" AND file.mtime > 2026-03-25
SORT file.mtime DESC
LIMIT 15
```

---

## 🏷️ Tags Mais Usadas

```dataview
TABLE WITHOUT ID
tag AS "Tag",
length(rows) AS "Usos"
FROM ""
FLATTEN file.tags AS tag
WHERE file.folder != ".obsidian"
GROUP BY tag
SORT length(rows) DESC
LIMIT 15
```

---

## 📁 Notas por Pasta

```dataview
TABLE WITHOUT ID
file.folder AS "Pasta",
length(rows) AS "Notas"
FROM ""
WHERE file.folder != ".obsidian" AND file.extension = "md"
GROUP BY file.folder
SORT length(rows) DESC
LIMIT 15
```

---

## 📋 Tarefas Ativas

```tasks
not done
limit 20
```

---

## 🔗 Notas Recentes Sem Links

```dataview
TABLE WITHOUT ID
file.link AS "Nota",
file.ctime AS "Criada"
FROM ""
WHERE file.folder != ".obsidian" AND length(file.outlinks) = 0 AND length(file.inlinks) = 0
SORT file.ctime DESC
LIMIT 10
```

---

## 📅 Sessões Recentes

```dataview
TABLE WITHOUT ID
file.link AS "Sessão",
file.ctime AS "Data"
FROM "01-Daily/Sessions"
SORT file.ctime DESC
LIMIT 10
```

---

## 🔗 Relacionado

- [[00-MOC]] - Mapa raiz
- [[Dashboard: Projects]] - Projetos
- [[Dashboard: Learning]] - Aprendizado
