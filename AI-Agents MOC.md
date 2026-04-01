---
type: MOC
tags:
  - MOC
  - AI-Agents
  - hermes
  - openclaw
description: Mapa de Conhecimento - Agentes de IA
created: 2026-04-01
---

# 🤖 AI-Agents MOC

> Domínio de Agentes de IA, Assistentes Virtuais e Sistemas Autônomos

---

## 🧠 Sistemas Principais

### Hermes (Agente Principal)
- [[Hermes Gateway]] - Gateway de comunicação
- [[Hermes Config]] - Configurações
- [[Hermes SAE]] - Integração com SAE
- [[Hermes Skills]] - Skills disponíveis

### OpenClaw (Framework)
- [[OpenClaw Architecture]] - Arquitetura
- [[OpenClaw Claw-Swarm]] - Orquestração multi-agente
- [[OpenClaw Skills]] - Skills do framework

### SAE (Self-Adaptive Evolution)
- [[SAE Dashboard]] - Dashboard de métricas
- [[SAE Decisions]] - Decisões registradas
- [[SAE Gaps]] - Gaps identificados
- [[SAE Learnings]] - Aprendizados

### ARES (Recommendation System)
- [[ARES Overview]] - Visão geral
- [[ARES Gaps]] - Sistema de gaps

---

## 🛠️ Ferramentas & Plataformas

| Ferramenta | Uso | Docs |
|------------|-----|------|
| Claude Code | Coding agent | [[Claude-Code]] |
| Codex | Coding agent alternativo | [[Codex Setup]] |
| Windmill | Automation platform | [[Windmill Guide]] |
| n8n | Workflow automation | [[N8N Workflows]] |

---

## 📚 Conhecimento Extraído

```dataview
TABLE file.ctime as "Data", tags
FROM "30-Auto-Doc/AI-Agents"
WHERE type != "folder"
SORT file.mtime DESC
LIMIT 15
```

---

## 🔗 Notas Relacionadas

- [[Skills: AI-Agents]] - Skills específicas
- [[00-MOC]] - Volta ao mapa raiz
- [[Development MOC]] - Desenvolvimento

---

## 📊 Auto-Doc

| Categoria | Count |
|-----------|-------|
| AI-Agents Docs | `= length(filter([[30-Auto-Doc/AI-Agents]].files, f => f.extension = "md"))` |

---

## 🎯 Progresso

- [x] MOC criado
- [ ] Canvas: AI-Agent Architecture
- [ ] Kanban: Hermes Development
- [ ] Consolidar notas duplicadas
