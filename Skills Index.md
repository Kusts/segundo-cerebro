---
type: MOC
tags:
  - MOC
  - skills
  - index
description: Índice de Skills - Hermes Skills System
created: 2026-04-01
---

# 🎯 Skills Index

> Sistema de Skills do Hermes | v3.5

---

## 📁 Localização

Skills do Hermes estão em: `~/.hermes/skills/`
Skills do vault estão em: `05-Skills/`

---

## 🏷️ Categorias de Skills

| Categoria | Descrição | Count |
|-----------|-----------|-------|
| AI-Agents | Delegação, swarm, multi-agent | 15+ |
| Automation | n8n, Windmill, scripts | 10+ |
| Development | Git, deploy, debugging | 12+ |
| MLOps | Training, inference, models | 8+ |
| Research | Web search, papers, analysis | 6+ |
| Productivity | Docs, notes, calendar | 5+ |

---

## 🛠️ Skills Principais

### AI-Agents
```dataview
TABLE name, category, version
FROM "05-Skills"
WHERE type = "skill"
SORT name ASC
```

---

## 📋 Skills do Hermes (CLI)

### Uso
```bash
# Listar todas as skills
hermes skills list

# Ver skill específica
hermes skills view <nome>

# Carregar skill
/hermes load <nome>
```

---

## 🔗 Relacionado

- [[Skills: AI-Agents]] - Skills de agentes
- [[Skills: Development]] - Skills de desenvolvimento
- [[AI-Agents MOC]] - Mapa de AI Agents
- [[Hermes]] - Documentação do Hermes
