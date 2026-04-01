---
type: knowledge
category: claude-code
created: 2026-03-17
tags:
  - fix
  - hooks
  - session-start
  - nodejs
  - claude-mem
  - knowledge
  - claude-code
---

# 📚 Correção Hook SessionStart Claude Code


## Conteúdo


## Problema
Hook SessionStart exibia mensagem de erro e output enorme no startup do Claude Code.

## Causa Raiz
1. Conflito de autenticação: ANTHROPIC_AUTH_TOKEN + managed key
2. Hook context retornava systemMessage com códigos ANSI de cor
3. Node.js warnings: MODULE_TYPELESS_PACKAGE_JSON e DEP0190

## Soluções Aplicadas

### 1. Hook Context Filter
Criado .claude/execution/hook_context_filter.js que remove systemMessage do JSON:

- Filtra systemMessage com cores ANSI
- Mantém hookSpecificOutput funcional
- Usa shell: false para evitar DEP0190

### 2. package.json
Criado package.json com type: module

### 3. Configuração Atualizada
SessionStart hook usa filtro para saída limpa.

## Arquivos Modificados
- .claude/settings.local.json
- .claude/execution/hook_context_filter.js (novo)
- package.json (novo)

## Resultado
- Hook funciona corretamente
- Zero warnings do Node.js
- Output limpo no /clear


## 🔗 Relacionado

-
