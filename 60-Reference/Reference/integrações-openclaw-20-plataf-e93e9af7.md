---
type: knowledge
id: integrações-openclaw-20-plataf-e93e9af7
category: Reference
created: 2026-03-07
tags: [knowledge, Reference, auto-generated]
---

# 📚 Integrações OpenClaw - 20+ Plataformas

# Integrações do OpenClaw

## Visão Geral

O OpenClaw se integra com múltiplas plataformas através de extensões. Cada extensão é um pacote npm independente localizado em `extensions/`.

## Extensões Disponíveis (20+)

### Messaging Platforms

| Extensão | Pacote | Status |
|-----------|--------|--------|
| WhatsApp | `extensions/whatsapp/` | ✅ Ativo |
| Telegram | `extensions/telegram/` | ✅ Ativo |
| Discord | `extensions/discord/` | ✅ Ativo |
| Slack | `extensions/slack/` | ✅ Ativo |
| Signal | `extensions/signal/` | ✅ Ativo |
| Google Chat | `extensions/googlechat/` | ✅ Ativo |
| iMessage | `extensions/imessage/` | ✅ Ativo |
| IRC | `extensions/irc/` | ✅ Ativo |
| Microsoft Teams | `extensions/msteams/` | ✅ Ativo |
| Matrix | `extensions/matrix/` | ✅ Ativo |
| LINE | `extensions/line/` | ✅ Ativo |
| Mattermost | `extensions/mattermost/` | ✅ Ativo |
| Feishu | `extensions/feishu/` | ✅ Ativo |

### Outros Canais

- BlueBubbles (`extensions/bluebubbles/`)
- Nextcloud Talk (`extensions/nextcloud-talk/`)
- Nostr (`extensions/nostr/`)
- Synology Chat (`extensions/synology-chat/`)
- Tlon (`extensions/tlon/`)
- Twitch (`extensions/twitch/`)
- Zalo (`extensions/zalo/`, `extensions/zalouser/`)
- WebChat (`extensions/webchat/`)

## Configuração de Canais

### Estrutura de Configuração

```json
{
  "channels": {
    "telegram": {
      "token": "BOT_TOKEN",
      "dmPolicy": "pairing",
      "allowFrom": ["*"]
    },
    "discord": {
      "token": "DISCORD_TOKEN",
      "dmPolicy": "pairing"
    },
    "whatsapp": {
      "token": "WHATSAPP_TOKEN"
    }
  }
}
```

### DM Policy Options

- `pairing` - Requer pareamento (padrão)
- `open` - Aberto para todos (requer `allowFrom: ["*"]`)
- `closed` - Fechado

## Gateway WebSocket

O OpenClaw usa WebSocket para controle:

```
ws://localhost:18789/gateway
```

### Eventos WebSocket

- `message` - Mensagem recebida
- `presence` - Status de presença
- `typing` - Indicador de digitação
- `state` - Mudança de estado

## Evolution API (WhatsApp)

O OpenClaw integra com Evolution API para WhatsApp.

### Configuração Evolution

```json
{
  "whatsapp": {
    "evolutionApi": "http://localhost:8080",
    "evolutionToken": "EVOLUTION_TOKEN"
  }
}
```

## Telegram Integration

### Bot Telegram SynkrooClawBot

**Username:** @SynkrooClawBot
**API URL:** http://localhost:5000

### Endpoints Telegram

- `/api/health` - Health check
- `/api/cache` - Info cache
- `/api/channels` - Canais
- `/api/videos/<id>/<msg>/info` - Info vídeo

## Companheiros (Apps)

### macOS App

```bash
pnpm mac:open
# ou
open dist/OpenClaw.app
```

### iOS App

```bash
pnpm ios:run
```

### Android App

```bash
pnpm android:install
```

## Integração com MoltBot

O pacote `packages/moltbot/` é uma configuração especial.

### Comandos MoltBot

```bash
pnpm moltbot:rpc
node scripts/run-node.mjs agent --mode rpc --json
```

## Plugins SDK

OpenClaw oferece SDK para criar plugins:

```javascript
import { AccountID } from 'openclaw/plugin-sdk/account-id';
import { KeyedAsyncQueue } from 'openclaw/plugin-sdk/keyed-async-queue';
```

## Hooks de Eventos

Skills podem registrar hooks:

```javascript
// hooks/openclaw/handler.mjs
export async function handleEvent(event, context) {
  const { type, data } = event;
  // Processa evento
}
```

## Webhooks

OpenClaw suporta webhooks para eventos em tempo real:

```json
{
  "webhooks": {
    "url": "https://seu-servidor.com/webhook",
    "events": ["message", "command", "state"]
  }
}
```

## Ferramentas (Tools)

### Browser Tool

Navegação web automatizada.

### Canvas Tool

Workspace visual controlado por agente.

### Sessions Tool

Gerenciamento de sessões.

### Cron Tool

Agendamento de tarefas.

## A2UI (Agent-to-User Interface)

Canvas A2UI permite agentes controlarem interface visual:

```swift
import CanvasA2UI
```

## Testing

### Testes E2E

```bash
pnpm test:e2e
```

### Testes de Canais

```bash
pnpm test:channels
```

### Testes ao Vivo

```bash
pnpm test:live
```


## 📊 Metadados

**Criado:** 2026-03-07 14:14
**Categoria:** Reference
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
