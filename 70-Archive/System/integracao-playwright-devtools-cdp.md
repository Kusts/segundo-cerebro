---
created: "2026-03-08T02:11:12.788000"
updated: "2026-03-18T13:38:42.904845"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Playwright + DevTools/CDP - Pesquisa Avançada

**Data:** 2026-03-08
**Tipo:** Configuração / Integração
**Tags:** [[playwright]] [[devtools]] [[cdp]] [[pesquisa]] [[automacao]]

---

## Visão Geral

O Ted agora usa **Playwright + Chrome DevTools Protocol (CDP)** para pesquisas avançadas na web.

---

## Arquivos Criados

### 1. advanced-research-bot.py
**Local:** `tools/advanced-research-bot.py`

Script Python completo com todas as features DevTools:

| Feature | Descrição |
|---------|-----------|
| Console Logs | Captura logs JavaScript do console |
| Network Monitoring | Monitora requisições de rede |
| Performance Metrics | Coleta métricas de performance |
| JS Execution | Executa JavaScript na página |
| Screenshots | Fullpage ou por elemento |
| CSS Injection | Injeta CSS dinamicamente |
| Element Highlighting | Destaca elementos |
| Mobile Emulation | Simula dispositivos móveis |

### 2. Skill: advanced-research-bot
**Local:** `E:\openclaw\skills\advanced-research-bot/SKILL.md`

Skill do OpenClaw para pesquisas profundas

---

## Configuração Atual

### Browser CDP
- **Porta:** 18800
- **URL:** http://127.0.0.1:18800
- **Protocol:** Chrome DevTools Protocol
- **Status:** ✅ Ativo

### Instalação
```bash
pip install playwright
playwright install chromium
```

---

## Comparativo de Recursos

| Recurso | Brave API | Google API | Playwright + CDP |
|---------|-----------|------------|------------------|
| Custo | $5+/mês | $5+/mês | **GRÁTIS** |
| Console Logs | ❌ | ❌ | ✅ |
| Network Logs | ❌ | ❌ | ✅ |
| Screenshots | ❌ | ❌ | ✅ |
| JS Execution | ❌ | ❌ | ✅ |
| Mobile Mode | ❌ | ❌ | ✅ |
| Performance | ❌ | ❌ | ✅ |

---

## Como Usar

### Via Python
```python
from advanced-research-bot import AdvancedResearchBot

bot = AdvancedResearchBot(headless=False)
await bot.init()

results = await bot.research_topic("vibe coding 2026")

# Features avançadas
console = await bot.get_console_logs()
metrics = await bot.get_performance_metrics()
await bot.screenshot_fullpage("page.png")

await bot.close()
```

### Via CLI
```bash
python advanced-research-bot.py "vibe coding 2026"
```

### Via Ted (Recomendado)
Basta pedir:
- "Pesquise sobre [tema]"
- "Faça uma pesquisa profunda sobre [tópico]"

---

## Exemplos de Uso

### 1. Pesquisa Simples
```
Pesquise sobre Claude Code
```

### 2. Pesquisa com Screenshots
O bot pode tirar screenshots automaticamente

### 3. Extração de Console
Monitora erros JavaScript das páginas

### 4. Mobile Emulation
Simula acesso via celular

---

## Vantagens do CDP

1. **Zero Custo** -完全免费
2. **Features Avançadas** - Console, Network, Performance
3. **Screenshot Automático** - Documentação visual
4. **JavaScript Execution** - Pode executar scripts
5. **Mobile Testing** - Teste responsivo
6. **Debug Facil** - DevTools integrado

---

## Status

✅ **Configuração Completa!**

- Playwright ✅
- CDP/DevTools ✅
- Screenshots ✅
- Console Logs ✅
- Network Logs ✅
- Performance Metrics ✅
- Mobile Emulation ✅

---

*Atualizado automaticamente pelo Ted*


---

*Enriquecido automaticamente pelo sistema de auto-documentação*