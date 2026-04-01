---
type: dashboard
tags:
  - dashboard
  - projects
  - dataview
description: Dashboard de Projetos
created: 2026-04-01
---

# 📊 Dashboard: Projetos

> Visão geral de todos os projetos | Atualizado: 2026-04-01

---

## 🚀 Status Geral

| Projeto | Status | Prioridade | Próximo |
|---------|--------|-----------|---------|
| Synkroo | 🟢 96% | 🔴 Alta | Sprint 8 - Analytics |
| Hermes | 🟢 Ativo | 🔴 Alta | SAE v3.5 |
| OpenClaw | 🟡 Dev | 🟡 Média | Claw-Swarm |
| SAE | 🟢 Ativo | 🔴 Alta | RuFlo V3.5 |
| ARES | 🟡 Dev | 🟡 Média | Gap detection |

---

## 📋 Tarefas por Projeto

### Synkroo

```dataview
TASK
FROM ""
WHERE contains(file.path, "Synkroo") AND !completed
GROUP BY project
```

---

## 📁 Arquivos por Projeto

```dataview
TABLE WITHOUT ID
file.folder AS "Local",
file.link AS "Documento",
file.mtime AS "Atualizado"
FROM ""
WHERE file.folder CONTAINS "Synkroo" OR file.tags CONTAINS "synkroo"
SORT file.mtime DESC
LIMIT 10
```

```dataview
TABLE WITHOUT ID
file.folder AS "Local",
file.link AS "Documento",
file.mtime AS "Atualizado"
FROM ""
WHERE file.folder CONTAINS "Hermes" OR file.tags CONTAINS "hermes"
SORT file.mtime DESC
LIMIT 10
```

---

## 🎯 Goals Ativos

```tasks
not done
limit 10
```

---

## 📈 Progresso Synkroo (Iteração 2.0)

| Sprint | Épico | SP | Status |
|--------|-------|-----|--------|
| Sprint 3 | Qualidade e Testes | 42 | ✅ 100% |
| Sprint 4 | Feature Flags | 39 | ✅ 100% |
| Sprint 5 | Performance | 39 | 🔄 80% |
| Sprint 6 | Segurança | 39 | ✅ 100% |
| Sprint 7 | Integrações | 39 | ✅ 100% |

**Total:** 198 SP | **Faltando:** Sprint 8 - Analytics

---

## 🔗 Links

- [[Kanban: Synkroo]]
- [[Kanban: Hermes Development]]
- [[Kanban: OpenClaw Swarm]]
- [[Kanban: SAE Development]]
- [[Synkroo-Overview]]
