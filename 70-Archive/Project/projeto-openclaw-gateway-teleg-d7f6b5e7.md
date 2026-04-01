---
type: knowledge
id: projeto-openclaw-gateway-teleg-d7f6b5e7
category: Project
created: 2026-03-07
tags: [knowledge, Project, auto-generated]
---

# 📚 Projeto OpenClaw - Gateway Telegram

# Projeto OpenClaw

## Visão Geral

**Localização:** `E:/openclaw/`
**Status:** Ativo
**Versão:** Development

OpenClaw é um gateway/sistema de skills para Telegram Bot com integrações de IA.

## Inicialização

```bash
cd E:/openclaw
node openclaw.mjs gateway run --port 18789 --allow-unconfigured
```

## URLs e Endpoints

| Serviço | URL |
|---------|-----|
| Gateway | http://127.0.0.1:18789 |
| API Telegram | http://localhost:5000 |
| Bot Telegram | @SynkrooClawBot |

## Estrutura do Projeto

```
E:/openclaw/
├── openclaw.mjs           # Entry point principal
├── package.json           # Dependências Node.js
├── telegram_api_stream.py # API stream para Telegram
└── [outros arquivos]
```

## API de Vídeos Telegram

### Base URL

```
http://localhost:5000
```

### Endpoints Implementados

#### Health Check

```
GET /api/health
```

#### Cache Management

```
GET /api/cache           # Info do cache
POST /api/cache/clear    # Limpar cache
```

**Cache TTL:** 1 hora (3600s)

#### Channels

```
GET /api/channels        # Listar canais
```

#### Vídeos

```
GET /api/channels/<id>/videos              # Metadados de vídeos
GET /api/videos/<id>/<msg>/info            # Info instantânea
GET /api/videos/<id>/<msg>/preview         # Preview rápido
GET /api/videos/<id>/<msg>/transcribe      # Transcrição áudio
GET /api/videos/<id>/<msg>/comments        # Análise comentários
GET /api/videos/<id>/<msg>/analyze-utility # Utilidade frames
GET /api/videos/<id>/<msg>/analyze-full    # Análise completa
```

#### Batch Operations

```
POST /api/videos/preview-batch    # Preview em lote
```

## Skills Instaladas

**Total:** 513 skills

As skills extendem as capacidades do OpenClaw com novas funcionalidades.

## Problemas Conhecidos e Soluções

### Lentidão de Download

**Problema:** Downloads do Telegram muito lentos (~0.95 MB/s) em Windows

**Sintomas:**
- Arquivos MP4 corrompidos ("moov atom not found")
- Downloads demorados

**Solução:**
- Implementar cache agressivo
- Timeouts otimizados
- Estratégias de download parcial

### Bug: `name 'max_bytes' is not defined`

**Arquivo:** `telegram_api_stream.py`

**Problema:** Variável `max_bytes` definida dentro de bloco `try` mas usada fora

**Solução:** Mover definição de `max_bytes` para escopo da função (antes do `try`)

## Configuração

### TELEGRAM_API_URL

```
http://localhost:5000
```

Usado internamente para comunicação com a API Telegram.

## Comandos Úteis

### Iniciar OpenClaw

```bash
cd E:/openclaw
node openclaw.mjs gateway run --port 18789 --allow-unconfigured
```

### Verificar API

```bash
curl http://localhost:5000/api/health
```

### Limpar Cache

```bash
curl -X POST http://localhost:5000/api/cache/clear
```

## Integração com Claude Code

O OpenClaw pode ser gerenciado via Claude Code:

1. Usar comandos do Brain Core para documentar soluções
2. Registrar problemas encontrados
3. Documentar novos endpoints

## Próximas Melhorias Planejadas

- [ ] Melhorar performance de download
- [ ] Adicionar retry automático
- [ ] Implementar fila de downloads
- [ ] Adicionar métricas de performance

## Links Relacionados

- [[Soluções Registradas - OpenClaw]]
- [[API Endpoints - Telegram Videos]]


## 📊 Metadados

**Criado:** 2026-03-07 13:45
**Categoria:** Project
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
