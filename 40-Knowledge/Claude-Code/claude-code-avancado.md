---
created: "2026-03-10T14:27:30.591000"
updated: "2026-03-18T13:38:44.965600"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code - Uso Avançado para Sistemas, Agentes e Automações

## O que aprendi

### 1. Subagentes Especializados

Claude Code tem subagentes built-in que podem ser usados para tarefas específicas:

**Subagentes disponíveis:**
- `/agents` - lista todos os subagentes
- `code-reviewer` - revisar código
- `debugger` - investigar bugs
- `api-designer` - desenhar APIs

**Como usar:**
```bash
# Listar subagentes
/agentes

# Usar subagente automaticamente
"review my recent code changes for security issues"
"run all tests and fix any failures"

# Usar subagente específico
"use the code-reviewer subagent to check the auth module"
"have the debugger subagent investigate why users can't log in"

# Criar subagente customizado
# Via /agents > Create New subagent
```

**Criar subagente customizado:**
- Identificador único (ex: `api-designer`, `code-reviewer`)
- Quando usar (description)
- Quais tools pode acessar
- System prompt com role e comportamento

### 2. CLAUDE.md - Memória Persistente

Sistema de memória em 3 níveis:

| Escopo | Localização | Uso |
|--------|-------------|-----|
| **Organization** | `/etc/claude-code/CLAUDE.md` | Padrões de empresa |
| **Projeto** | `./CLAUDE.md` ou `./.claude/CLAUDE.md` | Arquitetura, padrões |
| **Usuário** | `~/.claude/CLAUDE.md` | Preferências pessoais |

**Exemplo de CLAUDE.md para projeto:**
```markdown
# Projeto X - Instruções

## Build
- npm run dev
- npm test

## Padrões
- Use TypeScript
- Functional components only
- ESLint + Prettier

## Arquitetura
- React + Supabase
- Auth via JWT
- API REST
```

**Dica:** Use `/init` para gerar CLAUDE.md automaticamente!

### 3. Plan Mode

Modo seguro para análise sem fazer mudanças:

```bash
# Iniciar em modo plan
claude --permission-mode plan

# Durante sessão: Shift+Tab para entrar em Plan Mode
```

**Quando usar:**
- Análise de códigocomplexo
- Planejar mudanças grandes
- Revisão de código segura
- Explorar codebase antes de modificar

### 4. MCP - Model Context Protocol

O "USB-C da AI" para integrações:

**O que pode fazer via MCP:**
- Acessar Google Calendar, Notion
- Ler/escrever em bancos de dados
- Integrar com Jira, Slack
- Criar designs no Figma
- Controlar ferramentas 3D

**Arquitetura MCP:**
- **MCP Servers** - expõem dados/ferramentas
- **MCP Clients** - AI apps que consomem (Claude, ChatGPT, VS Code, Cursor)

**Exemplo de config MCP (config.json):**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/files"]
    },
    "google-drive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-google-drive"]
    }
  }
}
```

### 5. Workflows Avançados

**Explorar codebase desconhecido:**
```bash
cd projeto
claude
"give me an overview of this codebase"
"explain the main architecture patterns"
"what are the key data models?"
```

**Corrigir bugs:**
```bash
"I'm seeing an error when I run npm test"
"suggest a few ways to fix the @ts-ignore in user.ts"
"update user.ts to add the null check you suggested"
```

**Refatorar código:**
```bash
"find deprecated API usage in our codebase"
"suggest how to refactor utils.js to use modern JavaScript"
"refactor utils.js to ES2024 maintaining behavior"
"run tests for the refactored code"
```

**Criar PR:**
```bash
"create a commit with descriptive message"
"open a pull request for this feature"
```

### 6. Criando Sistemas/Agentes com Claude Code

**Arquitetura sugerida:**

```
projeto/
├── CLAUDE.md              # Instruções do projeto
├── .claude/
│   ├── agents/            # Subagentes customizados
│   │   └── meu-agente.md
│   └── rules/            # Regras por tipo de arquivo
├── src/
│   ├── agents/           # Agentes
│   ├── tools/            # Ferramentas customizadas
│   └── workflows/        # Automações
└── tests/
```

**Criando um agente customizado (ex: "api-builder"):**

1. Criar `.claude/agents/api-builder.md`:
```markdown
# API Builder Agent

## Role
Você é um expert em diseñar APIs RESTful.

## Quando usar
- Criar novos endpoints
- Documentar APIs
- Validar schema

## Tools disponíveis
- write, edit, read
- Run tests
- Git operations
```

### 7. Auto Memory

Claude Code aprende automaticamente com correções:

- Salva aprendizados no diretório de trabalho
-Primeiros 200 lines carregados em toda sessão
- Não precisa manual - Claude "anota" sozinho

**Habilitar para subagentes:**
```bash
# Configuração no subagent
Enable persistent memory: true
```

### 8. Headless Mode

Rodar sem interação (CI/CD, automações):

```bash
# Query única
claude -p "fix all lint errors in src/"

# Com modo plan
claude -p --permission-mode plan "analyze the security of auth.ts"
```

## Casos de Uso Reais

1. **Automação de testes** - "write tests for auth module, run them, fix failures"
2. **Code review** - "review all changes since last commit"