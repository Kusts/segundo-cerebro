---
created: "2026-03-17T11:05:27.677512"
updated: "2026-03-18T13:38:39.823013"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Hermes Agent - Scheduler Funcionando

**Data:** 2026-03-17
**Status:** ✅ Funcionando corretamente

## Problema Investigado

Hermes detectou:
- Scheduler não está rodando
- Cron do Linux não disponível

## Conclusão

**NÃO precisa de correção!** O Hermes tem seu próprio scheduler em Python (`cron/scheduler.py`) que funciona independentemente do cron do Linux.

## Status Atual

| Componente | Status |
|------------|--------|
| Gateway | ✅ Rodando (PID 373) |
| Scheduler | ✅ Integrado no gateway (tick a cada 60s) |
| MiniMax-M2.5 | ✅ Configurado e funcionando |
| Jobs Agendados | 10 jobs |
| Delivery Telegram | ✅ Funcionando |

## Como Funciona

1. Gateway roda em background
2. A cada 60 segundos, chama `cron.scheduler.tick()`
3. Verifica jobs em `~/.hermes/cron/openclaw/jobs.json`
4. Executa jobs due em sessões isoladas
5. Entrega resultados via Telegram

## Jobs

- `google-oauth-warmup`: ✅ OK (última: 11:55)
- Demais jobs: Alguns com erros de execução, mas notificação enviada

## Comandos Úteis

```bash
# Ver status do scheduler
hermes cron status

# Listar jobs
hermes cron list

# Ver jobs agendados
cat ~/.hermes/cron/openclaw/jobs.json | jq

# Ver logs
tail -f ~/.hermes/logs/gateway.log
```

## Localização

- Código: `E:\hermes\cron\scheduler.py`
- Jobs: `~/.hermes/cron/openclaw/jobs.json`
- Logs: `~/.hermes/logs/gateway.log`
- Config: `~/.hermes/config.yaml`

## Arquivos de Correção Criados

Scripts de referência (não necessários pois já funciona):
- `fix_hermes_scheduler.bat` - Script de correção Windows
- `fix_hermes_scheduler.sh` - Script de correção WSL2
- `hermes_cli_path_setup.sh` - Setup do comando hermes no PATH
- `setup_hermes_wsl2.bat` - Setup automático via WSL2
- `HERMES_SCHEDULER_FIX.md` - Documentação técnica
- `HERMES_WSL2_INSTRUCTIONS.md` - Instruções WSL2

## Notas Importantes

1. O scheduler do Hermes **NÃO depende** do cron do Linux
2. Usa arquivo de lock (`~/.hermes/cron/.tick.lock`) para evitar duplicação
3. Jobs com "error" no estado ainda entregam notificação via Telegram
4. O gateway deve estar rodando para o scheduler funcionar

## Tags

hermes, scheduler, cron, miniMax, telegram, jobs, windows, wsl2


---

*Enriquecido automaticamente pelo sistema de auto-documentação*