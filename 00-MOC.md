---
type: MOC
tags:
  - MOC
  - root
  - index
description: Mapa de Conhecimento Raiz do Segundo Cérebro
created: 2026-04-01
---

# 🧠 Segundo Cérebro - Mapa Raiz

> **Walis + Hermes** | Conhecimento compartilhado | Versão 2.0

---

## 🎯 Navegação Principal

| Domínio | Descrição | Status |
|---------|-----------|--------|
| [[AI-Agents MOC]] | Agentes de IA, Hermes, OpenClaw, ferramentas | 🟢 Ativo |
| [[Development MOC]] | Desenvolvimento, código, Git, deploy | 🟢 Ativo |
| [[Automation MOC]] | n8n, Windmill, automações, workflows | 🟢 Ativo |
| [[Business MOC]] | Projetos, Synkroo, monetização, SaaS | 🟢 Ativo |
| [[Learning MOC]] | Pesquisas, cursos, aprendizados | 🟢 Ativo |
| [[Sessions MOC]] | 225 sessões arquivadas | 🟢 Consolidadas |

---

## 📊 Dashboards

| Dashboard | Descrição |
|-----------|-----------|
| [[Canvas: Skills Tree]] | Árvore de habilidades |
| [[Canvas: Projects Overview]] | Visão de projetos |
| [[Canvas: Knowledge Graph]] | Grafo de conhecimento |
| [[Canvas: AI-Agent Architecture]] | Arquitetura AI-Agent |
| [[Kanban: Synkroo]] | Quadro Synkroo |
| [[Kanban: Hermes Development]] | Desenvolvimento Hermes |
| [[SAE Dashboard]] | Sistema de Auto-Evolução |

---

## 📊 Dashboards

| Dashboard | Descrição |
|-----------|-----------|
| [[Canvas: Skills Tree]] | Árvore de habilidades - ver evolução |
| [[Canvas: Projects Overview]] | Visão geral de projetos ativos |
| [[Kanban: Synkroo]] | Quadro Kanban do Synkroo |
| [[Kanban: Hermes Development]] | Desenvolvimento do Hermes |
| [[📊 Dashboard SAE]] | Sistema de Auto-Evolução |

---

## 🔗 Links Rápidos

### 10-Projects
- [[Synkroo]] - Ecossistema SaaS
- [[Hermes Gateway]] - Sistema de agentes

### 20-Systems
- [[SAE]] - Self-Adaptive Evolution
- [[ARES]] - Sistema de recomendação

### 40-Knowledge
- [[Solutions]] - Soluções documentadas
- [[Architecture]] - Arquiteturas de sistema
- [[Claude-Code]] - Conhecimento Claude Code
- [[Synkroo-Overview]] - Projeto SaaS clínicas

### 05-Skills
- [[Skills Index]] - Índice de todas as skills
- [[Skills: AI-Agents]] - Skills de agentes
- [[Skills: Development]] - Skills de desenvolvimento

---

## 📈 Métricas do Vault

```dataview
TABLE file.ctime as "Criado", length(file.outlinks) as "Links Saída", length(file.inlinks) as "Links Entrada"
FROM ""
WHERE file.folder != ".obsidian"
SORT file.mtime DESC
LIMIT 10
```

---

## 🏷️ Tags Principais

```dataview
TABLE tags, length(file.outlinks) as "Refs"
FROM ""
WHERE file.folder != ".obsidian" AND length(tags) > 0
FLATTEN tags
GROUP BY tags
SORT length(rows) DESC
LIMIT 20
```

---

## 📅 Última Atualização

^updated
Atualizado em: 2026-04-01
Próxima revisão: 2026-04-08

---

*Este é o ponto de entrada principal do Segundo Cérebro. Use Ctrl+O para buscar notas específicas.*
