---
type: knowledge
id: configurações-e-setup-claude-c-33f4d74e
category: System
created: 2026-03-07
tags: [knowledge, System, auto-generated]
---

# 📚 Configurações e Setup - Claude Code

# Configurações e Setup - Claude Code

## Configuração Global

### Arquivo: `.claude/CLAUDE.md`

Este arquivo define o padrão operacional para todas as sessões de desenvolvimento do Claude Code.

**Versão:** 3.0
**Data:** 2026-03-02

### Preferências Globais

**Recursos Globais** devem ser:
- Instalados globalmente em `.claude/`
- Funcionais em qualquer projeto
- Fáceis de acessar e usar

### Estrutura Global

```
.claude/                      # Recursos globais
├── agents/                   # Agentes especializados
├── commands/                 # Comandos personalizados
├── skills/                   # Skills especializadas
├── directives/               # SOPs e diretivas
├── execution/                # Scripts Python
├── memory/                   # Memória persistente
└── CLAUDE.md                 # Instruções globais

projects/                     # Projetos específicos
├── Synkroo/
│   └── .claude/
│       └── settings.local.json
└── [outros projetos]/
```

## Configuração de Vault Oficial

### Arquivo: `.claude/brain_config.json`

```json
{
  "brain": {
    "vault_path": "C:/Users/walis/Documents/Obsidian/OpenClaw",
    "description": "Vault oficial do Segundo Cérebro",
    "auto_index": true,
    "auto_document": true
  },
  "sessions": {
    "vault_path": "C:/Users/walis/Documents/Obsidian/OpenClaw",
    "auto_export": true
  },
  "obsidian": {
    "vault_path": "C:/Users/walis/Documents/Obsidian/OpenClaw",
    "default_vault": true
  }
}
```

**SEMPRE usar este caminho:**
```
C:/Users/walis/Documents/Obsidian/OpenClaw
```

## Configuração de Subprojetos

Para projetos em subpastas, criar `.claude/settings.local.json`:

```json
{
  "contextImports": [
    "../.claude/CLAUDE.md"
  ],
  "mcpServers": {
    "supabase": {
      "enabled": true
    }
  }
}
```

## Configurações de Skills

As skills são configuradas via YAML frontmatter:

```yaml
---
name: skill-name
description: Descrição da skill
version: 1.0.0
author: Autor
tags: [tag1, tag2]
---
```

## Configurações de Comandos

Comandos são arquivos `.md` em `.claude/commands/`:

```markdown
---
name: command-name
description: Descrição do comando
---

Conteúdo do comando...
```

## Configurações de Agentes

Agentes Python são configurados via `AgentConfig`:

```python
from core import AgentConfig

config = AgentConfig(
    enable_auto_resource_selection=True,
    enable_auto_expansion=True,
    max_reflections=3,
    timeout=300
)
```

## MCPs Configurados

### MCP Supabase

Operações de banco de dados PostgreSQL.

### MCP Playwright

Testes E2E e validação de UI.

### MCP Sequential-Thinking

Raciocínio complexo.

## Variáveis de Ambiente

### Python Path

No Windows, use `py` em vez de `python`:

```bash
py script.py
```

### UTF-8 Encoding

O sistema inclui fix UTF-8 para Windows:

```python
if sys.platform == "win32":
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')
```

## Configuração do Git

### .gitignore

Arquivos e diretórios ignorados:

```
.claude/sessions/
.claude/.tmp/
.env.local
*.log
```

## Setup Inicial

### 1. Clonar Repositório

```bash
git clone <repo-url>
cd <projeto>
```

### 2. Configurar Vault

```bash
# Criar/configurar brain_config.json
python .claude/execution/brain_core.py -v "C:/Users/walis/Documents/Obsidian/OpenClaw" rebuild-index
```

### 3. Testar Sistema

```bash
# Testar session manager
python .claude/execution/session_manager.py start "Teste"

# Testar brain core
python .claude/execution/brain_core.py -v "C:/Users/walis/Documents/Obsidian/OpenClaw" stats
```

## Troubleshooting

### Python não encontrado

Use `py` em vez de `python` no Windows.

### Vault não encontrada

Verifique `.claude/brain_config.json` e ajuste o caminho.

### Emojis não aparecem

O fix UTF-8 deve resolver. Verifique encoding do terminal.

### Sessão não é salva

Verifique se `.claude/sessions/` existe e tem permissões de escrita.

## Links Importantes

- **Vault Oficial:** `C:/Users/walis/Documents/Obsidian/OpenClaw`
- **Workspace:** `C:/Users/walis/OneDrive/Desktop/claude_code/`
- **OpenClaw:** `E:/openclaw/`
- **Synkroo:** `projects/Synkroo/`


## 📊 Metadados

**Criado:** 2026-03-07 13:53
**Categoria:** System
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
