---
created: "2026-03-17T19:08:00.309751"
updated: "2026-03-18T13:38:39.717738"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🧠 Hermes - Configuração de Memória

**Data:** 2026-03-17  
**Status:** ✅ Memórias carregadas

---

## 📊 Resumo

| Tipo | Localização | Status |
|------|-------------|--------|
| **Memória Markdown** | `~/.hermes/memory/` | ✅ 48 KB |
| **Memória Vetorial (Chroma)** | `~/.hermes/chroma_memory/` | ✅ 10 MB |
| **Memórias OpenClaw** | `/mnt/e/openclaw/.claude/memory/` | ✅ Sincronizado |

---

## 📁 Arquivos de Memória

### ~/.hermes/memory/

```
├── ARES_SYNC.md
├── MEMORY.md
├── ai-agent-development.md
├── patterns.md
├── solutions.md
├── synkroo-ux-analysis.md
├── memories_from_openclaw.json (695 KB / 24.759 linhas)
├── daily/
├── learnings/
└── openclaw_import/
```

### ~/.hermes/chroma_memory/

```
├── chroma.sqlite3 (10 MB)
├── 7a5108a3-376c-4b88-8629-524001b8574f/
├── 886c36bd-c76c-40ed-b63a-260b2dad2edd/
└── ded623b7-049e-467a-9cca-3a20c31275c0/
```

---

## ⚙️ Configuração

### .env (~/.hermes/.env)

```bash
# Memoria Vetorial (Chroma)
CHROMA_PERSIST_PATH=/home/junio/.hermes/chroma_memory
MEMORY_SEARCH_ENABLED=true
OPENCLAW_MEMORY=/mnt/e/openclaw/.claude/memory
CHROMA_COLLECTION=openclaw_memory

# Memoria Markdown
MEMORY_SEARCH_ENABLED=true
```

### config.yaml (~/.hermes/config.yaml)

```yaml
# Memory
memory:
  enabled: true
  storage_path: "/mnt/c/Users/walis/.hermes/memory"
  vector_search: true

# OpenClaw Integration
openclaw:
  enabled: true
  memory_path: "/mnt/e/openclaw/.claude/memory"
```

---

## 🔍 Como o Hermes Usa as Memórias

### 1. **Recall por Texto (Markdown)**
- Arquivos `.md` em `~/.hermes/memory/`
- Busca por similaridade de conteúdo
- Usado para contexto geral

### 2. **Recall Vetorial (Chroma)**
- Embeddings armazenados em `chroma.sqlite3`
- Busca semântica por similaridade
- Usado para perguntas específicas

### 3. **Sincronização OpenClaw**
- Memórias importadas de `/mnt/e/openclaw/.claude/memory/`
- Arquivo `memories_from_openclaw.json`
- Atualizado automaticamente

---

## 🛠️ Comandos Úteis

### Verificar status da memória
```bash
# Memória Markdown
wsl bash -c "ls -lh ~/.hermes/memory/"

# Memória Vetorial
wsl bash -c "ls -lh ~/.hermes/chroma_memory/"

# Contar embeddings no Chroma
wsl bash -c "sqlite3 ~/.hermes/chroma_memory/chroma.sqlite3 'SELECT COUNT(*) FROM embeddings;'"
```

### Recarregar memórias
```bash
# Reiniciar gateway (carrega novas memórias)
wsl bash -c "~/start-gateway.sh"
```

### Ver logs de recall
```bash
wsl bash -c "tail -100 ~/.hermes/logs/gateway.log | grep -i 'recall\|memory'"
```

---

## 📈 Estatísticas Atuais

| Métrica | Valor |
|---------|-------|
| Arquivos Markdown | 8 |
| Embeddings Chroma | ~10.000+ |
| Memórias OpenClaw | 24.759 linhas |
| Tamanho Total | ~11 MB |

---

## ⚠️ Problemas Comuns

### Memória não carrega

**Causa:** Caminho incorreto no config.yaml

**Solução:**
```yaml
memory:
  storage_path: "/mnt/c/Users/walis/.hermes/memory"  # Windows path via WSL
  vector_search: true
```

### Chroma vazio

**Causa:** Embeddings não foram gerados

**Solução:**
1. Verificar se `CHROMA_PERSIST_PATH` está correto
2. Reiniciar gateway
3. Usar comando `/memory` no Telegram

### Recall não funciona

**Causa:** `MEMORY_SEARCH_ENABLED=false`

**Solução:**
```bash
# No .env
MEMORY_SEARCH_ENABLED=true
```

---

## 🔄 Sincronização com OpenClaw

As memórias são sincronizadas automaticamente de:
- `/mnt/e/openclaw/.claude/memory/` → `~/.hermes/memory/`

Arquivos sincronizados:
- `MEMORY.md`
- `patterns.md`
- `solutions.md`
- `ai-agent-development.md`
- `synkroo-ux-analysis.md`
- `ARES_SYNC.md`

---

## 📝 Tags

`hermes`, `memoria`, `chroma`, `vector-search`, `openclaw`, `configuracao`

---

**Última atualização:** 2026-03-17  
**Próxima revisão:** 2026-03-24


---

*Enriquecido automaticamente pelo sistema de auto-documentação*