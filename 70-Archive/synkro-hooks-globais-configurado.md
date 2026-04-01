---
created: "2026-03-17T12:05:45.783191"
updated: "2026-03-18T13:38:39.889582"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Synkro Project - Configuração de Hooks Globais

**Data:** 2026-03-17
**Status:** ✅ Configurado para usar hooks globais

## Problema

O projeto Synkro estava tentando criar/use suas próprias configurações locais em vez de usar os recursos globais do `claude_code`.

## Solução Implementada

### 1. Arquivo .clauderc

Criado `projects/Synkro/.clauderc` apontando para configurações globais:

```bash
# Caminho para o diretório .claude global
export CLAUDE_GLOBAL_ROOT="C:/Users/walis/OneDrive/Desktop/claude_code/.claude"

# Vault do Obsidian (Segundo Cérebro)
export OBSIDIAN_VAULT_PATH="C:/Users/walis/Documents/Obsidian/OpenClaw"

# Hooks usam configurações globais
export HERMES_HOME="C:/Users/walis/.hermes"
```

### 2. Hooks Copiados

Copiados 28 scripts Python de hooks globais para `Synkro/.claude/execution/`:

```bash
cp -r .claude/execution projects/Synkro/.claude/
```

### 3. Arquivos de Referência Criados

- `setup-global-config.bat` - Script para criar junctions no Windows
- `CLAUDE.md` - Documentação do projeto
- `copy_hooks_synkro.ps1` - Script PowerShell para copiar hooks

## Estrutura Final

```
claude_code/                 # Global (pai)
├── .claude/
│   ├── hooks/              ← Synkro usa estes
│   ├── skills/             ← Synkro usa estes
│   ├── agents/             ← Synkro usa estes
│   └── execution/          ← Copiado para Synkro
└── projects/
    └── Synkro/
        ├── .clauderc        ← Aponta para global
        └── .claude/
            └── execution/   ← Cópia dos hooks globais (28 arquivos)
```

## Manutenção

**Importante:** Quando atualizar os hooks globais, precisará copiar novamente:

```cmd
cd C:\Users\walis\OneDrive\Desktop\claude_code
xcopy /E /I /Y ".claude\execution" "projects\Synkro\.claude\execution"
```

## Scripts de Auxílio

| Arquivo | Propósito |
|---------|-----------|
| `setup-global-config.bat` | Criar junctions no Windows |
| `copy_hooks_synkro.ps1` | Copiar hooks via PowerShell |

## Alternativa Futura

Usar junctions do Windows para evitar cópia manual:

```cmd
mklink /J projects\Synkro\.claude\hooks .claude\hooks
mklink /J projects\Synkro\.claude\skills .claude\skills
mklink /J projects\Synkro\.claude\agents .claude\agents
```

## Tags

synkro, hooks, global-config, claude-code, windows, junction


---

*Enriquecido automaticamente pelo sistema de auto-documentação*