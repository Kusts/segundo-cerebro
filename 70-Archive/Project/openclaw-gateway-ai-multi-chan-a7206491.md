---
type: knowledge
id: openclaw-gateway-ai-multi-chan-a7206491
category: Project
created: 2026-03-07
tags: [knowledge, Project, auto-generated]
---

# 📚 OpenClaw - Gateway AI Multi-Channel

# OpenClaw - Assistente Pessoal de IA

## Visão Geral

**Nome:** OpenClaw
**Versão:** 2026.3.2
**Localização:** `E:/openclaw/`
**Descrição:** Multi-channel AI gateway com extensíveis integrações de messaging
**Homepage:** https://openclaw.ai
**Docs:** https://docs.openclaw.ai
**Repo:** https://github.com/openclaw/openclaw

## O Que É OpenClaw

OpenClaw é um **assistente pessoal de IA** que você roda em seus próprios dispositivos. Ele responde nos canais que você já usa (WhatsApp, Telegram, Slack, Discord, Google Chat, Signal, iMessage, BlueBubbles, IRC, Microsoft Teams, Matrix, Feishu, LINE, Mattermost, Nextcloud Talk, Nostr, Synology Chat, Tlon, Twitch, Zalo, Zalo Personal, WebChat).

### Destaques

- **Local-first Gateway** - único controle planejado para sessões, canais, tools e eventos
- **Multi-channel inbox** - 20+ plataformas de mensagens suportadas
- **Multi-agent routing** - roteamento de canais/contas para agentes isolados
- **Voice Wake + Talk Mode** - wake words no macOS/iOS e voz contínua no Android
- **Live Canvas** - workspace visual controlado por agente
- **Companion apps** - app macOS menu bar + iOS/Android nodes
- **Skills extensíveis** - sistema de skills instaláveis

## Arquitetura

### Componentes Principais

```
┌─────────────────────────────────────────────────────────┐
│                    OPENCLAW                             │
├─────────────────────────────────────────────────────────┤
│                                                           │
│  ┌──────────────┐      ┌──────────────┐                │
│  │   Gateway    │◄────►│    Agent     │                │
│  │  (Node.js)    │      │   (Pi-AI)     │                │
│  └──────┬───────┘      └──────────────┘                │
│         │                                               │
│         ▼                                               │
│  ┌──────────────────────────────────────────────────┐    │
│  │              Extensions & Channels               │    │
│  │  WhatsApp │ Telegram │ Discord │ Slack │ ...    │    │
│  └──────────────────────────────────────────────────┘    │
│                                                           │
│  ┌──────────────────────────────────────────────────┐    │
│  │                  Skills System                   │    │
│  │           513+ skills instaláveis               │    │
│  └──────────────────────────────────────────────────┘    │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

## Estrutura do Projeto

```
E:/openclaw/
├── openclaw.mjs              # Entry point principal
├── package.json               # Dependências e scripts
├── dist/                      # Código compilado
├── src/                       # Código fonte TypeScript
│   ├── gateway/              # Gateway core
│   ├── plugins/               # Sistema de plugins
│   ├── extensions/            # Canais suportados
│   ├── tools/                 # Tools disponíveis
│   └── nodes/                 # Nodes (macOS, iOS, Android)
├── extensions/                # Extensões de canais
│   ├── whatsapp/              # WhatsApp
│   ├── telegram/              # Telegram
│   ├── discord/               # Discord
│   ├── slack/                 # Slack
│   ├── signal/                # Signal
│   ├── googlechat/            # Google Chat
│   └── [20+ canais]           # Outros canais
├── skills/                    # Skills instaláveis
│   ├── asana/                 # Integração Asana
│   ├── password-manager/      # Gerenciador de senhas
│   ├── memory-*/              # Sistema de memória
│   ├── agent-*/               # Agentes especializados
│   └── [513 skills]           # Mais skills
├── apps/                      # Aplicações companheiras
│   ├── macos/                 # App macOS
│   ├── ios/                   # App iOS
│   └── android/               # App Android
├── ui/                        # Interface web
├── docs/                      # Documentação
└── scripts/                   # Scripts de build/deploy
```

## Instalação e Setup

### Requisitos

- **Node.js** >= 22.12.0
- **pnpm** >= 10.23.0

### Instalação Global

```bash
npm install -g openclaw@latest
# ou: pnpm add -g openclaw@latest

# Wizard de onboarding
openclaw onboard --install-daemon
```

### Setup Local

```bash
cd E:/openclaw
pnpm install
pnpm ui:build
pnpm build

# Inicia gateway
openclaw gateway --port 18789 --verbose
```

### URLs e Endpoints

| Serviço | URL |
|---------|-----|
| Gateway | http://127.0.0.1:18789 |
| Bot Telegram | @SynkrooClawBot |
| API Local | http://localhost:5000 |

## Comandos Principais

```bash
# Gateway
openclaw gateway --port 18789 --verbose

# Enviar mensagem
openclaw message send --to +1234567890 --message "Hello"

# Talk com assistente
openclaw agent --messag