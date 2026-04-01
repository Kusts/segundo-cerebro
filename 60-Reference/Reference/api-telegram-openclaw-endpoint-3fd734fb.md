---
type: knowledge
id: api-telegram-openclaw-endpoint-3fd734fb
category: Reference
created: 2026-03-07
tags: [knowledge, Reference, auto-generated]
---

# 📚 API Telegram OpenClaw - Endpoints

# API Telegram do OpenClaw

## Visão Geral

O OpenClaw integra com Telegram através de uma API REST completa para processamento de vídeos e mensagens.

## Base URL

```
http://localhost:5000
```

## Endpoints Disponíveis

### Health Check

```
GET /api/health
```

Retorna status da API.

### Cache Management

```
GET /api/cache
POST /api/cache/clear
```

- **Cache TTL:** 1 hora (3600s)

### Channels

```
GET /api/channels
```

Lista todos os canais configurados.

### Vídeos Telegram

```
GET /api/channels/<id>/videos
```

Retorna metadados de vídeos de um canal.

### Operações com Vídeos

```
GET /api/videos/<id>/<msg>/info           # Info instantânea
GET /api/videos/<id>/<msg>/preview        # Preview rápido
GET /api/videos/<id>/<msg>/transcribe     # Transcrição áudio
GET /api/videos/<id>/<msg>/comments       # Análise comentários
GET /api/videos/<id>/<msg>/analyze-utility # Utilidade frames
GET /api/videos/<id>/<msg>/analyze-full     # Análise completa
```

### Batch Operations

```
POST /api/videos/preview-batch
```

Preview em lote de múltiplos vídeos.

## Exemplos de Uso

### Listar vídeos de um canal

```bash
curl http://localhost:5000/api/channels/123456/videos
```

### Obter info de vídeo

```bash
curl http://localhost:5000/api/videos/123456/789/info
```

### Transcrição de áudio

```bash
curl http://localhost:5000/api/videos/123456/789/transcribe
```

## Problemas Conhecidos

### Lentidão de Downloads

- **Velocidade:** ~0.95 MB/s em Windows
- **Sintoma:** Arquivos MP4 corrompidos ("moov atom not found")
- **Solução:** Cache agressivo, timeouts otimizados, download parcial


## 📊 Metadados

**Criado:** 2026-03-07 14:14
**Categoria:** Reference
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
