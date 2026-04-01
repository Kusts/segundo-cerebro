---
created: "2026-03-17T19:34:40.038225"
updated: "2026-03-18T13:38:39.751921"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
## @@ Notas Relacionadas

-

# 🚀 Hermes - Inicialização Rápida

**Data:** 2026-03-17  
**Status:** ✅ **PRONTO PARA USO**

---

## ⚡ Comandos Rápidos

### Iniciar Hermes
```bash
wsl bash -c "~/start-gateway.sh"
```

### Verificar status
```bash
wsl bash -c "ps aux | grep gateway | grep -v grep"
```

### Ver logs em tempo real
```bash
wsl bash -c "tail -f ~/.hermes/logs/gateway.log"
```

### Parar Hermes
```bash
wsl bash -c "pkill -f 'python.*gateway'"
```

### Reiniciar Hermes
```bash
wsl bash -c "pkill -f 'python.*gateway' && sleep 2 && ~/start-gateway.sh"
```

---

## 🧠 Verificar Memória

### Diagnóstico completo
```bash
wsl bash -c "python3 ~/diagnostico.py"
```

### Apenas memória
```bash
wsl bash -c "python3 ~/verify-memory.py"
```

### Sincronizar memórias
```bash
wsl bash -c "python3 ~/sync-memory.py"
```

---

## 📊 Status Atual

| Recurso | Status |
|---------|--------|
| Gateway | ✅ Rodando |
| Telegram | ✅ Conectado |
| Memória Chroma | ✅ 507 embeddings |
| Memória Markdown | ✅ 6 arquivos |
| MiniMax API | ✅ Funcionando |
| OpenClaw | ✅ Integrado |
| ARES | ✅ Ativo |

---

## 📝 Testar Bot

1. **Abrir Telegram**
2. **Buscar:** @SynkrooClawBot
3. **Enviar:** `/start`
4. **Testar memória:** "O que é ARES?"

---

## 🛠️ Scripts Disponíveis

| Script | Função |
|--------|--------|
| `~/start-gateway.sh` | Inicia o Hermes Gateway |
| `~/diagnostico.py` | Diagnóstico completo |
| `~/verify-memory.py` | Verificar memória |
| `~/sync-memory.py` | Sincronizar memórias |

---

## 📁 Arquivos de Configuração

| Arquivo | Localização |
|---------|-------------|
| `config.yaml` | `~/.hermes/config.yaml` |
| `.env` | `~/.hermes/.env` |
| `gateway.log` | `~/.hermes/logs/gateway.log` |

---

## 🔗 Links Úteis

- **Documentação Hermes:** https://hermes-agent.nousresearch.com/docs/
- **Documentação MiniMax:** https://platform.minimax.io/
- **API Telegram:** https://core.telegram.org/bots/api

---

**Última atualização:** 2026-03-17  
**Próxima revisão:** 2026-03-24


---

*Enriquecido automaticamente pelo sistema de auto-documentação*
---

## @@ Tags

#auto-doc #hermes #tools
