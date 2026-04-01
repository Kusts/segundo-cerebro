---
type: reference
tags: [tags, schema, standard, reference]
created: 2026-04-01
description: Schema de Tags Padronizado
---

# 🏷️ Tag Schema - Segundo Cérebro

> Padrão de tags para todo o vault | Atualizado: 2026-04-01

---

## 📋 Regras Gerais

1. **Sempre usar lowercase** - `#agencia` não `#Agencia`
2. **Usar hífens** - `#vibe-coding` não `#vibecoding`
3. **Tags compostas** - `#ai-agent`, `#n8n-workflow`
4. **Máximo 10 tags** por nota
5. **Tags obrigatórias** sempre: `#type` ou `#moc`, `#domain`

---

## 🏷️ Tags por Categoria

### 📁 Tipo de Nota

| Tag | Uso |
|-----|-----|
| `#MOC` | Map of Content (índice) |
| `#dashboard` | Dashboard Dataview |
| `#kanban` | Quadro Kanban |
| `#canvas` | Canvas visual |
| `#project` | Projeto |
| `#reference` | Referência/Doc |
| `#knowledge` | Conhecimento |
| `#template` | Template |
| `#script` | Script/Automação |

### 🌍 Domínio

| Tag | Uso |
|-----|-----|
| `#agencia` | Agência de IA/Software |
| `#hermes` | Sistema Hermes |
| `#sae` | SAE |
| `#synkroo` | Projeto Synkroo |
| `#openclaw` | OpenClaw |
| `#automation` | Automação |
| `#ai` | Inteligência Artificial |
| `#business` | Business/Vendas |

### 🛠️ Tecnologia

| Tag | Uso |
|-----|-----|
| `#n8n` | n8n |
| `#windmill` | Windmill |
| `#typebot` | Typebot |
| `#claude-code` | Claude Code |
| `#nextjs` | Next.js |
| `#supabase` | Supabase |
| `#postgresql` | PostgreSQL |
| `#evolution-api` | Evolution API |

### 📊 Status

| Tag | Uso |
|-----|-----|
| `#status/active` | Ativo |
| `#status/paused` | Pausado |
| `#status/done` | Finalizado |
| `#status/blocked` | Bloqueado |
| `#status/archived` | Arquivado |

### 📅 Temporal

| Tag | Uso |
|-----|-----|
| `#2026` | Ano |
| `#2026-04` | Mês |
| `#daily` | Nota diária |
| `#session` | Sessão |

---

## 🚫 Tags PROIBIDAS

```
❌ #note (genérico demais)
❌ #info (genérico demais)
❌ #test (usar #testing)
❌ #temp / #tmp (arquive)
❌ #untitled / #sem-titulo (nunca criar)
```

---

## ✅ Checklist de Tags

Para cada nota nova, garantir:

- [ ] Frontmatter com `tags: []`
- [ ] No mínimo 1 tag de `#type` (moc, knowledge, reference)
- [ ] No mínimo 1 tag de domínio (agencia, hermes, synkroo)
- [ ] Máximo 10 tags
- [ ] Todas lowercase com hífens

---

## 🔗 Relacionado

- [[TEMPLATE-Knowledge]]
- [[TEMPLATE-MOC]]
- [[Dashboard: Overview]]
