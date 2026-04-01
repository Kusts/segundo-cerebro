type: knowledge
category: general
created: 2026-03-13
tags:, auto-doc, hermes]
  - knowledge
  - general
---

# 📚 Módulo de Ingestão Telegram - Pyrogram


## Conteúdo

# Módulo de Ingestão Telegram (Pyrogram)

**Data:** 2026-03-13
**Localização:** 

## Visão Geral

Módulo de ingestão de mídia do Telegram com download direto para memória RAM (Zero I/O), usando Pyrogram + tgcrypto para máxima velocidade.

## Stack Técnica

- **pyrogram>=2.0.0** - Framework MTProto assíncrono
- **tgcrypto>=1.2.5** - Aceleração de criptografia (3-5x mais rápido)
- **python-dotenv>=1.0.0** - Variáveis de ambiente

## Features

- Download direto para  (sem I/O em disco)
- Suporte: audio, voice, video, video_note, document
- Callbacks assíncronos para processamento
- Buffer com propriedade  (compatível com Whisper/FFmpeg)
- Filtro por chats permitidos
- Estatísticas de download
- 16 workers paralelos

## Estrutura de Arquivos



## Uso Básico



## Performance

| Configuração | Velocidade |
|---
## @@ Notas Relacionadas

-
----------|-----------|
| Pyrogram + tgcrypto | ~5-10 MB/s |
| Pyrogram apenas | ~1-3 MB/s |

## Configuração Necessária

1. Obter API_ID e API_HASH em https://my.telegram.org/apps
2. Copiar  para 
3. Preencher credenciais do Telegram

## MediaBuffer API



## Soluções Relacionadas

- Módulo anterior (Telethon) apresentava bugs e lentidão
- Nova abordagem com Pyrogram resolve problemas de performance
- tgcrypto essencial para downloads rápidos no Windows

**Tags:** telegram, pyrogram, ingestion, zero-io, tgcrypto, media-download


## 🔗 Relacionado

-
---

## @@ Tags

#auto-doc #hermes #tools
