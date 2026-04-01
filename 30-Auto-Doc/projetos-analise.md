---
created: "2026-03-10T14:53:13.142000"
updated: "2026-03-18T13:38:41.544258"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
## @@ Notas Relacionadas

-

# Análise dos Projetos do Usuário

## Projetos Ativos

### 1. Synkroo
**Tipo:** SaaS Monorepo
**Stack:** Bun, Turbo, React, Supabase, Docker, E2E tests
**Estrutura:**
- apps/
- backend/
- supabase/
- e2e/
- monitoring/
- .claude/ (configurado)
- Docker multi-ambiente (dev, staging, production)

### 2. finwai
**Tipo:** Projeto financeiro (Python)
**Stack:** Python, Supabase, Tests
**Estrutura:**
- app/
- frontend/
- supabase/
- scripts/
- tests/
- .claude/ (configurado)
- RLS policies para segurança

### 3. whatsapp-messaging-api
**Tipo:** API WhatsApp
**Stack:** Node.js, TypeScript, Docker
**Estrutura:**
- src/
- frontend/
- docker/
- docs/
- tests/
- .claude/ (configurado)

## Observações

- Todos os 3 projetos têm .claude/ configurado ✅
- Todos usam Supabase
- Synkroo é o mais complexo (monorepo com múltiplos apps)
- Todos têm testes automatizados
- finwai tem foco em segurança de dados (RLS)

## Gaps Encontrados

- API Keys expostas em settings.local.json (CRÍTICO)
- Duplicação de skills entre .claude/skills e openclaw/skills

## Fonte
- Análise em: 2026-03-10
- Local: C:/Users/walis/OneDrive/Desktop/claude_code/projects/

## Tags
[[projetos]] [[análise]] [[synkroo]] [[finwai]] [[whatsapp-api]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*
---

## @@ Tags

#auto-doc #hermes #knowledge
