---
type: knowledge
id: openclaw-soluções-e-problemas--37996d2a
category: Solutions
created: 2026-03-07
tags: [knowledge, Solutions, auto-generated]
---

# 📚 OpenClaw - Soluções e Problemas Conhecidos


## Soluções Registradas - OpenClaw

### Python/Telegram

#### Bug: `name 'max_bytes' is not defined`

**Data:** 2026-03-07
**Arquivo:** `openclaw/telegram_api_stream.py`

**Problema:**
Variável `max_bytes` definida dentro de bloco `try` mas usada fora dele.

**Solução:**
Mover definição de `max_bytes` para escopo da função (antes do `try`).

**Tags:** python, telegram, scope, bugfix

---

#### Lentidão Download Telegram

**Data:** 2026-03-07

**Problema:**
Downloads do Telegram muito lentos (~0.95 MB/s) em ambiente Windows.

**Sintomas:**
- Arquivos MP4 corrompidos ("moov atom not found")
- Downloads demorados mesmo após longo tempo

**Solução:**
Implementar:
- Cache agressivo
- Timeouts otimizados
- Estratégias de download parcial
- Retry automático

**Tags:** telegram, performance, download, windows

---

## API Endpoints - Telegram Videos

### Base URL

```
http://localhost:5000
```

### Endpoints

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/api/health` | Health check |
| GET | `/api/cache` | Info do cache |
| POST | `/api/cache/clear` | Limpar cache |
| GET | `/api/channels` | Listar canais |
| GET | `/api/channels/<id>/videos` | Metadados de vídeos |
| GET | `/api/videos/<id>/<msg>/info` | Info instantânea |
| GET | `/api/videos/<id>/<msg>/preview` | Preview rápido |
| GET | `/api/videos/<id>/<msg>/transcribe` | Transcrição áudio |
| GET | `/api/videos/<id>/<msg>/comments` | Análise comentários |
| GET | `/api/videos/<id>/<msg>/analyze-utility` | Utilidade frames |
| GET | `/api/videos/<id>/<msg>/analyze-full` | Análise completa |
| POST | `/api/videos/preview-batch` | Preview em lote |

### Cache

**TTL:** 1 hora (3600s)

Use o endpoint `/api/cache/clear` para limpar o cache manualmente.

**Tags:** openclaw, telegram, api, endpoints


## 📊 Metadados

**Criado:** 2026-03-07 13:45
**Categoria:** Solutions
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
