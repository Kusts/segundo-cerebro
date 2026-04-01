---
tags:
  - sae-solution
  - gap-resolution
created: 2026-03-30
gap: skill finder
---

# SAE: skill finder

## Problema
Gap detectado e resolvido pelo SAE Auto-Evolution

## Solução

### De: SAE: skill-finder

有用内容：

有用内容: > Dashboard central do sistema de Auto-Evolução do Hermes. | Total de Gaps | 10 | | Taxa de Resolução | 100% | | Knowledge Items | 5 | | Prioridade | Quantidade |...

有用内容: Esta skill é ativada quando o usuário: - menciona Teste do adapter v3 1. Entender o objetivo da tarefa 2. Preparar ambiente/pré-requisitos 3. Executar passo a passo...

有用内容: Esta skill é ativada quando o usuário: - menciona Skill de teste v3 1. Entender o objetivo da tarefa 2. Preparar ambiente/pré-requisitos 3. Executar passo a passo...

---

### De: Skills no Claude Code - Aprendizado

有用内容：

**Skill = pasta com instruções** que transforma o Claude Code em especialista em uma tarefa específica.

## Código Relevante

```
pasta_skill/
├── SKILL.md          # Documentação
├── instructions.md    # Instruções
└── scripts/         # Scripts opcionais
```



---

### De: Integração Playwright - Pesquisa Automatizada

有用内容：



## Código Relevante

```python
# Exemplo de uso
from research-bot import ResearchBot

bot = ResearchBot()
results = await bot.research_topic("vibe coding 2026")
```

```
Pesquise sobre [tópico]
```

```bash
cd tools
python research-bot.py
```



---

### De: Playwright + DevTools/CDP - Pesquisa Avançada

有用内容：

| Console Logs | Captura logs JavaScript do console | | Network Monitoring | Monitora requisições de rede | | Performance Metrics | Coleta métricas de performance |

| Recurso | Brave API | Google API | Playwright + CDP | |---------|-----------|------------|------------------|

## Código Relevante

```bash
pip install playwright
playwright install chromium
```

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

```bash
python advanced-research-bot.py "vibe coding 2026"
```



### Fontes:
- [[40-Knowledge/Solutions/sae-skill-finder-2026-03-30.md|SAE: skill-finder]]
- [[40-Knowledge/Claude-Code/skills-claude-code-aprendizado.md|Skills no Claude Code - Aprendizado]]
- [[50-Learning/04-Research/Deep-Dives/Integração Playwright - Pesquisa Automatizada.md|Integração Playwright - Pesquisa Automatizada]]
- [[50-Learning/04-Research/Deep-Dives/Playwright + DevTools-CDP - Pesquisa Avançada.md|Playwright + DevTools/CDP - Pesquisa Avançada]]

---
*Criado: 2026-03-30 16:09*
