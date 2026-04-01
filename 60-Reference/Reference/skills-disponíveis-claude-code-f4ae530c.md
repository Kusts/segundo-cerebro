---
type: knowledge
id: skills-disponíveis-claude-code-f4ae530c
category: Reference
created: 2026-03-07
tags: [knowledge, Reference, auto-generated]
---

# 📚 Skills Disponíveis - Claude Code

# Skills Disponíveis - Claude Code

## Visão Geral

O sistema possui **100+ skills** organizadas em categorias. Skills são invocadas usando a **Skill tool** ou via comandos `/`.

## Estrutura de uma Skill

```
.claude/skills/<skill-name>/
├── SKILL.md          # Definição da skill (YAML frontmatter + markdown)
├── references/       # Referências e templates opcionais
└── [outros arquivos]
```

**Frontmatter YAML:**
```yaml
---
name: skill-name
description: Descrição da funcionalidade
version: 1.0.0
author: Autor
tags: [tag1, tag2, tag3]
---
```

## Categorias de Skills

### 1. Core Skills

#### `/software-architecture`
**Descrição:** Senior Software Architect com domínio absoluto de fundamentos, modelos arquiteturais, cloud computing e system design.

**Uso:** Qualquer tarefa relacionada a desenvolvimento de software, design de arquitetura, análise de código e decisões técnicas estratégicas.

**Pilares:**
1. Fundamentos Absolutos (SOLID, DRY, KISS, YAGNI, paradigmas)
2. Modelos Arquiteturais (Monolith, Microservices, Event-Driven)
3. Cloud Computing (AWS, Azure, GCP, escalabilidade)
4. System Design e Diagramação (HLD, LLD)
5. Comunicação Técnica (ADRs, trade-offs)

**Invocação:** `$software-architecture`

---

#### `/commit-push-pr`
**Descrição:** Automatiza commit, push e criação de pull request.

**Uso:** Quando usuário pede "commit and push", "create PR", "git workflow".

**Funcionalidades:**
1. Verifica git status
2. Adiciona arquivos ao staging
3. Cria commit com mensagem formatada
4. Push para branch remoto
5. Cria PR no GitHub (via gh CLI)

**Invocação:** `$commit-push-pr "feat: implement feature X"`

---

#### `/code-quality-check`
**Descrição:** Verificação abrangente de qualidade de código.

**Uso:** Validação de código antes de commit, revisão técnica.

---

### 2. Product & Planning Skills

#### `/prd-brainstorm`
**Descrição:** Brainstorming interativo e geração de PRD estruturado.

**Workflow de 5 Fases:**
1. **Discovery Inicial** - Entender problema, usuários, tipo
2. **Brainstorming Estruturado** - OST, JTBD, Assumption Mapping
3. **Pesquisa de Tecnologias** - WebSearch para stacks atuais
4. **Consolidação** - Resumo e validação
5. **Geração do PRD** - Documento final completo

**Técnicas Aplicadas:**
- Opportunity Solution Tree (OST)
- Jobs To Be Done (JTBD)
- Assumption Mapping (matriz 2x2)

**Saída:** `prd.md` com seções obrigatórias

**Integração:** Compatible com `/sprint-context-generator`

---

#### `/sprint-context-generator`
**Descrição:** Gera contexto completo de sprint (spec.md, plan.md, etc).

**Uso:** Após PRD estar definido, cria contexto técnico para desenvolvimento.

---

#### `/landing-page-prd-architect`
**Descrição:** Especialista em criar PRDs para landing pages.

**Uso:** Projetos de marketing, páginas de vendas, funis.

---

### 3. Prompt Engineering Skills

#### `/lisa-prompt-engineering`
**Descrição:** Engenharia de prompts avançada (LISA = Learning, Iteration, Synthesis, Application).

**Uso:** Quando usuário pede "create prompt", "improve prompt".

---

#### `/ralph-prompt-builder`
**Descrição:** Construtor de prompts otimizados e bem estruturados.

**Uso:** Criar prompts para outras IAs, automações.

---

#### `/hero-visual-prompt-generator`
**Descrição:** Geração de prompts visuais premium para IA (Midjourney, DALL-E, etc).

**Uso:** Criar prompts para geração de imagens e vídeos.

---

### 4. Context Skills

#### `/context-fundamentals`
**Descrição:** Fundamentos de contexto em LLMs.

**Tópicos:**
- Token limits
- Context windows
- Information retention
- Compression strategies

---

#### `/context-compression`
**Descrição:** Técnicas de compressão de contexto.

**Uso:** Quando contexto está muito grande.

---

#### `/context-degradation`
**Descrição:** Diagnóstico de degradação de contexto.

**Uso:** Quando modelo "esquece" informações anteriores.

---

#### `/context-optimization`
**Descrição:** Otimização de contexto para máximo aproveitamento.

---

### 5. Agent Skills (80+)

#### Agentes Core

| Skill | Descrição |
|-------|-----------|
| `/agent-coder` | Codificador |
| `/agent-researcher` | Pesquisador |
| `/agent-reviewer` | Revisor de código |
| `/agent-tester` | Testador |
| `/agent-planner` | Planejador |
| `/agent-analyst` | Analista |

#### Agentes Especializados

| Skill | Descrição |
|-------|-----------|
| `/agent-security-manager` | Segurança |
| `/agent-performance-optimizer` | Performance |
| `/agent-github-pr-manager` | GitHub PR |
| `/agent-release-manager` | Releases |
| `/agent-orchestrator-task` | Orquestração |

#### Agentes de Coordenação

| Skill | Descrição |
|-------|-----------|
| `/agent-swarm` | Swarm de agentes |
| `/agent-coordination` | Coordenação |
| `/agent-hierarchical-coordinator` | Coordenação hierárquica |
| `/agent-queen-coordinato