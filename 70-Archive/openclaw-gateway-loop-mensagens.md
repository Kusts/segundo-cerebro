---
tags: [openclaw, problema-resolvido, browser, gateway]
category: Soluções
date: 2026-03-14
---

# OpenClaw - Loop de Mensagens "Precisa reiniciar o gateway"

## Problema

O OpenClaw ficava em loop pedindo para reiniciar o gateway constantemente, com mensagens como:
- "Precisa reiniciar o gateway: openclaw gateway restart"
- "Porque fiz mudanças no código/configuração do browser (attachOnly: false) mas o gateway está rodando com a config antiga em memória"

## Causa Raiz

- Configuração `attachOnly: false` no arquivo `config/openclaw_config.json`
- O gateway estava carregado com a configuração antiga em memória
- Sistema detectava o conflito e pedia reinício continuamente

## Solução

**Desativar o browser no OpenClaw.** A configuração do browser estava causando o loop de mensagens.

## Arquivos Envolvidos

| Arquivo | Descrição |
|---------|-----------|
| `config/openclaw_config.json` | Configuração do browser |
| `src/browser/config.ts` | Lógica de attachOnly |

## Data

2026-03-14

## Status

✅ Resolvido
