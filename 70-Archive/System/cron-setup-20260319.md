---
type: knowledge
category: system
created: 2026-03-19
tags: [hermes, cron, ares, telegram]
---

# Cron Setup — 2026-03-19

## Mudanças Feitas

### 1. Removido: Análise de Livros
Jobs de análise de livro removidos do crontab:
- Removido: `analise_livro_completa.py` (06h, 10h, 17h)

### 2. ARES agora no Crontab (1h)
Crontab agora só tem ARES:
```
0 * * * * /usr/bin/python3 /home/junio/.hermes/ares/scheduler.py >> /home/junio/.hermes/logs/ares_scheduler.log 2>&1
```
Rodando a cada hora, no minuto 0.

### 3. Correção Telegram (send_telegram_report.py)

**Problema:** Erro `can't parse entities` — Markdown invalido no offset 1905.

**Solução:**
- Mudou `parse_mode` de `Markdown` para `HTML`
- Convertido mensagem para tags HTML (`<b>`, `<i>`)
- Adicionado `escape_html()` para escapar caracteres especiais no relatório

## Crontab Atual

```
0 * * * * /usr/bin/python3 /home/junio/.hermes/ares/scheduler.py >> /home/junio/.hermes/logs/ares_scheduler.log 2>&1
```

## Cron Interno Hermes

3 jobs (heartbeat-am, heartbeat-pm, heartbeat-night) rodam via scheduler interno do Hermes.

## Arquivos Modificados

- `/home/junio/.hermes/ares/send_telegram_report.py` — HTML mode + escape
