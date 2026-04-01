---
created: "2026-03-14T08:08:00.880253"
updated: "2026-03-18T13:38:44.917645"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude AI - 1M Context GA (14/03/2026)

> **Fonte:** https://claude.com/blog/1m-context-ga
> **Data:** 14/03/2026

---

## O que mudou

**Claude Opus 4.6 e Sonnet 4.6** agora têm **1M de contexto** disponível para todos:

### Preços (padrão, sem prêmio)
- **Opus 4.6:** $5/input, $25/output por milhão de tokens
- **Sonnet 4.6:** $3/input, $15/output por milhão de tokens
- Sem multiplicador: 900K tokens = mesma taxa que 9K tokens

### Novidades
- ✅ Preço padrão em toda janela de 1M
- ✅ Rate limits completos em qualquer tamanho de contexto
- ✅ **600 imagens ou páginas PDF** por请求 (antes: 100)
- ✅ Não precisa mais do header beta

### No Claude Code
- Usuários Max, Team e Enterprise com Opus 4.6 têm 1M automático
- Menos compactions = mais contexto preservado

---

## Por que importa

###MRCR v2 Benchmark
- Opus 4.6 scored **78.3%** - highest among frontier models at 1M context

### Casos de uso
- **Codebases inteiros** - sem precisar resumir
- **Contratos longos** - 100+ páginas em uma sessão
- **Agentes de IA** - manter trace completo de tool calls e reasoning
- **Pesquisa científica** - reasoning across hundreds of papers
- **Spreadsheets complexos** - multi-step plans maintained

### Depoimentos
> "With 1M context, I search, re-search, aggregate edge cases, and propose fixes — all in one window." — Anton Biryukov, Software Engineer

> "We've seen a 15% decrease in compaction events." — Jon Bell, CPO

> "Larger diffs didn't fit in 200K so the agent had to chunk context... With 1M, we get higher-quality reviews." — Adhyyan Sekhsaria, Eve

---

## Disponibilidade

- ✅ **Claude Platform** (nativo)
- ✅ **Amazon Bedrock**
- ✅ **Google Cloud Vertex AI**
- ✅ **Microsoft Azure Foundry**

---

## Implicações para Agentes de IA

1. **Menos perda de contexto** - agentes rodam por horas sem esquecer
2. **Quality boost** - diffs maiores cabem completos
3. **Eficiência** - menos overhead de compactação
4. **Novos casos de uso** - antes impraticáveis por limitação de contexto

---

*Salvo automaticamente via heartbeat*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*