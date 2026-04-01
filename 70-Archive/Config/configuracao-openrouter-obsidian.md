---
tags: [config, obsidian, openrouter, api, plugins]
date: 2026-03-17
type: config
---

# Configuração OpenRouter - Plugins Obsidian

## Visão Geral

Este documento contém todas as configurações de API dos plugins do Obsidian que utilizam a OpenRouter.

## API Key

```
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
```

## Modelo Gratuito Utilizado

```
stepfun/step-3.5-flash:free
```

Este modelo gratuito está funcionando corretamente na OpenRouter.

---

## Plugins Configurados

### 1. chatgpt-md

| Configuração | Valor |
|--------------|-------|
| API Key | sk-or-v1-228425047cbbbef... |
| Provider | OpenRouter |
| Modelo Padrão | stepfun/step-3.5-flash:free |

**Local do arquivo:** `.obsidian/plugins/chatgpt-md/data.json`

---

### 2. copilot

| Configuração | Valor |
|--------------|-------|
| API Key | sk-or-v1-228425047cbbbef... |
| Provider | OpenRouter |
| Modelo Padrão | stepfun/step-3.5-flash:free |

**Local do arquivo:** `.obsidian/plugins/copilot/data.json`

---

### 3. obsidian-textgenerator-plugin

| Configuração | Valor |
|--------------|-------|
| API Key | sk-or-v1-228425047cbbbef... |
| Provider | OpenRouter |
| Modelo Padrão | stepfun/step-3.5-flash:free |

**Local do arquivo:** `.obsidian/plugins/obsidian-textgenerator-plugin/data.json`

---

### 4. smart-composer

| Configuração | Valor |
|--------------|-------|
| API Key | sk-or-v1-228425047cbbbef... |
| Provider | OpenRouter |
| Modelo Padrão | stepfun-3.5-flash (free) |

**Local do arquivo:** `.obsidian/plugins/smart-composer/data.json`

---

## Plugins de Integração

### 5. obsidian-local-rest-api

| Configuração | Valor |
|--------------|-------|
| Porta | 27125 |
| API Key | 467z1kE2c7M8pKdEqpogjKmFVgNgbrQq |
| HTTPS | Ativado |

**Local do arquivo:** `.obsidian/plugins/obsidian-local-rest-api/data.json`

---

### 6. obsidian-advanced-uri

- **Status:** Instalado e habilitado
- **Função:** Permite abrir notas via URL

**URL de exemplo:**
```
obsidian://advanced-uri?vault=OpenClaw&file=00-Inbox/Teste
```

---

## Teste da API

### Comando de Teste

```bash
curl -X POST "https://openrouter.ai/api/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer sk-or-v1-228425047cbbbef..." \
  -H "HTTP-Referer: https://obsidian.md" \
  -d '{
    "model": "stepfun/step-3.5-flash:free",
    "messages": [{"role": "user", "content": "Olá!"}],
    "max_tokens": 50
  }'
```

### Resultado
- **Status:** FUNCIONANDO
- **Custo:** Gratuito

---

## Modelos Gratuitos Disponíveis

Alguns modelos gratuitos testados:

| Modelo | Status |
|--------|--------|
| stepfun/step-3.5-flash:free | FUNCIONANDO |
| deepseek/deepseek-r1:free | Não disponível |
| minimax/minimax-m2.5:free | Guardrail restrictions |

---

## Histórico de Alterações

- **2026-03-17:** Configuração inicial dos plugins com OpenRouter
- Configurado modelo stepfun-3.5-flash como padrão gratuito
- Todos os plugins de IA configurados

---

## Referências

- [OpenRouter](https://openrouter.ai)
- [Documentação Obsidian REST API](https://github.com/obsidian-community/obsidian-local-rest-api)
