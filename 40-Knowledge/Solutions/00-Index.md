---
type: MOC
tags:
  - MOC
  - solutions
  - sae
description: Índice de Solutions SAE
created: 2026-04-01
---

# 🔧 Solutions Index

> Base de soluções documentadas pelo SAE | 41 soluções

---

## 📊 Visão Geral

```dataview
TABLE WITHOUT ID
file.link AS "Solução",
file.ctime AS "Criada",
file.mtime AS "Atualizada"
FROM "40-Knowledge/Solutions"
WHERE file.extension = "md"
SORT file.mtime DESC
LIMIT 20
```

---

## 🏷️ Por Categoria

### Agent Skills
```dataview
TABLE WITHOUT ID
file.link AS "Skill",
file.mtime AS "Atualizada"
FROM "40-Knowledge/Solutions"
WHERE contains(file.name, "agent-")
SORT file.mtime DESC
```

### SAE Integration
```dataview
TABLE WITHOUT ID
file.link AS "Doc",
file.mtime AS "Atualizada"
FROM "40-Knowledge/Solutions"
WHERE contains(file.name, "sae-")
SORT file.mtime DESC
```

---

## 📋 Recent Solutions

| Data | Solução | Categoria |
|------|---------|----------|
| 2026-04-01 | [[SAE Context Engineering]] | SAE |
| 2026-04-01 | [[SAE Deploy Essentials]] | Deploy |
| 2026-04-01 | [[SAE Long-Running Agent]] | Agent |
| 2026-03-30 | [[SAE Agent Autonomy]] | Agent |
| 2026-03-30 | [[SAE Git Oracle]] | DevOps |

---

## 🔗 Relacionado

- [[SAE Dashboard]]
- [[AI-Agents MOC]]
- [[Development MOC]]
