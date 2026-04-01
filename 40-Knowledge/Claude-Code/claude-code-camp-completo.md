---
created: "2026-03-11T06:45:50.220000"
updated: "2026-03-18T13:38:44.982446"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code Camp - Guia Completo

> **Fonte:** https://www.claudecodecamp.com
> **Data:** 2026-03-11
> **Status:** Completo (10 artigos)

---

## 📚 Todos os Artigos

### 1. I'm Building Agents That Run While I Sleep (Mar 10)

**Problema:**
- Equipes usando Claude Code fazem 40-50 PRs/semana vs 10 antes
- Não dá pra revisar tudo manualmente
- "AI checking AI's work = self-congratulation machine"

**Solução - TDD moderno:**

1. **Escreva acceptance criteria primeiro** (em linguagem natural)
2. **Deixe o agente construir**
3. **Rode verificações automáticas** (Playwright)
4. **Revise só o que falhou**

**Repo:** github.com/opslane/verify

---

### 2. Claude Code MCP Deep Dive (Mar 9)

**O que é MCP?**
- Protocolo aberto released pela Anthropic em Nov/2024
- Standardiza como AI tools conectam a serviços externos
- Sem MCP: cada serviço precisa integração custom
- Com MCP: um servidor expõe ferramentas padrão

**Custo de tokens:**
- Cada tool = ~60-200 tokens
- ~20 tools nativos Claude = ~3,000 tokens
- 1 MCP server (Playwright) = ~2,000-3,000 tokens
- 5 MCP servers = ~55,000 tokens (28% de 200K context!)

**Tool Search:**
- Quando tool definitions passam de 10% do context
- Para de enviar schemas completos
- Usa ToolSearch para encontrar a tool certa

**Quando usar MCP:**
- ✅ Quando não existe CLI equivalent (browser automation)
- ✅ Quando session state importa (DOM, cookies, login)
- ❌ Quando tem CLI bom (git, npm, docker)

---

### 3. How Tool Use Actually Works (Mar 4)

**Conceito chave:**
- Modelo só gera texto - não executa nada
- **Harness** = software que envolve o modelo
- Tool use = API entre modelo e harness

**O loop completo:**
```
1. Você envia: tools + user message
2. Claude responde: tool_use
3. Você executa: tool → resultado
4. Você envia de volta: tool_result
5. Claude responde: mais tool_use OU end_turn (fim)
```

**23 ferramentas nativas no Claude Code**

---

### 4. Deep Dive on Prompt Caching (Feb 26)

**Novidades:**
- **Remote control**: Controlar Claude Code do celular
- **Auth ban**: Anthropic banhou OAuth tokens de terceiros
- **Plan first, then execute**: workflow separado para planejar

**Remote Control:**
```bash
claude remote-control
# ou dentro da sessão:
/remote-control ou /rc
```

**Workflow sugerido:**
1. Planeje em sessão separada
2. Execute em nova sessão
3. Use `/clear` entre fases
4. Checkpoint após cada passo

---

### 5. How Prompt Caching Actually Works (Feb 25)

**Custo:**
- Sem cache: $50-100 por sessão Opus longa
- Com cache (90% hit): $10-19

**Como funciona:**
- Armazena KV cache (Key-Value vectors)
- Se prefixo muda → cache inteiro invalidado
- 2 letras diferentes = 2,727 tokens invalidados

**O que quebra o cache:**
- ❌ Timestamps no system prompt
- ❌ Adicionar/remover MCP tools
- ❌ Mudar modelo no meio da sessão
- ❌ Qualquer byte diferente no prefixo

**Dica:** Colocar dados variáveis no final do prompt, não no início

---

### 6. How Agent Teams Actually Work (Feb 19)

**Dois sistemas:**
1. **Subagents** (Task tool) - efêmero, retorna resultado, não persiste
2. **Agent Teams** - persistente, idle/wake, coordena via filesystem

**Agent Teams no filesystem:**
```
~/.claude/teams/{team-name}/
├── config.json
└── inboxes/
    ├── team-lead.json
    └── agent-a.json

~/.claude/tasks/{team-name}/
├── 1.json  (task)
├── 2.json
└── .lock
```

**Comandos de debug:**
```bash
# Ver config
cat ~/.claude/teams/*/config.json | python3 -m json.tool

# Ver tasks
ls -la ~/.claude/tasks/*/

# Ver inbox
cat ~/.claude/teams/*/inboxes/*.json
```

---

### 7. Claude Code Agent Teams Under the Hood (Feb 19)

**Custo:**
- Subagents: menor (sem contexto persistente)
- Teams: ~2x mais tokens (contexto próprio + heartbeat)

**Regra prática:**
- Agents não precisam falar entre si → subagents
- Agents precisam de task queue compartilhada → teams

**Features:**
- Inboxes criados lazily (só aparecem quando há mensagem)
- Task dependencies computadas on-the-fly
- Idle notifications a cada 2-4 segundos
- agents não "ouvem" texto plain - precisam usar SendMessage

---

### 8. All About Opus 4.6 (Feb 12)

**Novidades:**
- **1M token context** (beta, API only)
- **128K output tokens** (2x)
- **Fast mode** - 2.5x mais rápido (`/fast`)
- **Adaptive thinking** - modelo decide quando usar extended reasoning

**Agent Teams:**
- Habilitar: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
- Útil para: code reviews paralelos, features cross-layer, debugging

**Demo Anthropric:**
- 16 Opus 4.6 agents construíram um compilador C
- $20K em custos API
- 100K linhas de Rust
- Compila Linux kernel, PostgreSQL, Redis, Doom

---

### 9. How the Claude Code Team Really Works (Feb 5)

**10 dicas do Boris Cherny (criador do Claude Code):**

1. **Mais paralelo** - 3-5 git worktrees com sessões separadas
2. **Plan mode** - pense primeiro, execute depois
3. **Invista no CLAUDE.md** - atualize