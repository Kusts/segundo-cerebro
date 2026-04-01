---
type: reference
id: claude-code-settings
title: Configuracoes Locais do Claude Code
category: configuration
created: 2026-03-11
updated: 2026-03-11
tags: [claude-code, settings, configuration]
---

# Configuracoes Locais

Este documento descreve as configuracoes locais do Claude Code.

## Arquivo de Configuracao

O arquivo principal de configuracao localiza-se em:
```
.claude/settings.local.json
```

## Configuracoes Principais

### API Keys
- Configuradas via variaveis de ambiente
- Nunca commitadas no repositorio

### MCPs Configurados
- **Supabase** - Operacoes de banco de dados
- **Playwright** - Testes E2E
- **Sequential-Thinking** - Raciocinio complexo
- **MCPBrowser** - Busca web e scraping

### Context Imports
```json
{
  "contextImports": [
    ".claude/CLAUDE.md",
    ".claude/memory/MEMORY.md"
  ]
}
```

## Veja Tambem

- [[./Configuracoes|Configuracoes do Claude Code]]
- [[./Hooks|Hooks Automatizados]]

---
*Ultima atualizacao: 2026-03-11*