---
type: knowledge
tags: [architecture, software, reference]
created: 2026-04-01
description: Arquitetura de Software - Referência
---

# 🏗️ Arquitetura de Software

> Referência de padrões e práticas | Updated: 2026-04-01

---

## 📐 Patterns Principais

### Arquitetura de Agentes

| Pattern | Uso | Referência |
|---------|-----|------------|
| Multi-Agent | Vários agentes cooperating | [[Multi-Agent Patterns]] |
| Agent Orchestration | Orquestração via supervisor | [[Swarm-Mastery]] |
| Hierarchical | Agentes em camadas | [[Agent-Autonomy]] |

### Arquitetura de Sistema

| Pattern | Uso | Quando Usar |
|---------|-----|-------------|
| Event-Driven | Comunicação assíncrona | Alta escalabilidade |
| Microservices | Services independentes | Teams distribuidos |
| Modular Monolith | Modules separados, deploy único | Início de projeto |

---

## 🔄 Fluxo de Dados

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Input     │ ──> │  Processing │ ──> │   Output    │
│  (User/API) │     │  (Agents)   │     │  (Response) │
└─────────────┘     └─────────────┘     └─────────────┘
                          │
                          v
                    ┌─────────────┐
                    │   Memory    │
                    │  (Storage)  │
                    └─────────────┘
```

---

## 🛠️ Stack Técnica

### Hermes Stack

| Componente | Tecnologia |
|-----------|------------|
| Core | Python |
| Agents | Claude Code, Codex |
| Memory | Obsidian, SQLite |
| Communication | Telegram, WhatsApp |
| Automation | n8n, Windmill |
| Deploy | Railway, Kubernetes |

---

## 📚 Recursos

- [[20-Systems/Hermes]] - Sistema Hermes
- [[20-Systems/SAE]] - SAE Architecture
- [[20-Systems/OpenClaw]] - OpenClaw Framework

---

## 🔗 Relacionado

- [[Development MOC]]
- [[AI-Agents MOC]]
