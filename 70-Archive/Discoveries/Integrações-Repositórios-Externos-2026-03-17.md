---
created: "2026-03-17T13:40:04.631314"
updated: "2026-03-18T13:38:41.180086"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Integrações de Repositórios Externos - Claude Code

**Data:** 2026-03-17
**Tags:** #code #tools #claude-code

## Resumo

 foram analisados e integrados 3 repositórios externos para expandir as capacidades do Claude Code:

- obsidian-skills (kepano)
- get-shit-done (gsd-build)
- superpowers (obra)

---

## Repositórios Analisados

### 1. obsidian-skills (kepano)

**Status:** Integrados Skills Únicas

Skills para trabalhar com arquivos Obsidian:
- **json-canvas** - Criar/editar arquivos JSON Canvas (.canvas) do Obsidian
- **obsidian-bases** - Criar/editar Obsidian Bases (.base) com views, filtros, fórmulas

**Origem:** https://github.com/kepano/obsidian-skills

### 2. get-shit-done (gsd-build)

**Status:** Sobrepõe com BMAD

Sistema de workflow completo similar ao BMAD. Recursos duplicados:
- new-project, plan-phase, execute-phase
- verification, debugging
- subagent orchestration

**Único adaptado:**
- map-codebase - Analisar codebases existentes
- project-stats - Estatísticas do projeto
- quick - Modo rápido com flags
- user-profile - Perfil comportamental

**Origem:** https://github.com/gsd-build/get-shit-done

### 3. superpowers (obra)

**Status:** Já Existia no Sistema

Skills que já tínhamos:
- systematic-debugging
- test-driven-development
- brainstorming
- subagent-driven-development
- writing-plans

**Origem:** https://github.com/obra/superpowers

---

## Novos Comandos Implementados

| Comando | Descrição |
|---------|-----------|
| `/map-codebase` | Analisa codebase com 4 agentes paralelos |
| `/project-stats` | Mostra estatísticas do projeto |
| `/quick` | Tarefa rápida com flags (`--discuss`, `--research`, `--full`) |
| `/user-profile` | Gera perfil comportamental do desenvolvedor |

### Flags do comando /quick

- `--discuss` - Discussão leve antes do planejamento
- `--research` - Pesquisa antes do planning
- `--full` - Plan-checking + verificação pós-execução

---

## Novos Agentes Criados

| Agente | Função |
|--------|--------|
| `codebase-mapper-tech` | Analisa stack e integrações |
| `codebase-mapper-arch` | Analisa arquitetura e estrutura |
| `codebase-mapper-quality` | Analisa convenções e testes |
| `codebase-mapper-concerns` | Identifica problemas conhecidos |

---

## Arquivos de Template

- `USER-PROFILE.md` - Template para perfil do desenvolvedor

---

## Como Usar

```bash
# Mapear codebase existente
/map-codebase api

# Ver estatísticas do projeto
/project-stats

# Tarefa rápida com qualidade
/quick --full add dark mode

# Gerar perfil do desenvolvedor
/user-profile
```

---

## Referências

- Skills Obsidian: `/json-canvas`, `/obsidian-bases`
- Análise de codebase: `/map-codebase`
- Stats: `/project-stats`
- Quick mode: `/quick`
- Perfil: `/user-profile`


---

*Enriquecido automaticamente pelo sistema de auto-documentação*