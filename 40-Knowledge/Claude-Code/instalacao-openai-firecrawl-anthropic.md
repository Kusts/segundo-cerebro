---
tags:
  - openai
  - firecrawl
  - anthropic
  - wsl
  - ubuntu
  - instalação
  - 2026-03-16
created: 2026-03-16T22:30:00
---

# Instalação OpenAI + Firecrawl + Anthropic no WSL2 - 2026-03-16

## 📋 Resumo

Instalação das bibliotecas de IA e web scraping no WSL2 Ubuntu para uso com agentes.

---

## ✅ Status

**Status:** ✅ **CONCLUÍDO**

**Data:** 2026-03-16 22:30

---

## 📦 Pacotes Instalados

| Pacote | Versão | Descrição |
|--------|--------|-----------|
| **openai** | 2.28.0 | SDK oficial OpenAI (GPT-4, etc) |
| **firecrawl** | 4.19.0 | Web scraping e crawl |
| **anthropic** | 0.85.0 | SDK oficial Anthropic (Claude) |

---

## 🔧 Comando de Instalação

```bash
echo '1234' | sudo -S pip3 install openai firecrawl anthropic --break-system-packages
```

---

## 📊 Dependências Instaladas

| Pacote | Finalidade |
|--------|------------|
| `aiohttp` | HTTP assíncrono |
| `jiter` | JSON parsing |
| `docstring-parser` | Parse de docstrings |
| `nest-asyncio` | Asyncio nested loops |
| `sniffio` | Detecção de async backend |
| `aiohappyeyeballs` | Happy eyeballs para aiohttp |
| `aiosignal` | Signals para aiohttp |
| `frozenlist` | Listas imutáveis |
| `multidict` | Multi-value dictionaries |
| `propcache` | Property caching |
| `yarl` | URL parsing |

---

## 🧪 Verificação

```python
import openai
import firecrawl
import anthropic

print(f"openai: {openai.__version__}")      # 2.28.0
print(f"firecrawl: {firecrawl.__version__}")  # 4.19.0
print(f"anthropic: {anthropic.__version__}")  # 0.85.0
```

---

## 🔗 Uso

### OpenAI (GPT-4)

```python
from openai import OpenAI

client = OpenAI(api_key="sk-...")

response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

### Anthropic (Claude)

```python
from anthropic import Anthropic

client = Anthropic(api_key="sk-ant-...")

response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello!"}]
)
```

### Firecrawl (Web Scraping)

```python
from firecrawl import FirecrawlApp

app = FirecrawlApp(api_key="fc-...")

# Scrape URL
data = app.scrape_url("https://example.com")

# Crawl site
crawl_result = app.crawl_url("https://example.com")
```

---

## 📝 Notas

- Instalação feita com `--break-system-packages` para evitar conflitos
- Recomendado usar ambiente virtual para projetos em produção
- Todas as bibliotecas são compatíveis com Python 3.12

---

## 🔗 Links

- [OpenAI Python SDK](https://github.com/openai/openai-python)
- [Firecrawl](https://docs.firecrawl.dev/)
- [Anthropic Python SDK](https://github.com/anthropics/anthropic-sdk-python)

---

*Nota criada durante sessão de instalação de bibliotecas de IA*
