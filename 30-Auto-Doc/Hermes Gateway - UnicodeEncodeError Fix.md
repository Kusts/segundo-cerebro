title: "Hermes Gateway - UnicodeEncodeError Fix"
date: 2026-03-17
status: resolved
category: solution
tags: [hermes, wsl2, utf-8, unicode, telegram, bugfix, gateway, python, auto-doc]
project: hermes
---

# Hermes Gateway - UnicodeEncodeError Fix

**Data:** 2026-03-17
**Status:** ✅ RESOLVIDO
**Categoria:** [[tech]] [[hermes]] [[bugfix]]

---
## @@ Notas Relacionadas

-


## Sintoma

Quando solicitado a realizar tarefas no Telegram (@SynkrooClawBot), o Hermes retornava:
```
Sorry, I encountered an unexpected error. The details have been logged for debugging. Try again or use /reset to start a fresh session.
```

## Causa Raiz

**UnicodeEncodeError:** O Hermes estava tentando imprimir caracteres Unicode (✅, ❌, ┊) mas o console Windows estava configurado com encoding CP1252 em vez de UTF-8.

```
UnicodeEncodeError: 'charmap' codec can't encode character '\u250a' in position 2: character maps to <undefined>
UnicodeEncodeError: 'charmap' codec can't encode character '\u274c' in position 0: character maps to <undefined>
```

## Solução

Forçar encoding UTF-8 ao iniciar o gateway:

```bash
export PYTHONIOENCODING=utf-8
export PYTHONLEGACYWINDOWSSTDIO=1
python -X utf8 gateway/run.py
```

## Scripts Criados

### ~/start_hermes_wsl.sh
Script principal de inicialização com correção UTF-8:
```bash
#!/bin/bash
HERMES_DIR="/e/hermes"
export PYTHONIOENCODING=utf-8
export PYTHONLEGACYWINDOWSSTDIO=1
nohup "$HERMES_DIR/.venv/Scripts/python.exe" -X utf8 gateway/run.py > ~/.hermes/logs/gateway.log 2>&1 &
```

### C:/Users/walis/restart_hermes_wsl.sh
Reinicia o Hermes rapidamente.

## Comandos Úteis

**Iniciar Hermes:**
```bash
~/start_hermes_wsl.sh
```

**Verificar status:**
```bash
ps -p $(cat ~/.hermes/gateway.pid) && echo "Rodando" || echo "Parado"
tail -f ~/.hermes/logs/gateway.log
```

**Reiniciar:**
```bash
C:/Users/walis/restart_hermes_wsl.sh
```

## Status Atual

- Gateway rodando no WSL2
- Telegram conectado e polling
- Encoding UTF-8 configurado
- Bot: @SynkrooClawBot

---

**Tags:** [[hermes]] [[wsl2]] [[utf-8]] [[unicode]] [[telegram]] [[bugfix]] [[gateway]]
---

## @@ Tags

#auto-doc #hermes #development
