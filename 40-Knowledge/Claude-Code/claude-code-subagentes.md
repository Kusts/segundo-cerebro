---
created: "2026-03-10T18:49:13.793000"
updated: "2026-03-18T13:38:45.066344"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code Subagentes - Guia

## O que aprendi

### O que são Subagentes?
Subagentes são assistentes especializados que rodam em contexto próprio com:
- System prompt customizado
- Acesso específico a ferramentas
- Permissões independentes

### Subagentes Built-in

| Agent | Model | Tools | Purpose |
|-------|-------|-------|---------|
| **Explore** | Haiku | Read-only | Busca e análise de codebases |
| **Plan** | Herda | Read-only | Pesquisa para planejamento |
| **General-purpose** | Herda | Todos | Operações complexas |

### Como Criar

1. Crie arquivo `.claude/agents/meu-agent.md`
2. Defina:
   - Description (quando usar)
   - Tools permitidas
   - System prompt

### Benefícios
- Preservar contexto
- Limitar ferramentas
- Reusar configurações
- Controlar custos (usar Haiku)

### Diferença: Subagents vs Agent Teams
- **Subagents**: Uma sessão, delegação interna
- **Agent Teams**: Múltiplas sessões coordenadas

## Fonte
- https://docs.anthropic.com/en/docs/claude-code/sub-agents
- Data: 2026-03-10

## Tags
[[auto-aprendizado]] [[claude-code]] [[subagentes]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*