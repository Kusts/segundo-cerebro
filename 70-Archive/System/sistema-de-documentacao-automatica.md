---
created: 2026-03-14
category: system
tags: [documentation, auto-document, sistema]
---

# Sistema de Documentação Automática

> Documentado automaticamente em 2026-03-14

## Visão Geral

O sistema de documentação automática do Claude Code e OpenClaw foi atualizado para categorizar automaticamente todas as ações em pastas específicas no Obsidian.

---

## Categorias de Documentação

| Categoria | Pasta | Emoji | Palavras-chave |
|-----------|-------|-------|----------------|
| **Erros** | `03-Knowledge/Historico/Erros/` | ❌ | erro, error, exception, failed, bug, traceback |
| **Soluções** | `03-Knowledge/Historico/Solucoes/` | ✅ | solução, fix, resolved, worked, implementado |
| **Planejamentos** | `02-Planning/` | 📋 | planejar, implementar, criar, desenvolver, roadmap |
| **Métodos** | `03-Knowledge/Methods/` | 🔧 | método, technique, pattern, prática |
| **Sugestões** | `03-Knowledge/Suggestions/` | 💡 | sugestão, idea, recomendar |
| **Críticas** | `03-Knowledge/Critiques/` | ⚠️ | crítica, problema, issue, melhorar |
| **Logs** | `03-Knowledge/Historico/Logs/` | 📝 | log, atividade, ação |
| **Sessões** | `03-Knowledge/Historico/Sessoes/` | 🔴 | sessão, session, tarefa |
| **Conhecimento** | `03-Knowledge/` | 📚 | conceito, aprender, descobrir |

---

## Como Funciona

### 1. Detecção Automática

O sistema detecta automaticamente o tipo de conteúdo baseado em palavras-chave no resultado da ferramenta:

- **Erros**: Quando há palavras como "error", "erro", "exception", "failed"
- **Soluções**: Quando há palavras como "success", "sucesso", "created", "salvo"
- **Planejamentos**: Quando há palavras como "implementar", "criar", "desenvolver"

### 2. Criação de Documentos

Para cada ação categorizada como erro, solução ou planejamento:
- Cria um documento отдельный na pasta correspondente
- Adiciona ao diário (07-Daily)
- Inclui timestamp e metadados

### 3. Arquivo Diário

Todas as ações são adicionadas ao arquivo diário (`07-Daily/YYYY-MM-DD.md`) com:
- Timestamp
- Nome da ferramenta
- Categoria detectada
- Resumo do resultado

---

## Arquivos Envolvidos

### Claude Code
- `.claude/execution/unified_hook_post.py` - Hook de documentação (atualizado)
- `.claude/execution/auto_documenter.py` - Novo sistema de documentação completa

### OpenClaw
- `.claude/execution/auto_session_hook.py` - Hook pré-ferramenta
- `.claude/execution/auto_document_all.py` - Hook de documentação (atualizado)

---

## Estrutura do Vault

```
Obsidian Vault/
├── 00-Inbox/           # Capturas rápidas
├── 01-Projects/        # Projetos ativos
├── 02-Planning/        # Planejamentos (NOVO!)
├── 03-Knowledge/
│   ├── Historico/
│   │   ├── Erros/      # Erros documentados (NOVO!)
│   │   ├── Solucoes/   # Soluções encontradas (NOVO!)
│   │   ├── Logs/       # Logs de atividades (NOVO!)
│   │   ├── Sessoes/    # Histórico de sessões
│   │   └── Pesquisas/  # Histórico de pesquisas
│   ├── Methods/        # Métodos e técnicas (NOVO!)
│   ├── Suggestions/    # Sugestões (NOVO!)
│   └── Critiques/      # Críticas e problemas (NOVO!)
├── 04-Solutions/       # Soluções de problemas
├── 05-Archive/         # Arquivos arquivados
├── 06-Areas/           # Áreas de responsabilidade
└── 07-Daily/           # Diário automático
```

---

## Configuração

O sistema detecta automaticamente:
1. O vault do Obsidian a partir de:
   - `brain_config.json`
   - `settings.local.json`
   - Variável de ambiente `OBSIDIAN_VAULT_PATH`

2. A categorização baseada em palavras-chave no conteúdo

---

## Histórico

- **2026-03-14**: Sistema de categorização automática implementado
- Antes: Tudo era apenas adicionado ao diário
- Agora: Documentos categorizados são criados automaticamente em pastas específicas

---

*Documentado automaticamente pelo sistema de documentação do Claude Code*
