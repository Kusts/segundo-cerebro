---
created: "2026-03-10T14:24:50.639000"
updated: "2026-03-18T13:38:44.949717"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code - Guia Completo

## O que aprendi

### Overview
Claude Code é uma ferramenta de coding agentic que:
- Lê seu codebase
- Edita arquivos
- Roda comandos
- Integra com ferramentas de desenvolvimento

Disponível em: Terminal, VS Code, Desktop app, Browser, JetBrains.

### Instalação

**macOS/Linux/WSL:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows PowerShell:**
```powershell
irm https://claude.ai/install.ps1 | iex
```

### O que pode fazer

1. **Automatizar tarefas tediosas**
   - Escrever testes
   - Corrigir lint errors
   - Resolver merge conflicts
   - Atualizar dependências
   - Escrever release notes

2. **Build features e fix bugs**
   - Descreva em linguagem natural
   - Claude planeja, escreve código, e verifica

3. **Git integration**
   - Criar commits
   - Abrir PRs
   - Trabalhar com branches

4. **MCP - Model Context Protocol**
   - Conectar com ferramentas externas
   - Google Drive, Jira, Slack, etc
   - "USB-C para AI"

5. **Customização com CLAUDE.md**
   - Arquivo na raíz do projeto
   - Instruções customizadas

### Modos de Uso

- **Terminal CLI**: `claude` no diretório do projeto
- **VS Code**: Extensão oficial
- **Desktop app**: App standalone
- **Web**: claude.ai/code

### Comparativo com Cursor

| Feature | Claude Code | Cursor |
|---------|-------------|--------|
| Base | CLI tool | Fork VS Code |
| Integração | Terminal-first | IDE-native |
| MCP | ✅ | ✅ |
| Autonomy slider | Via prompts | Built-in |

## Fonte
- https://docs.anthropic.com/en/docs/claude-code/overview
- https://modelcontextprotocol.io
- Data: 2026-03-10

## Próximos passos
- [ ] Instalar Claude Code localmente
- [ ] Testar CLI
- [ ] Configurar MCP servers

## Tags
[[auto-aprendizado]] [[claude-code]] [[mcp]] [[ferramentas]] [[vibe-coding]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*