---
type: reference
id: claude-code-hooks
title: Hooks Automatizados do Claude Code
category: automation
created: 2026-03-11
updated: 2026-03-11
tags: [claude-code, hooks, automation]
---

# Hooks Automatizados

Este documento descreve os hooks automatizados configurados no Claude Code.

## Tipos de Hooks

### Post-Tool-Use
Executados apos o uso de ferramentas especificas.

### Pre-Tool-Use
Executados antes de acoes especificas.

## Hooks Configurados

### Documentacao Automatica
- Gera documentacao automaticamente apos implementacoes
- Salva solucoes na memoria persistente

### Validacao de Codigo
- Verifica qualidade antes de commits
- Executa testes automaticos

## Configuracao

Os hooks sao configurados em:
```
.claude/settings.local.json
```

## Veja Tambem

- [[./Configuracoes|Configuracoes do Claude Code]]
- [[./Workflows|Workflows Personalizados]]

---
*Ultima atualizacao: 2026-03-11*