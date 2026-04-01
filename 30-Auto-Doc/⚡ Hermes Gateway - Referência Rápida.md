---
created: "2026-03-17T19:00:22.753382"
updated: "2026-03-18T13:38:39.805542"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
## @@ Notas Relacionadas

-

# ⚡ Hermes Gateway - Referência Rápida

**Bot:** @SynkrooClawBot  
**Status:** ✅ Rodando  
**PID:** 637

---

## 🚀 Comandos Rápidos

### Iniciar
```bash
wsl bash -c "~/start-gateway.sh"
```

### Verificar status
```bash
wsl bash -c "ps aux | grep gateway | grep -v grep"
```

### Ver logs
```bash
wsl bash -c "tail -f ~/.hermes/logs/gateway.log"
```

### Parar
```bash
wsl bash -c "pkill -f 'python.*gateway'"
```

### Reiniciar
```bash
wsl bash -c "pkill -f 'python.*gateway' && sleep 2 && ~/start-gateway.sh"
```

---

## 🔧 Configuração Principal

**Arquivo:** `/home/junio/.hermes/.env`

```bash
HERMES_INFERENCE_PROVIDER=minimax
MINIMAX_API_KEY=sk-cp-tQYxCzew8FQCINVVCpSjUalhZlCXP9Or2I5MrQaE10T1x2wj0Q12n_K5vmR6RL1PPell4aRI5MfQ7Puc1Ld5RnkblkV3bXjMvvrkK8EYWg5fQc6rXXKb_hQ
MINIMAX_BASE_URL=https://api.minimax.io/v1
LLM_MODEL=MiniMax-M2.5
```

---

## ⚠️ Problemas Comuns

| Problema | Solução |
|----------|---------|
| Bot não responde | `~/start-gateway.sh` |
| Erro 401 | Verificar API key (125 chars, 1 linha) |
| Gateway para | Usar script com `setsid` |
| Sistema lento | `taskkill /F /IM remoting_host.exe` |

---

## 📊 Recursos Atuais

| Recurso | Uso |
|---------|-----|
| CPU | 4% ✅ |
| RAM Livre | 7.68 GB ✅ |
| Disco C: | 26 GB livre ⚠️ |

---

**Documentação completa:** `hermes-gateway-configuracao-completa.md`


---

*Enriquecido automaticamente pelo sistema de auto-documentação*
---

## @@ Tags

#auto-doc #hermes #tools
