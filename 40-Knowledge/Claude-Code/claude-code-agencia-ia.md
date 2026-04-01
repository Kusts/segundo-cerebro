---
created: "2026-03-07T22:28:06.895000"
updated: "2026-03-18T13:38:44.933979"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code - Guia para Agência de IA

**Data:** 2026-03-07
**Tipo:** Conhecimento / Ferramenta
**Tags:** [[claude-code]] [[ia]] [[agencia]] [[programacao]] [[openclaw]] [[memoria]]

---

## O que é Claude Code?

Claude Code é um agente de IA da Anthropic que pode ser usado localmente para:
- Desenvolver código
- Orquestrar projetos
- Criar automações
- Gerenciar agentes

---

## Casos de Uso para Agência de IA

| Caso | Descrição | Complexidade |
|------|-----------|--------------|
| **Automação de processos** | Extrair dados, gerar relatórios | Média |
| **Code review automático** | Analisar PRs de clientes | Baixa |
| **Geração de código** | MVP para startups | Alta |
| **Refactoring** | Modernizar código legado | Alta |
| **Documentação** | Gerar docs automaticamente | Baixa |
| **Testes** | Criar suite de testes | Média |

---

## Skills Customizadas

### Skill: Análise de Requisitos

```yaml
---
name: requirements-analyzer
description: Analisa requisitos de projeto e gera especificação técnica
---

# Instruções
Você é um analyst de requisitos especializado.

1. Leia os requisitos fornecidos
2. Identifique escopo, funcionalidades e restrições
3. Gere SPEC.md com:
   - Visão geral do projeto
   - Funcionalidades priorizadas
   - Stack tecnológica recomendada
   - Estimativa de esforço
   - Riscos identificados
```

### Skill: Code Review Professional

```yaml
---
name: pro-code-review
description: Revisão profissional de código para produção
---

# Instruções
Você é um code reviewer sênior.

Para cada PR:
1. Verifique segurança (credenciais, SQL injection, XSS)
2. Verifique performance (N+1 queries, loops desnecessários)
3. Verifique padrões (naming, estrutura, DRY)
4. Verifique testes (cobertura, qualidade)
5. Sugira melhorias específicas

Responda em formato:
- ✅ Aprovado
- ⚠️ Aprovado com comments
- ❌ Changes Requested
```

---

## Multi-Agent para Projetos Complexos

### Arquitetura Recomendada

```
Agente Principal (Orchestrator)
├── Agente Frontend (Sonnet)
├── Agente Backend (Sonnet)  
├── Agente DevOps (Haiku)
└── Agente QA (Haiku)
```

### Padrão: Planner-Executor

```
1. Agente Planner (Haiku)
   - Analisa tarefa
   - Divide em subtarefas
   - Define ordem de execução

2. Agentes Executores (Sonnet)
   - Cada um executa uma subtarefa
   - Retornam resultados

3. Agente Integrador (Sonnet)
   - Consolida resultados
   - Verifica integração
   - Faz ajustes necessários
```

---

## Integrações com Ferramentas

### n8n

```bash
# Claude Code pode gerar workflows n8n
claude "Create an n8n workflow that:
- Receives webhook from Typeform
- Saves to Supabase
- Sends Slack notification"
```

### Supabase

```bash
# Gerar código baseado em schema
claude "Based on this Supabase schema, generate:
- TypeScript types
- API routes with auth
- Row Level Security policies"
```

### MCP Servers Úteis

| Server | Uso |
|--------|-----|
| **filesystem** | Acessar projetos clientes |
| **github** | Operar em repositórios |
| **slack** | Notificar equipe |
| **postgres** | Query direta no DB |
| **playwright** | Testes E2E automatizados |

---

## Fluxos para Deliveries

### 1. Kickoff de Projeto

```
claude "Create a CLAUDE.md for this project with:
- Team structure (frontend/backend/qa agents)
- Coding standards
- Git workflow
- Deployment process
- Definition of done"
```

### 2. Desenvolvimento de Feature

```
claude "Implement user authentication:
1. First create the database schema in supabase
2. Then build the API endpoints
3. Finally create the React login form
Test each step before moving on"
```

### 3. Entrega e Handoff

```
claude "Create a handoff document that includes:
- All generated files and their purpose
- How to run the project locally
- Environment variables needed
- Known limitations
- Next steps for the client"
```

---

## Precificação de Serviços

### Estimativa de Esforço

| Serviço | Comando Claude | Tempo Estimado |
|---------|---------------|----------------|
| MVP simples | "create a basic CRUD app" | 2-4 horas |
| API REST | "build REST API with auth" | 4-8 horas |
| Landing page | "create a marketing landing page" | 1-2 horas |
| Dashboard | "build admin dashboard with charts" | 4-6 horas |
| Integração | "connect to external API" | 2-4 horas |

---

## Commands Úteis

```bash
# Iniciar novo projeto
claude .

# Criar arquivo
claude --write arquivo.py

# Revisões
claude --review

# Debug
claude --debug

# Mode (Haiku, Sonnet, Opus)
claude --model opus
```

---

## Fonte

Baseado em: `memory/skills/claude-code-avancado.md`

---

## Tags

[[claude-code]] [[ia]] [[agencia]] [[programacao]] [[mcp]] [[supabase]] [[n8n]] [[automation]] [[openclaw]] [[mvp]] [[saas]]



---

*Enriquecido automaticamente pelo sistema de auto-documentação*