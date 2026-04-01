---
created: "2026-03-13T18:06:37.041473"
updated: "2026-03-18T13:38:45.049109"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code - Overview (Oficial)

> **Fonte:** https://docs.anthropic.com/en/docs/claude-code/overview
> **Data:** 2026-03-13

---

## O que é Claude Code

Claude Code é uma ferramenta de coding agentic que:
- Lê seu codebase
- Edita arquivos
- Executa comandos
- Integra com ferramentas de desenvolvimento

Disponível no terminal, IDE, desktop app e navegador.

---

## O que você pode fazer

### 1. Automatizar tarefas tediosas
- Escrever testes para código sem teste
- Corrigir erros de lint
- Resolver conflitos de merge
- Atualizar dependências
- Escrever release notes

### 2. Construir features e corrigir bugs
- Descreva o que quer em linguagem natural
- Claude Code planeja a abordagem, escreve o código e verifica se funciona

### 3. Criar commits e pull requests
- Trabalha diretamente com git
- Stage changes, escreve commit messages, cria branches, abre PRs

### 4. Conectar ferramentas com MCP
- Model Context Protocol é um padrão aberto
- Conecta com Google Drive, Jira, Slack, ou ferramentas customizadas

### 5. Personalizar com instruções, skills e hooks
- `CLAUDE.md` - arquivo de contexto do projeto
- Skills - comandos customizados
- Hooks - automação em diferentes estágios

---

## Instalação

### Windows (PowerShell):
```powershell
irm https://claude.ai/install.ps1 | iex
```

### macOS/Linux:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### ou via Homebrew:
```bash
brew install --cask claude-code
```

---

## Ambientes disponíveis

1. **Terminal** - CLI completa
2. **VS Code** - Extensão com inline diffs
3. **Desktop app** - App standalone
4. **Web** - Navegador (claude.ai/code)
5. **JetBrains** - Plugin para IntelliJ, PyCharm, etc.

---

## Preços

- Requer assinatura Claude ou conta Anthropic Console
- Terminal e VS Code suportam provedores terceiros

---

*Salvo automaticamente via heartbeat*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*