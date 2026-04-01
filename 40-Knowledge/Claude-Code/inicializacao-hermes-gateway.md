---
tags:
  - hermes
  - gateway
  - agent
  - wsl
  - ubuntu
  - inicialização
  - 2026-03-16
created: 2026-03-16T22:25:00
---

# Inicialização do Hermes Gateway e Agent - 2026-03-16

## 📋 Resumo

Reinicialização do Gateway e Agent do Hermes no WSL2 Ubuntu.

---

## ✅ Status

**Status:** ✅ **CONCLUÍDO**

**Data:** 2026-03-16 22:25

**Gateway:** ✅ Rodando (PID 384)

**Agent:** ⚠️ Modo interativo (requer input)

---

## 🔧 Comandos Executados

### 1. Parar Processos Existentes

```bash
pkill -f 'hermes'
pkill -f 'gateway'
```

### 2. Iniciar Gateway

```bash
cd ~/.hermes/hermes-agent
source venv/bin/activate
python hermes gateway &
```

### 3. Iniciar Agent

```bash
cd ~/.hermes/hermes-agent
source venv/bin/activate
python hermes &
```

---

## 📝 Script de Inicialização

Criado script `~/start_hermes.sh`:

```bash
#!/bin/bash
HERMES_DIR="$HOME/.hermes/hermes-agent"
VENV_DIR="$HERMES_DIR/venv"
LOG_DIR="$HOME/.hermes/logs"

mkdir -p "$LOG_DIR"
source "$VENV_DIR/bin/activate"
cd "$HERMES_DIR"

nohup python hermes gateway > "$LOG_DIR/gateway.log" 2>&1 &
nohup python hermes > "$LOG_DIR/agent.log" 2>&1 &

echo "Gateway PID: $!"
echo "Agent PID: $!"
```

**Uso:**
```bash
~/start_hermes.sh
```

---

## 📊 Status dos Processos

| Processo | PID | Status | Log |
|----------|-----|--------|-----|
| **Gateway** | 384 | ✅ Rodando | `~/.hermes/logs/gateway.log` |
| **Agent** | - | ⚠️ Interativo | `~/.hermes/logs/agent.log` |

---

## 🔍 Verificação

### Verificar Processos

```bash
ps aux | grep -E 'python.*hermes' | grep -v grep
```

### Verificar Logs

```bash
# Gateway
tail -f ~/.hermes/logs/gateway.log

# Agent
tail -f ~/.hermes/logs/agent.log
```

### Output do Gateway

```
╭──────────────────────────────────────────────────────────────────────────────╮
│  Hermes Agent v0.2.0                                                         │
│                                                                              │
│  Skills: 679                                                                 │
│  Tools: 27                                                                   │
│                                                                              │
│  Query: gateway                                                              │
╰──────────────────────────────────────────────────────────────────────────────╯
```

---

## 🛠️ Comandos Úteis

### Parar Hermes

```bash
pkill -f 'hermes'
```

### Reiniciar

```bash
~/start_hermes.sh
```

### Ver Status

```bash
ps aux | grep hermes
```

---

## 📁 Estrutura de Diretórios

```
~/.hermes/
├── hermes-agent/          # Código principal
│   ├── venv/              # Virtual environment
│   ├── hermes_cli/        # CLI do Hermes
│   └── ...
├── logs/                  # Logs (gateway.log, agent.log)
├── sessions/              # Sessões
├── skills/                # Skills
└── config.yaml            # Configuração
```

---

## 🔗 Links Relacionados

- **Diretório:** `~/.hermes/hermes-agent`
- **Logs:** `~/.hermes/logs/`
- **Script:** `~/start_hermes.sh`

---

*Nota criada durante sessão de reinicialização do Hermes*
