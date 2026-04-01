---
tags: [config, brain, pkm, auto-consulta, obsidian]
date: 2026-03-17
type: config
---

# Sistema de Auto-Consulta do Segundo Cérebro

## Visão Geral

O sistema de auto-consulta permite que o Claude Code automaticamente consulte o Obsidian antes de responder, quando detecta padrões que indicam necessidade de contexto adicional.

## Arquitetura

### Componentes Principais

1. **auto_brain_pre_response.py** - Hook que executa antes de cada resposta
2. **obsidian_brain.py** - Módulo de busca e manipulação do vault
3. **Hooks no settings.local.json** - Configuração dos hooks

### Fluxo de Execução

```
User Prompt → PreToolUse Hook → auto_brain_pre_response.py
→ obsidian_brain.search() → Contexto retornado → Claude responde
```

---

## Configuração

### Hooks Configurados (settings.local.json)

```json
{
  "PreToolUse": [
    {
      "type": "command",
      "command": "python .claude/execution/hook_brain_context.py"
    },
    {
      "type": "command",
      "command": "python .claude/execution/auto_brain_pre_response.py"
    }
  ]
}
```

---

## Padrões de Detecção

### Palavras que ativam a consulta

- **Erros:** erro, bug, problema, falha, exception
- **Ações:** como fazer, como usar, implementar
- **Decisões:** decidir, melhor, arquitetura, solução
- **Perguntas:** o que é, onde encontrar, qual melhor

### Exemplos de Ativação

| Prompt | Ativa Consulta? |
|--------|----------------|
| "como corrigir erro de telegram" | ✅ |
| "melhor arquitetura para API" | ✅ |
| "o que é JWT?" | ✅ |
| "crie um arquivo" | ❌ |
| "liste os arquivos" | ❌ |

---

## Método search()

### Localização

`.claude/execution/obsidian_brain.py`

### Funcionalidades

1. **Busca por relevância**
   - Peso 5x para títulos
   - Peso 3x para tags
   - Peso 1x para conteúdo

2. **Bônus de Recência**
   - Arquivos mais recentes têm prioridade
   - Bônus de até 50% para arquivos < 1 ano

3. **Snippets Contextuais**
   - Extrai contexto ao redor das palavras-chave
   - Máximo 200 caracteres por resultado

### Uso

```python
from obsidian_brain import ObsidianVault

vault = ObsidianVault('C:/Users/walis/Documents/Obsidian/OpenClaw')
results = vault.search('telegram', limit=5)

for r in results:
    print(f"- {r['title']} (score: {r['relevance']:.1f})")
    print(f"  {r['rel_path']}")
    print(f"  {r['content'][:100]}...")
```

---

## Resultados de Exemplo

### Busca por "telegram"

```
- 📚 API Telegram OpenClaw - Endpoints (score: 21.7)
  03-Knowledge/Reference/api-telegram-openclaw-endpoint-3fd734fb.md
 snippet...

- 📚 Módulo de Ingestão Telegram - Pyrogram (score: 15.9)
  03-Knowledge/General/módulo-de-ingestão-telegram-pyrogram.md
  snippet...
```

### Busca por "JWT authentication"

```
- Sprint 2 - Autenticação Real (score: 12.0)
  04-Projetos/Synkroo/Sprint-02-Autenticacao-Real.md
  snippet...

- 2026-03-12 - Sessão de Auto-Aprendizado (score: 7.9)
  01-Daily/2026-03-12.md
  snippet...
```

---

## Integração com Claude Code

### Variáveis de Ambiente

- `CLAUDE_USER_PROMPT` - Prompt do usuário
- `CLAUDE_TOOL_NAME` - Ferramenta sendo usada
- `CLAUDE_TOOL_RESULT` - Resultado da ferramenta

### Hook de Pre-Tool Use

Arquivo: `.claude/execution/auto_brain_pre_response.py`

```python
def main():
    user_prompt = os.environ.get("CLAUDE_USER_PROMPT", "")

    # Detecta se deve consultar
    should_consult = any(p in user_prompt.lower() for p in PATTERNS)

    if should_consult:
        vault = ObsidianVault(VAULT_PATH)
        results = vault.search(user_prompt[:50], limit=3)
        # Retorna contexto formatado
```

---

## Acessos ao Obsidian

### 1. Python (obsidian_brain.py)
- Busca avançada
- Criação de notas
- Gestão de projetos

### 2. PowerShell (obsidian.ps1)
- Invoke-ObsidianOpen
- Invoke-ObsidianCreate
- Invoke-ObsidianDailyAppend

### 3. MCP Server
- Configurado em settings.local.json
- Servidor: obsidian-mcp

---

## Comandos Disponíveis

| Comando | Descrição |
|---------|-----------|
| `/brain-search "termo"` | Busca conhecimento |
| `/brain-ask "pergunta"` | Pergunta ao cérebro |
| `/brain-capture "ideia"` | Captura rápida no Inbox |
| `/brain-stats` | Estatísticas do brain |

---

## Histórico

- **2026-03-17:** Sistema implementado com busca por relevância
- Problema original: método search() não existia
- Solução: implementado método com pesos e bônus de recência

---

## Referências

- Arquivo principal: `.claude/execution/obsidian_brain.py`
- Hook: `.claude/execution/auto_brain_pre_response.py`
- Configuração: `.claude/settings.local.json`
- Vault: `C:/Users/walis/Documents/Obsidian/OpenClaw`
