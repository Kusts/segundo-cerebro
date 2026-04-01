---
created: "2026-03-08T02:08:22.734000"
updated: "2026-03-18T13:38:42.921114"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Integração Playwright - Pesquisa Automatizada

**Data:** 2026-03-08
**Tipo:** Configuração / Integração
**Tags:** [[playwright]] [[research]] [[automacao]] [[ferramentas]]

---

## Visão Geral

O Ted agora usa Playwright para fazer pesquisas na web como alternativa aos APIs pagos.

---

## Ferramentas Criadas

### 1. research-bot.py
**Local:** `tools/research-bot.py`

Script Python completo com:
- Busca no Google
- Extração de conteúdo de páginas
- Compilação de resultados
- Suporte a múltiplas fontes

```python
# Exemplo de uso
from research-bot import ResearchBot

bot = ResearchBot()
results = await bot.research_topic("vibe coding 2026")
```

### 2. research.sh
**Local:** `tools/research.sh`

Script shell para pesquisas rápidas

### 3. Skill: research-bot
**Local:** `E:\openclaw\skills\research-bot\SKILL.md`

Skill do OpenClaw para comando `/research`

---

## Como Usar

### Método 1: Via Ted (Recomendado)

Basta pedir:
```
Pesquise sobre [tópico]
```

Exemplos:
- "Pesquise sobre Claude Code 2026"
- "Faça uma pesquisa sobre n8n automations"
- "Pesquise as últimas notícias de AI"

### Método 2: Via Browser

O Playwright já está configurado no OpenClaw:
- Browser: Chrome
- Headless: false (você pode ver)
- URL: http://127.0.0.1:18800

### Método 3: Script Python

```bash
cd tools
python research-bot.py
```

---

## Comparação de Custos

| Método | Custo | Limites |
|--------|-------|---------|
| Brave API | $5-10/mês | 2.000-5.000 searches |
| Google API | $5+/mil | Limite variável |
| **Playwright** | **GRÁTIS** | **Ilimitado** |

---

## Vantagens do Playwright

1. ✅ Zero custo
2. ✅ Sem API key necessária
3. ✅ Resultados reais (como usuário)
4. ✅ Screenshots disponíveis
5. ✅ Pode fazer login se necessário
6. ✅ Suporta JavaScript/rendering

---

## Configuração Atual

- **Browser:** Chrome (existente)
- **Porta:** 18800
- **Status:** ✅ Funcionando

---

## Exemplos de Pesquisas Já Feitas

1. AI news 2026
2. Vibe coding 2026
3. Claude code 2026

---

## Próximos Passos

- [ ] Criar comando /research no Ted
- [ ] Integrar com cron para pesquisas diárias
- [ ] Adicionar suporte a múltiplos sites

---

*Atualizado automaticamente pelo Ted*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*