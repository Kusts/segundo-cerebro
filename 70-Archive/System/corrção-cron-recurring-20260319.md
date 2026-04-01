---
type: knowledge
category: system
created: 2026-03-19
tags: [hermes, cron, bug-fix, devops]
---

# Correção Cron Recurring — 2026-03-19

## Problema

Jobs com `kind: "recurring"` não recalculavam `next_run_at` após execução.

**Sintomas:**
- `last_run_at: null` em todos os jobs (nunca executaram)
- Erro ao listar jobs: `'list' object has no attribute 'get'`
- Jobs ficavam "due" sempre após executar

## Bugs Encontrados

### Bug 1: compute_next_run não suportava recurring

`cron/jobs.py` — função `compute_next_run()` só tratava `once`, `interval` e `cron`. Retornava `None` para `recurring`.

### Bug 2: jobs.json formato errado

O arquivo estava salvo como lista `[...]` mas `load_jobs()` esperava dict com chave `"jobs"`.

## Solução

### 1. Corrigir compute_next_run (cron/jobs.py)

Adicionado bloco para `kind == "recurring"`:

```python
elif schedule["kind"] == "recurring":
    time_str = schedule.get("time", "09:00")
    hour, minute = map(int, time_str.split(":"))
    tz_name = schedule.get("timezone", "UTC")
    try:
        from zoneinfo import ZoneInfo
        job_tz = ZoneInfo(tz_name)
    except Exception:
        job_tz = timezone.utc
    next_run = now.astimezone(job_tz).replace(hour=hour, minute=minute, second=0, microsecond=0)
    if next_run <= now.astimezone(job_tz):
        next_run += timedelta(days=1)
    return next_run.isoformat()
```

Import alterado para incluir `timezone`:
```python
from datetime import datetime, timedelta, timezone
```

### 2. Corrigir jobs.json

```python
import json
with open('/home/junio/.hermes/cron/jobs.json', 'r') as f:
    raw = json.load(f)
if isinstance(raw, list):
    wrapped = {"jobs": raw, "updated_at": datetime.now().isoformat()}
    with open('/home/junio/.hermes/cron/jobs.json', 'w') as f:
        json.dump(wrapped, f, indent=2)
```

## Estado Final

| Job | Proximo Agendamento |
|-----|---------------------|
| heartbeat-am | 2026-03-20 09:00 |
| heartbeat-pm | 2026-03-19 14:00 |
| heartbeat-night | 2026-03-19 21:00 |

Todos executaram às 11:03-11:04 em 2026-03-19 (primeira execução real).

## Referências

- Skill: `~/.hermes/skills/devops/cron-recurring-fix/SKILL.md`
- Arquivo corrigido: `/home/junio/.hermes/hermes-agent/cron/jobs.py`
