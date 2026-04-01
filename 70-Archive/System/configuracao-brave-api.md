---
created: "2026-03-08T00:16:48.633000"
updated: "2026-03-18T13:38:42.858184"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Configuração Brave Search API

**Data:** 2026-03-08
**Tipo:** Configuração / API
**Tags:** [[configuracao]] [[api]] [[brave]] [[search]]

---

## Status

⚠️ **Precisa de ação manual do usuário**

## Brave Search API

**Site:** https://brave.com/search/api/
**Dashboard:** https://api-dashboard.search.brave.com/register

## Planos

| Plano | Preço |
|-------|-------|
| Free | $5 credits/mês |
| Search | $5 por 1.000 requests |
| Answers | $4 por 1.000 requests + tokens |

## Como Obter a API Key

1. Acesse: https://api-dashboard.search.brave.com/register
2. Crie uma conta (email, senha, nome)
3. Após login, vá ao dashboard
4. Copie a API key

## Após Obter a API Key

Configurer no OpenClaw via:
```bash
openclaw configure --section web
```

Ou configurar via variável de ambiente:
```
BRAVE_API_KEY=sua_api_key_aqui
```

---

## Alternativas

Se não quiser usar Brave:
- **Playwright** - Já funcionando para pesquisas via browser
- **YouTube API** - Já configurado e funcionando

---

*Atualizado automaticamente pelo Ted*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*