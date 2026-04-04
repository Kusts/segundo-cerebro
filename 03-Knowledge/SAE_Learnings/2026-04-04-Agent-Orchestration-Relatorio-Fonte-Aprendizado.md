================================================================================
RELATÓRIO: DOMÍNIO DE ORQUESTRAÇÃO DE AGENTES
================================================================================
Data: 04/04/2026 | Tempo de estudo: ~2 horas | Status: COMPLETO

================================================================================
PARTE 1: FONTES DE CONHECIMENTO
================================================================================

1.1 FONTES INTERNAS (VAULT)

  SWARM MASTERY (skill)
  Conteúdo: Topologias (hierarchical, mesh, ring, star), consensus (raft,
  byzantine, gossip), anti-drift patterns
  Relevância: Topologias e consenso entre agentes

  SWARM ADVANCED (skill)
  Conteúdo: Research swarm, production patterns, fault-tolerance
  Relevância: Padrões avançados de swarm

  MULTI-AGENT-PATTERNS (skill)
  Conteúdo: Supervisor, peer-to-peer, hierarchical; context isolation;
  token economics
  Relevância: Arquiteturas multi-agent

  RUFLO-V35-MASTERY (skill)
  Conteúdo: 99+ agent types, hooks system, HARD-GATE brainstorming
  Relevância: Sistema completo do Claude Code

  LONG-RUNNING-AGENT (skill)
  Conteúdo: Checkpointing, session recovery, progress tracking
  Relevância: Agentes que duram entre sessões

  SAE SOLUTIONS (notas de gap resolvido)
  - sae-claw-swarm-2026-03-30.md
  - sae-swarm-mastery-2026-04-01.md
  - sae-agent-autonomy-2026-03-30.md
  - sae-agent-cost-monitor-2026-03-30.md
  - sae-long-running-agent-2026-04-01.md
  - sae-long-running-agent-2026-04-02.md
  - sae-multi-agent-cn-2026-03-30.md

  ARQUIVOS DO VAULT (Claude Code)
  - claude-code-avancado.md (221 linhas)
    Subagentes, CLAUDE.md, Plan Mode, MCP, Workflows avançados
  - claude-code-subagentes.md (52 linhas)
    Subagentes built-in: Explore, Plan, General-purpose

  RESILIENCE & FAULT TOLERANCE (aprendizado SAE)
  Circuit Breaker, Retry with exponential backoff, Bulkhead, Timeout,
  Health checks

1.2 FONTES EXTERNAS (PESQUISA WEB)

  OPENCLAW/EDICT (GitHub: cft0808/edict)
  Stars: 14,195
  Arquitetura: 三省六部 (Três Departamentos e Seis Ministérios)
  China imperial inspired - 12 agentes com separation of powers
  Diferencial: 制度性审核 (institutional review) + 实时看板 (dashboard)

  AGENTS-SWARM (GitHub: carvalhxlucas/agents-swarm)
  Event-driven distributed engine for orchestrating autonomous LLM agents
  Stack: FastAPI + Redis + PostgreSQL
  Foco: scalable state management, fault tolerance, async communication

 OUTRAS FONTES PESQUISADAS
  - n8n Tutorial for Beginners 2026 (YouTube)
  - WhatsApp AI Agent para Agendamentos (YouTube)
  - Claude Code Camp (YouTube)
  - BMAD (Build More, Architect Dreams) - 43+ workflows guiados

================================================================================
PARTE 2: O QUE FOI FEITO COM ESSE CONHECIMENTO
================================================================================

2.1 ARTEFATOS CRIADOS

  SKILL CONSOLIDADA
  ~/.hermes/skills/agent-orchestration-mastery/SKILL.md

  MÓDULO PYTHON (~60KB)
  ~/.hermes/SAE/agent_orchestration/
  ├── __init__.py (3.7 KB) - Exports
  ├── fault_tolerance.py (11.9 KB)
  │   AgentCircuitBreaker, agent_retry, graceful_degradation,
  │   AgentHealthMonitor, CheckpointManager
  ├── agent_handoffs.py (13.8 KB)
  │   AgentMessageBus, HandoffManager, AgentRegistry
  ├── cost_management.py (15.0 KB)
  │   AgentCostMonitor, MultiAgentBudgetManager, CostAwareScheduler
  ├── dynamic_spawning.py (14.1 KB)
  │   AgentPool, DynamicSpawningManager, ComplexityEstimator
  └── state_management.py (17.4 KB)
      SharedStateStore, CheckpointManager, RecoveryManager

2.2 GAPS PREENCHIDOS

  Gap ID                          | Descrição                   | Status
  --------------------------------|----------------------------|---------
  gap-20260331-125855-0           | ai agents - aprofundamento | ✅
  gap-20260401-094331-15          | ai agents - aprofundamento | ✅
  gap-20260402-083443-57          | ai agents - aprofundamento | ✅
  gap-20260404-054527-70          | ai agents - aprofundamento | ✅
  gap-20260404-082418-86          | ai agents - aprofundamento | ✅

2.3 REGISTRO NO SAE

  Learning capture: learning_capture.json atualizado
  Vault: Nota criada em SAE_Learnings/
  Skill registry: agent-orchestration-mastery disponível

================================================================================
PARTE 3: RESUMO DIDÁTICO
================================================================================

3.1 O QUE É ORQUESTRAÇÃO DE AGENTES?

  Definição: Coordenar múltiplos agentes de IA para trabalharem juntos.

  Analogia: Escritório onde:
  - Chefe (supervisor) recebe tarefa e distribui
  - Especialistas (coder, reviewer, tester) fazem sua parte
  - Sistema de comunicação para passarem tarefas
  - Se um falha, outro pega (fault tolerance)

3.2 TOPOLOGIAS (como os agentes se organizam)

  HIERARCHICAL (pirâmide)
  -------------------
            [QUEEN]
              |
      [W1] [W2] [W3]

  Quando usar: Coding tasks, anti-drift (evita divagação)
  Recomendado: max 15 agents (6-8 para coding)

  MESH (rede)
  ----------
    A ↔ B
    ↕ ↕
    C ↔ D

  Quando usar: Research, exploração, requisitos emergentes

  HIERARCHICAL-MESH (híbrido) - RECOMENDADO
  ----------------
            [QUEEN]
              |
      [A ↔ B ↔ C]
      (mesh entre si)

  Quando usar: Tarefas complexas que precisam de coordenação E
  flexibilidade. Este é o default recomendado.

  三省六部 (inspiração china imperial - OpenClaw)
  ---------
  皇上 (User)
      |
    太子 (Taizi) - triagem de mensagens
      |
    中书省 (Zhongshu) - planejamento
      |
    门下省 (Menxia) - revisão/qualidade (pode vetar!)
      |
    尚书省 (Shangshu) - distribuição
      |
    六部 (Libu/Hubu/Bingbu/Xingbu/Gongbu) - execução

  Diferencial: 审核机制 (review mechanism) obrigatório

3.3 FAULT TOLERANCE (quando algo falha)

  CIRCUIT BREAKER
  ----------------
  Estados: CLOSED → OPEN → HALF_OPEN → CLOSED

  CLOSED = funcionando normalmente
  Após N falhas → OPEN (bloqueia chamadas)
  Após timeout → HALF_OPEN (testa uma chamada)
  Se ok → CLOSED, se falha → OPEN

  Implementação:
  breaker = AgentCircuitBreaker(failure_threshold=5, timeout=60)
  result = breaker.call(agent.execute, task)

  RETRY COM BACKOFF EXPONENCIAL
  ------------------------------
  Tentativa 1: espera 2s
  Tentativa 2: espera 4s
  Tentativa 3: espera 8s
  ...progressão geométrica

  Implementação:
  agent_retry(fn, max_attempts=3, base_delay=2.0)

  GRACEFUL DEGRADATION
  --------------------
  Especialista falha → tenta outro →到最后 → fallback genérico

  Implementação:
  graceful_degradation(task, agents=[s1, s2], fallback=general)

3.4 AGENT HANDOFFS (como passam tarefas)

  Handoff = transferir trabalho de um agente para outro

  Protocolo:
  1. Source agent completa parte do trabalho
  2. Cria contexto estruturado:
     - Task: o que precisa fazer
     - Previous Work: o que já foi feito
     - Constraints: limitações
     - Success Criteria: como saber que está pronto
     - Reason: por que estáhandoffando
  3. MessageBus entrega para target agent
  4. Target agent continua de onde parou

  Exemplo:
  handoff = AgentHandoff(
      source_agent="coder_001",
      target_agent="reviewer_001",
      task_state={"code": "...", "tests": "..."},
      reason="Code complete, needs review"
  )

3.5 COST & TOKEN MANAGEMENT (quanto custa)

  REALIDADE: multi-agent é CARO

  Arquitetura          | Multiplicador de tokens
  ---------------------|-------------------------
  Single agent         | 1x
  Single + tools       | ~4x
  Multi-agent          | ~15x
  Multi-agent complex   | ~25x

  TOKEN BUDGETS POR TIPO
  ----------------------
  planner    | 2000 tokens (só planejar)
  coder     | 8000 tokens (implementação)
  reviewer  | 3000 tokens (só review)
  researcher| 5000 tokens (pesquisa)
  senior    | 15000 tokens (decisões complexas)

  Regra: Se budget excede, fallback ou queue

3.6 DYNAMIC SPAWNING (quantos agentes usar)

  Problema: Spawnar demais = caro. De menos = lento.

  Solução: Estimar complexidade e ajustar

  ComplexityEstimator:
  Score < 3   → 1 agent (simples)
  Score 3-7   → 2-3 agents (médio)
  Score > 7   → 4-5 agents (complexo)

  Agent Pool: Reutilizar agentes ao invés de criar novos
  - Mais barato (menos tokens)
  - Mais rápido (não precisa inicializar)

3.7 STATE MANAGEMENT (manter progresso)

  CHECKPOINTING
  Salva estado periodicamente para disco
  Se falhar, restaura do último checkpoint

  SHARED STATE STORE
  Estado compartilhado entre agents
  Com versionamento para evitar conflitos

  MESSAGE BUS
  Agents se comunicam via mensagens
  Pub/sub para notificações

================================================================================
PARTE 4: QUANDO USAR CADA PADRÃO
================================================================================

  TAREFA                  | PADRÃO              | TOPOLOGIA     | FAULT TOLERANCE
  ------------------------|---------------------|---------------|-----------------
  Fix simples             | Single agent        | none          | retry
  Bug com testes          | Single + tests      | none          | circuit breaker
  Feature nova            | Supervisor          | hierarchical  | retry + timeout
  Refactor multi-repo     | Hierarchical        | hierarchical  | circuit breaker
  Research profunda       | Peer-to-peer        | mesh          | gossip
  Sistema crítico         | Supervisor + CB     | hierarchical  | byzantine
  Pipeline de dados       | Ring                | ring          | retry
  Load balancing          | Star                | star          | quorum
  三省六部 (OpenClaw)     | Dept + Ministry     | hierarchical  | review + veto

================================================================================
PARTE 5: ANTI-PADRÕES (O QUE NÃO FAZER)
================================================================================

  ANTI-PADRÃO              | SINTOMA                    | SOLUÇÃO
  -------------------------|----------------------------|--------------------
  Supervisor gargalo       | Supervisor faz paraphrase   | Usar forward_message
  Infinite loop            | Agents chamando em loop     | TTL + circuit breaker
  Context pollution        | Agent herda contexto irrelevante| Context isolation
  Stateless agents         | Cada chamada perde progresso| Checkpoint + shared state
  Over-spawning            | Gasta tokens demais         | Complexity-based + pool
  Under-delegation         | Faz tudo sozinho            | Confiar em sub-agents

================================================================================
PARTE 6: 三省六部 - PADRÃO OPENCLAW (EXTRAÍDO DO GITHUB)
================================================================================

  ARQUITETURA: 三省六部 (Três Departamentos e Seis Ministérios)

  Fluxo completo:
  皇上 (User) → 太子 (Taizi) → 中书省 (Zhongshu) → 门下省 (Menxia)
  → 尚书省 (Shangshu) → 六部 (execução paralela) → 回奏

  OS 12 AGENTES:
  ----------------
  太子     - Mensagem triagem (旨意 vs 闲聊)
  中书省   - Planejamento (起草方案)
  门下省   - Revisão/Qualidade (可封驳)
  尚书省   - Distribuição (派发任务)
  六部:
    户部   - Dados/finanças
    礼部   - Documentação
    兵部   - Código/implementação
    刑部   - Testes/segurança
    工部   - Infraestrutura
    吏部   - Recursos humanos/coordenção

  DIFERENCIAL PRINCIPAL:
  门下省 pode封驳 (vetar)方案 da 中书省
  ForçaLoop de revisão até qualidade ACCEPT

  COMPARAÇÃO COM OUTROS FRAMEWORKS:
  ----------------------------------
                        | CrewAI | MetaGPT | AutoGen | 三省六部
  Revisão obrigatória    |   ❌   |   ⚠️   |   ⚠️    |    ✅
  Dashboard tempo real  |   ❌   |   ❌   |   ❌    |    ✅
  Intervenção em tempo  |   ❌   |   ❌   |   ❌    |    ✅
  Audit trail completo  |   ⚠️   |   ⚠️   |   ❌    |    ✅
  Agent health monitor  |   ❌   |   ❌   |   ❌    |    ✅

================================================================================
PARTE 7: COMO USAR O MÓDULO
================================================================================

  # Importar tudo
  from agent_orchestration import (
      AgentCircuitBreaker, agent_retry, graceful_degradation,
      AgentMessageBus, HandoffManager,
      AgentCostMonitor, MultiAgentBudgetManager,
      AgentPool, DynamicSpawningManager, ComplexityEstimator,
      SharedStateStore, CheckpointManager
  )

  # Estimar complexidade
  ce = ComplexityEstimator()
  score = ce.estimate("refactor auth across 5 services", {"file_count": 10})
  agents = ce.get_agent_recommendation(score)

  # Pool de agentes
  pool = AgentPool(max_agents=15)
  agent_id, is_existing = pool.acquire(spec)
  # ... usar agent ...
  pool.release(agent_id, success=True)

  # Fault tolerance
  breaker = AgentCircuitBreaker(failure_threshold=5)
  try:
      result = breaker.call(agent.execute, task)
  except CircuitOpenError:
      print("Agent indisponível, usando fallback")

================================================================================
PARTE 8: PRÓXIMOS PASSOS
================================================================================

  1. PRÁTICA: Implementar um swarm simples usando os patterns
  2. TESTAR: Usar o módulo com tasks reais
  3. APROFUNDAR: Estudar consensus (Raft, Byzantine) para sistemas distribuídos
  4. INTEGRAR: Conectar com SAE hooks para auto-spawn baseado em gaps
  5. EXPLORAR: Implementar 三省六部 pattern no Hermes

================================================================================
ARQUIVOS DE REFERÊNCIA
================================================================================

  Skill principal:
  ~/.hermes/skills/agent-orchestration-mastery/SKILL.md

  Módulo implementado:
  ~/.hermes/SAE/agent_orchestration/

  Aprendizado no vault:
  Segundo_Cerebro/03-Knowledge/SAE_Learnings/2026-04-04-agent-orchestration-mastery.md

  Este relatório:
  Segundo_Cerebro/03-Knowledge/SAE_Learnings/2026-04-04-Agent-Orchestration-Relatorio-Fonte-Aprendizado.md

================================================================================
FIM DO RELATÓRIO
================================================================================
Gerado: 2026-04-04 | Conhecimento adquirido em ~2 horas de estudo + implementação
================================================================================
