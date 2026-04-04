---
created: 2026-04-04
tags: []
type: note
---

# Claude Flow V3 — Config, Rules & Behavioural Guide

**Data:** 2026-04-03
**Source:** `/mnt/c/Users/walis/OneDrive/Desktop/claude_code/CLAUDE.md` + `CLAUDE.local.md` + `claude-flow.config.json`

---

## 1. Behavioral Rules (Core)

### 1.1 Fundamental Directive

> **"Do what has been asked; nothing more, nothing less"**

Regras sempre enforced:
- Nunca criar ficheiros a menos que absolutamente necessário
- Preferir editar existente a criar novo
- Nunca criar documentação .md proactivamente (a menos que pedido)
- Nunca guardar ficheiros de trabalho na root
- Nunca fazer commit de secrets, credentials ou .env
- **Sempre apresentar plano ANTES de executar** — explicar o quê, como, porquê
- Sempre ler ficheiro antes de editar

### 1.2 Bypass Mode

**Ativar:** `bypass on` ou `CLAUDE_BYPASS=true`
**Desativar:** `bypass off`

**Em bypass:**
- Executar ações automaticamente SEM pedir aprovação
- Pausar APENAS para ações destrutivas ou alto risco

**Ações destrutivas/alto risco (SEMPRE pedir):**
- `git reset --hard`, `git push --force`
- `rm -rf` / `deltree`
- Matar processos Node.js (verificar se são do Claude Code)
- Drop table / deletar banco de dados
- Modificar credenciais ou secrets
- `git clean -fdx`
- Operações em `.env`, migrations, CI/CD

**Ações seguras (executar automático):**
- Create/edit de código
- Run tests, build, lint
- Git add/commit normal
- Spawn de agents
- Read de ficheiros
- Criar ficheiros em diretórios seguros (`src/`, `workspace/`, etc.)

### 1.3 Brainstorming Before Code (Hard Gate)

Antes de escrever QUALQUER código:
1. Invocar skill `brainstorming`
2. Criar design document
3. Obter aprovação do utilizador
4. Só então invocar `writing-plans`

**EXCEPTION:** Se bypass mode ativo, pular brainstorming exceto para ações destrutivas.

> "Simple" projects cause the most wasted work when assumptions go unexamined."

---

## 2. Skill System

### 2.1 Skills Priority

| Priority | Skill | When |
|----------|-------|------|
| 1st | `brainstorming` | Before any creative work |
| 2nd | `writing-plans` | After design approved |
| 3rd | `test-driven-development` | Before implementation |
| 4th | `systematic-debugging` | Bug investigation |
| 5th | `requesting-code-review` | Before merge |

### 2.2 Red Flags (STOP — you are rationalizing)

| Thought | Reality |
|---------|---------|
| "This is simple, skip the skill" | Simple things become complex. Use it. |
| "I'll just do this first" | Check BEFORE doing anything. |
| "I remember how this works" | Skills evolve. Read current version. |
| "The skill is overkill" | Use it anyway. |

### 2.3 Skill Invocation

```bash
Skill: brainstorming          # Design before code
Skill: writing-plans          # After design approval
Skill: test-driven-development # Before writing code
Skill: systematic-debugging    # When investigating bugs
```

### 2.4 Bundled Skills (25+)

| Category | Skills |
|----------|--------|
| Development | `brainstorming`, `writing-plans`, `TDD`, `systematic-debugging`, `software-architecture`, `code-quality-check`, `fullstack-dev`, `design-analyzer`, `pair-programming` |
| GitHub | `github-code-review`, `github-workflow-automation` |
| Memory | `agentdb-memory-patterns`, `agentdb-vector-search`, `reasoningbank-intelligence` |
| Methodology | `sparc-methodology` |
| Meta | `skill-builder`, `skill-creator`, `lesson-quiz`, `self-assessment` |

---

## 3. Quality & Architecture

### 3.1 Project Architecture

- Follow **Domain-Driven Design** with bounded contexts
- Keep files under **500 lines**
- Use typed interfaces for all public APIs
- Prefer **TDD London School** (mock-first)
- Use **event sourcing** for state changes
- Input validation at system boundaries

### 3.2 TDD Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

Process RED-GREEN-REFACTOR:
1. [ ] Write failing test
2. [ ] Verify it fails correctly
3. [ ] Write minimal code to pass
4. [ ] Verify all tests pass
5. [ ] Refactor
6. [ ] Commit

**If you wrote code before the test:** Delete it. Start over. No exceptions.

### 3.3 Code Comments

```js
// NOTE: brief explanation of why
// TODO: pending task
// SECURITY: needs review before modifying
```

Max 100 characters per line.

### 3.4 Code Removal Protocol

Before deleting code:
1. Where is it used?
2. What breaks?
3. What do we gain?
4. Is there a safer alternative?

---

## 4. Execution Model

### 4.1 Concurrency Rule

**1 MESSAGE = ALL RELATED OPERATIONS**
- ALL operations MUST be concurrent/parallel in a single message
- ALWAYS batch ALL todos in ONE TodoWrite call (5-10+ minimum)
- ALWAYS spawn ALL agents in ONE message with full instructions
- ALWAYS batch ALL file reads/writes/edits in ONE message
- ALWAYS batch ALL Bash commands in ONE message

### 4.2 Swarm Orchestration

- MUST initialize swarm using CLI tools for complex tasks
- MUST spawn concurrent agents using Claude Code's Task tool
- NEVER use CLI tools alone for execution — Task tool agents do the actual work
- MUST call CLI tools AND Task tool in ONE message for complex work

**Topology:** hierarchical-mesh (recommended)
**Max Agents:** 15 (6-8 for coding swarms)
**Consensus:** Raft (leader maintains authoritative state)

### 4.3 3-Tier Model Routing (ADR-026)

| Tier | Handler | Latency | Cost | Use Cases |
|------|---------|---------|------|-----------|
| 1 | Agent Booster (WASM) | <1ms | $0 | Simple transforms (var→const, add types) — Skip LLM |
| 2 | Haiku | ~500ms | $0.0002 | Simple tasks, low complexity (<30%) |
| 3 | Sonnet/Opus | 2-5s | $0.003-0.015 | Complex reasoning, architecture, security (>30%) |

Always check for `[AGENT_BOOSTER_AVAILABLE]` before spawning agents.

### 4.4 Swarm Execution Rules

- ALWAYS use `run_in_background: true` for all agent Task calls
- ALWAYS put ALL agent Task calls in ONE message for parallel execution
- After spawning, STOP — do NOT add more tool calls or check status
- Never poll TaskOutput — trust agents to return
- When results arrive, review ALL before proceeding

---

## 5. Directory Structure

### 5.1 Standard Directories

| Directory | Purpose | Examples |
|-----------|---------|---------|
| `src/` | Source code | `src/v3/@claude-flow/` |
| `tests/` | Test files | `tests/unit/`, `tests/integration/` |
| `docs/` | Documentation | `docs/guides/`, `docs/api/` |
| `config/` | Configuration | `config/tsconfig.json`, `config/env/` |
| `scripts/` | Utility scripts | `scripts/build.sh`, `scripts/deploy/` |
| `plugins/` | System plugins | `plugins/system/` |
| `workspace/` | Project artifacts | `workspace/projects/`, `workspace/output/` |
| `methods/` | Methodologies | `methods/bmad/`, `methods/sparc/` |
| `.claude/` | Claude Code config | `skills/`, `agents/`, `hooks/`, `memory/` |

### 5.2 NEVER Create at Root Level

- `lib/`, `bin/`, `dist/` → use `src/`
- `tmp/`, `temp/` → use `workspace/tmp/`
- `data/` → use `.claude/data/` or `workspace/data/`
- `cache/` → use `.claude/cache/`
- `build/` → use `scripts/`

### 5.3 Memory & State Locations

| Type | Location |
|------|----------|
| Agent memory | `.claude/memory.db` |
| Swarm state | `.claude/swarm/state.json` |
| Session data | `.claude/sessions/` |
| Metrics | `.claude/metrics/` |
| Logs | `.claude/logs/` |
| Plugin configs | `plugins/system/` |

---

## 6. Hooks System (17 Hooks + 12 Workers)

### 6.1 Hook Events

| Category | Events |
|----------|--------|
| Tool | `PreToolUse`, `PostToolUse`, `PostToolUseFailure` |
| Session | `SessionStart`, `SessionEnd`, `Stop`, `StopFailure` |
| Prompt | `UserPromptSubmit`, `InstructionsLoaded` |
| Agent | `SubagentStart`, `SubagentStop`, `TeammateIdle` |
| Task | `TaskCreated`, `TaskCompleted` |
| Config | `ConfigChange`, `CwdChanged`, `FileChanged`, `PreCompact`, `PostCompact` |
| Worktree | `WorktreeCreate`, `WorktreeRemove` |
| Permission | `PermissionRequest`, `Elicitation`, `ElicitationResult` |
| Other | `Notification` |

### 6.2 Hook Types

| Type | Description |
|------|-------------|
| `command` | Shell script execution |
| `prompt` | LLM evaluation (blocks on "stop") |
| `http` | Webhook to remote URL |
| `agent` | Subagent verification |

---

## 7. Agents (74+ Specialized Types)

### 7.1 Agent Categories

| Category | Examples |
|----------|----------|
| Core Development | `coder`, `reviewer`, `tester`, `planner`, `researcher` |
| Swarm Coordination | `hierarchical-coordinator`, `mesh-coordinator`, `adaptive-coordinator`, `queen-coordinator` |
| Consensus & Distributed | `raft-manager`, `quorum-manager`, `byzantine-coordinator`, `crdt-synchronizer`, `gossip-coordinator` |
| GitHub Automation | `pr-manager`, `code-review-swarm`, `issue-tracker`, `release-manager` |
| Security | `security-architect`, `security-auditor`, `appsec-elite-auditor` |
| Performance | `performance-engineer`, `performance-suite` |
| Memory | `memory-manager`, `agentdb-optimization`, `agentdb-vector-search` |

---

## 8. CLI Commands Reference

| Command | Subcommands | Description |
|---------|-------------|-------------|
| `init` | 4 | Project initialization |
| `agent` | 8 | Agent lifecycle management |
| `swarm` | 6 | Multi-agent swarm coordination |
| `memory` | 11 | AgentDB memory with HNSW search |
| `task` | 6 | Task creation and lifecycle |
| `session` | 7 | Session state management |
| `hooks` | 17 | Self-learning hooks + 12 workers |
| `hive-mind` | 6 | Byzantine fault-tolerant consensus |

---

## 9. Configuration

### 9.1 claude-flow.config.json

```json
{
  "version": "3.0.0",
  "memory": {
    "type": "hybrid",
    "path": "./data",
    "hnsw": { "m": 16, "ef": 200 }
  },
  "swarm": {
    "topology": "hierarchical-mesh",
    "maxAgents": 15,
    "strategy": "specialized"
  },
  "security": { "mode": "strict" },
  "neural": { "enabled": true, "sona": true }
}
```

### 9.2 Environment Variables

```bash
CLAUDE_FLOW_CONFIG=./claude-flow.config.json
CLAUDE_FLOW_LOG_LEVEL=info
CLAUDE_FLOW_MEMORY_BACKEND=hybrid
CLAUDE_FLOW_MEMORY_PATH=./data/memory
CLAUDE_FLOW_MCP_PORT=3000
CLAUDE_FLOW_MCP_TRANSPORT=stdio
```

---

## 10. Intelligence System (RuVector)

4-step pipeline: **RETRIEVE → JUDGE → DISTILL → CONSOLIDATE**

Components:
- **SONA:** <0.05ms adaptation
- **MoE:** 8 experts
- **HNSW:** 150x-12,500x speedup
- **Flash Attention:** 2.49x-7.47x speedup

---

## 11. Permission Modes

| Mode | Description |
|------|-------------|
| `default` | Standard operation with prompts |
| `acceptEdits` | Auto-accept edits without prompting |
| `plan` | Write plans before implementation |
| `auto` | Autonomous operation |
| `dontAsk` | Skip permission prompts |
| `bypassPermissions` | Full bypass (experimental) |

---

## 12. Effort Levels

| Level | Reasoning | Use Case |
|-------|-----------|----------|
| `low` | Minimal | Simple tasks |
| `medium` | Standard | Most tasks |
| `high` | Extensive | Complex reasoning |
| `max` | Maximum | Critical decisions |

---

*Relatório gerado: 2026-04-03*
*Fontes: CLAUDE.md (419 linhas), CLAUDE.local.md (52 linhas), claude-flow.config.json, CATALOG.md (572 linhas)*
