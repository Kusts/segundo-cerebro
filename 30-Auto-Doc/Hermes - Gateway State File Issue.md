title: "Hermes - Gateway State File Issue"
date: 2026-03-17
status: resolved
category: solution
tags: [hermes, gateway-state, json, troubleshooting, bugfix, auto-doc]
project: hermes
---

# Hermes - Gateway State File Issue

**Data:** 2026-03-17
**Status:** ✅ RESOLVIDO
**Categoria:** [[tech]] [[hermes]] [[bugfix]]

---
## @@ Notas Relacionadas

-


## Problema

O `gateway_state.json` não refletia o estado real do gateway Hermes, mostrando erro antigo de "Another Telegram bot poller is already using this token" mesmo quando o gateway estava funcionando corretamente.

## Sintoma

Hermes reportava:
```
Gateway - O processo tá rodando (PID 11959), MAS:
- O gateway_state.json ainda mostra o erro do Telegram
- O Telegram tá em estado "fatal"
- O processo tá vivo mas o Telegram não conectou
```

## Causa Raiz

O processo 11959 era um "ghost process" - o processo Python existia mas o gateway tinha morrido anteriormente. O `gateway_state.json` não é atualizado dinamicamente pelo Hermes, precisa ser atualizado manualmente ou pelo processo na inicialização.

## Solução Aplicada

### 1. Matar processo ghost
```bash
kill 11959
```

### 2. Reiniciar gateway com UTF-8
```bash
cd /e/hermes
export PYTHONIOENCODING=utf-8
export PYTHONLEGACYWINDOWSSTDIO=1
nohup .venv/Scripts/python.exe -X utf8 gateway/run.py > ~/.hermes/logs/gateway.log 2>&1 &
```

### 3. Atualizar gateway_state.json manualmente
```json
{
  "pid": 373,
  "kind": "hermes-gateway",
  "argv": ["gateway\\run.py"],
  "start_time": 1773749935000,
  "gateway_state": "running",
  "exit_reason": null,
  "platforms": {
    "telegram": {
      "state": "connected",
      "updated_at": "2026-03-17T12:20:35.077000+00:00",
      "error_code": null,
      "error_message": null
    }
  },
  "updated_at": "2026-03-17T12:20:35.094000+00:00"
}
```

### 4. Atualizar PID file
```bash
echo "373" > ~/.hermes/gateway.pid
```

## Comandos para Verificar Estado Real

**Não confie apenas no gateway_state.json!**

Use estes comandos para verificação em tempo real:

```bash
# Verificar se processo existe
ps -p $(cat ~/.hermes/gateway.pid)

# Verificar logs recentes do Telegram
tail -50 ~/.hermes/logs/gateway.log | grep telegram

# Verificar última atividade
tail -1 ~/.hermes/logs/gateway.log

# Testar API do Telegram diretamente
curl -s "https://api.telegram.org/bot<TOKEN>/getMe"
```

## Estado Atual (Após Correção)

- ✅ Gateway rodando (PID: 373)
- ✅ Telegram conectado e polling
- ✅ UTF-8 configurado
- ✅ gateway_state.json sincronizado

## Scripts Úteis

**Verificar status completo:**
```bash
#!/bin/bash
echo "=== Hermes Gateway Status ==="
PID=$(cat ~/.hermes/gateway.pid 2>/dev/null)
if ps -p $PID > /dev/null 2>&1; then
    echo "✓ Gateway rodando (PID: $PID)"
else
    echo "✗ Gateway NÃO está rodando"
fi
echo ""
echo "=== Última atividade ==="
tail -1 ~/.hermes/logs/gateway.log
echo ""
echo "=== Estado JSON ==="
cat ~/.hermes/gateway_state.json | python -m json.tool 2>/dev/null || cat ~/.hermes/gateway_state.json
```

## Notas Importantes

1. **gateway_state.json é estático** - Não é atualizado em tempo real pelo Hermes
2. **Logs são a fonte de verdade** - Use `gateway.log` para verificação real
3. **Processo pode ser ghost** - Use `ps -p <PID>` para verificar se processo existe
4. **Atualização manual** - Se reiniciar o gateway, atualize o JSON manualmente

---

**Tags:** [[hermes]] [[gateway-state]] [[troubleshooting]] [[json]] [[bugfix]]
---

## @@ Tags

#auto-doc #hermes #tools
