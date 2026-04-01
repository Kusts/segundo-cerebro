---
created: "2026-03-11T06:40:38.413000"
updated: "2026-03-18T13:38:45.016140"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code Camp - Guia Completo

> **Fonte:** https://www.claudecodecamp.com
> **Data:** 2026-03-11

---

## O que é?

Blog/newsletter semanal sobre **como usar Claude Code profissionalmente**. Escrito por alguém que já deu workshops para +100 engenheiros.

---

## Artigos Principais

### 1. I'm Building Agents That Run While I Sleep

**Problema:**
- Equipes usando Claude Code fazem 40-50 PRs/semana vs 10 antes
- Não dá pra revisar tudo manualmente
- "AI checking AI's work = self-congratulation machine"

**Solução - TDD moderno:**

1. **Escreva acceptance criteria primeiro** (em linguagem natural)
2. **Deixe o agente construir**
3. **Rode verificações automáticas** (Playwright)
4. **Revise só o que falhou**

**Exemplo de acceptance criteria:**
```markdown
# Task: Add email/password login

## AC-1: Successful login
- User at /login with valid credentials gets redirected to /dashboard
- Session cookie is set

## AC-2: Wrong password error
- User sees exactly "Invalid email or password"
- User stays on /login
```

**Stack:**
- Claude Code headless (`claude -p`)
- Playwright MCP
- Sem backend custom

**Repo:** github.com/opslane/verify

---

### 2. Claude Code MCP Deep Dive

**O que é MCP?**
- Protocolo aberto released pela Anthropic em Nov/2024
- Standardiza como AI tools conectam a serviços externos
- Sem MCP: cada serviço precisa integração custom
- Com MCP: um servidor expõe ferramentas padrão

**Como funciona:**
- MCP server expõe **tools** (funções que a AI pode chamar)
- Claude Code não conecta direto no servidor
- Claude Code fica no meio: modelo → tool call → servidor → resultado → modelo

**Custo de tokens:**
- Cada tool é enviada como JSON schema (~60-200 tokens)
- ~20 tools nativos Claude = ~3,000 tokens
- 1 MCP server (Playwright) = ~2,000-3,000 tokens
- 5 MCP servers = ~55,000 tokens (28% de 200K context!)

**Tool Search:**
- Quando tool definitions passam de 10% do context
- Para de enviar schemas completos
- Usa ToolSearch para encontrar a tool certa
- Adiciona 1 round-trip por tool mas corta overhead

**Quando usar MCP:**
- ✅ Quando não existe CLI equivalent (browser automation)
- ✅ Quando session state importa (DOM, cookies, login)
- ❌ Quando tem CLI bom (git, npm, docker)

---

### 3. How Tool Use Actually Works in Claude Code

**Conceito chave:**
- Modelo só gera texto - não executa nada
- **Harness** = software que envolve o modelo
- Tool use = API entre modelo e harness

**O loop completo:**
```
1. Você envia: tools + user message
2. Claude responde: tool_use (e.g., "grep pattern: auth")
3. Você executa: grep("auth") → resultado
4. Você envia de volta: tool_result
5. Claude responde: mais tool_use OU end_turn (fim)
```

**Loop = while true até end_turn**

**23 ferramentas nativas no Claude Code:**
- Read, Edit, Bash, Grep, etc

---

## Insights Importantes

### TDD com AI
- Escreva o que o código deve fazer **antes** de pedir para o AI construir
- AI não precisa ser rápida - o lento é verificar se está certo
- acceptance criteria = especificação em linguagem natural

### Custo de MCP
- Cada server adiciona tokens em **todo turn**
- Prompt caching reduz ~90% (de $0.80 para $0.08 por turn)
- GitHub MCP alone = ~26,000 tokens

### Autonomy Levels
- **Tab** - completion básico
- **Cmd+K** - edits targeted
- **Agente** - full autonomy

---

## Links

- Site: https://www.claudecodecamp.com
- Repo do verify: https://github.com/opslane/verify

---

## Tags
[[auto-aprendizado]] [[claude-code]] [[mcp]] [[tdd]] [[vibe-coding]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*