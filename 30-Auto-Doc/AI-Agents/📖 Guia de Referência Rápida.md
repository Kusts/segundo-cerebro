---
created: "2026-03-12T17:16:04.332819"
updated: "2026-03-18T13:38:39.087230"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 📖 Guia de Referência Rápida

## Comandos Claude Code

### Sessões

```markdown
/session-start "Tarefa principal"
/session-status
/session-note "Nota importante"
/session-complete "Resumo do realizado"
/session-list
/session-resume
```

### Segundo Cérebro

```markdown
/brain-search "termo"
/brain-ask "pergunta"
/brain-stats
/brain-capture "ideia rápida"
/brain-knowledge "Título" "Conteúdo"
/brain-project "Nome" "Descrição"
```

## Scripts Python

### Session Manager

```bash
python .claude/execution/session_manager.py start "Tarefa"
python .claude/execution/session_manager.py step "Ação" "Detalhes" -s completed
python .claude/execution/session_manager.py complete -s "Resumo"
```

### Brain Core

```bash
python .claude/execution/brain_core.py -v "C:/Users/walis/Documents/Obsidian/OpenClaw" search "termo"
python .claude/execution/brain_core.py -v "C:/Users/walis/Documents/Obsidian/OpenClaw" ask "pergunta"
python .claude/execution/brain_core.py -v "C:/Users/walis/Documents/Obsidian/OpenClaw" stats
```

## Caminhos

```bash
# Vault Oficial
C:/Users/walis/Documents/Obsidian/OpenClaw

# OpenClaw
E:/openclaw/

# Iniciar OpenClaw
cd E:/openclaw
node openclaw.mjs gateway run --port 18789 --allow-unconfigured
```

## URLs

```
Gateway OpenClaw: http://127.0.0.1:18789
API Telegram: http://localhost:5000
Bot: @SynkrooClawBot
```

## Estrutura de Arquivos

```
.claude/
├── execution/
│   ├── session_manager.py
│   ├── brain_core.py
│   └── obsidian_brain.py
├── agents/
│   ├── research_agent.py
│   ├── coder_agent.py
│   └── [10 mais]
├── commands/
│   ├── session-*.md
│   └── brain-*.md
└── brain_config.json
```

## Vault Structure

```
OpenClaw/
├── 00-Inbox/
├── 01-Projects/
├── 02-Planning/
├── 03-Knowledge/
│   ├── Architecture/
│   ├── System/
│   └── Project/
├── 04-Solutions/
└── .brain/
    ├── index.json
    └── activity.log
```

## Troubleshooting

### Python não encontrado

Use `py` em vez de `python` no Windows.

### Emojis não aparecem

O sistema inclui fix UTF-8 para Windows.

### Vault não encontrada

Verifique `.claude/brain_config.json` e ajuste o caminho.

### Sessão não é salva

Verifique se `.claude/sessions/` existe e tem permissões de escrita.

## Tags Úteis

- `#knowledge` - Para documentação permanente
- `#solution` - Para soluções de problemas
- `#project` - Para projetos
- `#system` - Para sistema e configuração

---

*Guia de referência rápida v1.0*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*