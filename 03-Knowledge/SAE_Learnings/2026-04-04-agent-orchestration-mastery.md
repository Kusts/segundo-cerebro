---
tags:
  - sae-learning
  - agent-orchestration
  - mastery
created: 2026-04-04
---

# Agent Orchestration Mastery — 2026-04-04

## O que foi feito

### 1. Skill Criada
- `agent-orchestration-mastery` skill em `~/.hermes/skills/agent-orchestration-mastery/SKILL.md`
- Consolida todo o conhecimento de orquestração de agentes

### 2. Módulo Implementado
- `~/.hermes/SAE/agent_orchestration/` com 5 submódulos:

#### fault_tolerance.py
- `AgentCircuitBreaker` — previne cascade failures
- `agent_retry` — retry com exponential backoff
- `graceful_degradation` — fallback em cascata
- `AgentHealthMonitor` — monitora health de agents
- `CheckpointManager` — checkpointing para long-running

#### agent_handoffs.py
- `AgentMessageBus` — pub/sub message bus
- `HandoffManager` — handoffs com tracking e expiração
- `AgentRegistry` — registry de capabilities
- `AgentHandoff` — protocolo de transferência

#### cost_management.py
- `AgentCostMonitor` — tracking de tokens e custos
- `MultiAgentBudgetManager` — orçamentos por agent
- `CostAwareScheduler` — scheduling baseado em custo
- Token budgets por tipo de agent

#### dynamic_spawning.py
- `ComplexityEstimator` — estima complexidade de tasks
- `AgentPool` — pool para reuse e concurrency control
- `DynamicSpawningManager` — spawning baseado em complexidade
- Agentes especializados por domain

#### state_management.py
- `SharedStateStore` — estado compartilhado com versioning
- `CheckpointManager` — recovery de agents
- `DistributedStateManager` — para multi-node
- `RecoveryManager` — recover agents após falhas

### 3. Conceitos-Chave Aprendidos/Consolidados

#### Fault Tolerance
- Circuit Breaker: OPEN → HALF_OPEN → CLOSED
- Retry com exponential backoff (base_delay * 2^attempt)
- Graceful degradation: especializado → genérico
- Queen Checkpoints: leader mantém estado autoritativo

#### Agent Handoffs
- Handoff Protocol: source → target com reason/priority/deadline
- Message Bus: direto (1:1) ou pub/sub (1:N)
- Context Passing: template estruturado com Task/Constraints/Success Criteria

#### Cost Management
- Token budgets por agent type (planner: 2k, coder: 8k, senior: 15k)
- Multi-agent token multiplier: ~15x vs single agent
- Cost-aware scheduling: reuse vs spawn

#### Dynamic Spawning
- Complexity score: file_count * 0.5 + refactor * 2 + cross_service * 3
- Score < 3: 1 agent | Score 3-7: 2-3 agents | Score > 7: 4-5 agents
- Agent Pool: reuse antes de spawnar novo

#### State Management
- Optimistic locking: compare_and_swap
- Checkpoint versioning: parent_version chain
- Recovery: restore from latest checkpoint

## Patterns Anti

| Anti-Pattern | Problema | Solução |
|-------------|----------|----------|
| Supervisor gargalo | paraphrasing | forward_message |
| Infinite loop | agents chamando em loop | TTL + circuit breaker |
| Context pollution | contexto irrelevante | isolation rigoroso |
| Over-spawning | agents demais | pool + complexity-based |
| Stateless agents | perde progresso | checkpoint + shared state |

## Quando Usar

| Task | Padrão | Topology | Consensus |
|------|--------|----------|-----------|
| Coding simples | Single | none | none |
| Coding complexo | Supervisor | hierarchical | none |
| Research profundo | Peer-to-peer | mesh | gossip |
| Multi-repo | Hierarchical | hierarchical | raft |
| Sistema não-confiável | + Circuit Breaker | hierarchical | byzantine |

## Arquivos

```
~/.hermes/skills/agent-orchestration-mastery/SKILL.md
~/.hermes/SAE/agent_orchestration/
├── __init__.py
├── fault_tolerance.py
├── agent_handoffs.py
├── cost_management.py
├── dynamic_spawning.py
└── state_management.py
```

---

*Mastery adquirido: 2026-04-04*
