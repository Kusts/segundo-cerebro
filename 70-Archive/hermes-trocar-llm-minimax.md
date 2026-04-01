---
created: "2026-03-17T19:00:15.246864"
updated: "2026-03-18T13:38:39.856337"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🛠️ Hermes Gateway - Configuração e Troubleshooting Completo

**Data:** 2026-03-17  
**Status:** ✅ Funcionando  
**Bot Telegram:** @SynkrooClawBot

---

## 📋 Resumo da Configuração

| Item | Valor |
|------|-------|
| **Provider** | MiniMax |
| **Modelo** | MiniMax-M2.5 |
| **Gateway PID** | 637 |
| **Status** | Rodando |
| **Plataforma** | Telegram |

---

## 🔧 Problemas Identificados e Soluções

### 1. Processo `remoting_host.exe` travado (815% CPU)

**Sintoma:** Sistema lento, processo consumindo recursos excessivos.

**Causa:** Chrome Remote Desktop com processo travado em loop.

**Solução:**
```powershell
taskkill /F /IM remoting_host.exe
```

**⚠️ Atenção:** Se estiver usando Remote Desktop, reconecte após o kill.

---

### 2. WebView2 consumindo ~800MB RAM

**Sintoma:** Múltiplas instâncias do `msedgewebview2.exe` (14+ processos).

**Causa:** Apps Microsoft (Teams, Outlook, Office) criam instâncias órfãs.

**Solução:**
```powershell
taskkill /F /IM msedgewebview2.exe
```

**Prevenção:** Fechar apps Office/Teams quando não usar.

---

### 3. Plugins de IA do Obsidian consumindo RAM

**Plugins desabilitados:**
- `smart-connections` (embeddings)
- `smart-composer` (IA redundante)
- `obsidian-textgenerator-plugin` (IA redundante)
- `chatgpt-md` (IA redundante)
- `copilot` (IA redundante)

**Economia:** ~500MB-1GB RAM

**Arquivo modificado:**
```
C:\Users\walis\Documents\Obsidian\OpenClaw\.obsidian\community-plugins.json
```

---

### 4. API Key da MiniMax quebrada no `.env`

**Problema:** A chave da API estava dividida em DUAS LINHAS no arquivo `.env`:

```bash
# ❌ ERRADO (quebrado em 2 linhas)
MINIMAX_API_KEY=sk-cp-tQYxCzew8FQCINVVCpSjUalhZlCXP9Or2I5MrQaE10T1x2wj0Q12n_K5vmR6RL1PPell4aRI5MfQ7Puc1Ld5
RnkblkV3bXjMvvrkK8EYWg5fQc6rXXKb_hQ

# ✅ CORRETO (uma linha única)
MINIMAX_API_KEY=sk-cp-tQYxCzew8FQCINVVCpSjUalhZlCXP9Or2I5MrQaE10T1x2wj0Q12n_K5vmR6RL1PPell4aRI5MfQ7Puc1Ld5RnkblkV3bXjMvvrkK8EYWg5fQc6rXXKb_hQ
```

**Solução aplicada:**
```bash
# Copiar arquivo .env correto via Windows
copy C:\Users\walis\OneDrive\Desktop\claude_code\.env.backup \\wsl$\Ubuntu\home\junio\.hermes\.env
```

**Localização do arquivo:**
- Windows: `C:\Users\walis\.hermes\.env`
- WSL: `/home/junio/.hermes/.env`

---

### 5. Hermes Gateway não persistia

**Problema:** O gateway iniciava mas era encerrado quando o shell WSL terminava.

**Tentativas falhas:**
- `nohup python -m gateway.run &` → Morria ao fechar shell
- `disown` → Não persistia
- `tmux` → Sessão encerrada
- `systemd --user` → Erro 216/GROUP no WSL

**Solução definitiva:** Script com `setsid`

**Arquivo:** `/home/junio/start-gateway.sh`

```bash
#!/bin/bash
LOG_FILE="$HOME/.hermes/logs/gateway.log"
PID_FILE="$HOME/.hermes/gateway.pid"

# Verifica se já está rodando
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if ps -p "$OLD_PID" > /dev/null 2>&1; then
        echo "Gateway já está rodando (PID: $OLD_PID)"
        exit 0
    fi
fi

# Inicia o gateway com setsid (novo session leader)
cd "$HOME/.hermes/hermes-agent" || exit 1
source venv/bin/activate

setsid python -m gateway.run >> "$LOG_FILE" 2>&1 &
NEW_PID=$!

# Salva PID
echo "$NEW_PID" > "$PID_FILE"

echo "Gateway iniciado (PID: $NEW_PID)"

# Verifica se está rodando após 5s
sleep 5
if ps -p "$NEW_PID" > /dev/null 2>&1; then
    echo "Gateway rodando com sucesso"
else
    echo "Gateway falhou ao iniciar"
    rm -f "$PID_FILE"
    exit 1
fi
```

**Uso:**
```bash
wsl bash -c "~/start-gateway.sh"
```

---

## 📁 Arquivos de Configuração

### `.env` do Hermes

**Local:** `/home/junio/.hermes/.env`

```bash
HERMES_INFERENCE_PROVIDER=minimax
MINIMAX_API_KEY=sk-cp-tQYxCzew8FQCINVVCpSjUalhZlCXP9Or2I5MrQaE10T1x2wj0Q12n_K5vmR6RL1PPell4aRI5MfQ7Puc1Ld5RnkblkV3bXjMvvrkK8EYWg5fQc6rXXKb_hQ
MINIMAX_BASE_URL=https://api.minimax.io/v1
HERMES_MODEL=MiniMax-M2.5
LLM_MODEL=MiniMax-M2.5
TELEGRAM_API_ID=27631115
TELEGRAM_API_HASH=eb8269d8191d43fbffb301f371577723
TELEGRAM_BOT_TOKEN=7996859847:AAET55Dn_xnyfb9MqZ9P4G-WpoijN3f4urc
TELEGRAM_SESSION_NAME=hermes_session

OPENCLAW_BASE=/mnt/e/openclaw
MEMORY_SEARCH_ENABLED=true
GATEWAY_ALLOW_ALL_USERS=true
OBSIDIAN_VAULT_PATH=/mnt/c/Users/walis/Documents/Obsidian/OpenClaw
```

### `config.yaml` do Hermes

**Local:** `/home/junio/.hermes/config.yaml`

```yaml
gateway:
  allow_all_users: true
  session_storage: "/mnt/c/Users/walis/.hermes/sessions"
  platform: telegram

provider:
  name: minimax
  model: "MiniMax-M2.5"
  base_url: "https://api.minimax.io/v1"
```

---

## 🚀 Comandos Úteis

### Iniciar Hermes Gateway
```bash
wsl bash -c "~/start-gateway.sh"
```

### Verificar se está rodando
```bash
wsl bash -c "ps aux | grep 'python.*gateway' | grep -v grep"
```

### Ver logs em tempo real
```bash
wsl bash -c "tail -f ~/.hermes/logs/gateway.log"
```

### Parar o gateway
```bash
wsl bash -c "pkill -f 'python.*gateway'"
```

### Reiniciar o gateway
```b