---
created: "2026-03-17T19:26:56.120611"
updated: "2026-03-18T13:38:39.788718"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🧠 Hermes - Configuração de Memória (Atualizado)

**Data:** 2026-03-17  
**Status:** ✅ Memórias configuradas

---

## 📊 Resumo da Configuração

| Tipo | Localização | Disco | Status |
|------|-------------|-------|--------|
| **Memória Markdown** | `/mnt/e/openclaw/.claude/memory/` | E: | ✅ |
| **Memória Core** | `/mnt/e/openclaw/.openclaw/memory/` | E: | ✅ |
| **Memória Vetorial (Chroma)** | `/mnt/e/openclaw/.openclaw/chroma_memory/` | E: | ✅ |
| **Sessions** | `/mnt/c/Users/walis/.hermes/sessions/` | C: | ✅ |

---

## 🗂️ Estrutura de Diretórios

### Disco E: (Principal)
```
E:/openclaw/
├── .claude/
│   └── memory/           # Memórias Markdown
│       ├── MEMORY.md
│       ├── patterns.md
│       ├── solutions.md
│       └── ai-agent-development.md
└── .openclaw/
    ├── memory/           # Memória Core (SQLite)
    │   └── main.sqlite
    └── chroma_memory/    # Memória Vetorial
        └── chroma.sqlite3
```

### Disco C: (Workspace)
```
C:/Users/walis/.hermes/
├── sessions/             # Sessões do Telegram
└── logs/                 # Logs do gateway
```

---

## ⚙️ Configuração Atual

### config.yaml
```yaml
memory:
  enabled: true
  storage_path: "/mnt/e/openclaw/.openclaw/memory"
  vector_search: true
  chroma_path: "/mnt/e/openclaw/.openclaw/chroma_memory"

openclaw:
  enabled: true
  memory_path: "/mnt/e/openclaw/.claude/memory"
```

### .env
```bash
# Memoria Vetorial (Chroma) - Disco E:
CHROMA_PERSIST_PATH=/mnt/e/openclaw/.openclaw/chroma_memory
OPENCLAW_MEMORY=/mnt/e/openclaw/.claude/memory
CHROMA_COLLECTION=openclaw_memory
MEMORY_CORE_PATH=/mnt/e/openclaw/.openclaw/memory
MEMORY_SEARCH_ENABLED=true
```

---

## 📈 Estatísticas Atuais

| Métrica | Valor |
|---------|-------|
| Embeddings Chroma | 100 |
| Arquivos Markdown | 6 |
| Tabelas Core SQLite | 10 |

---

## 🔍 Como Funciona

### 1. **Memória Markdown** (`.claude/memory/`)
- Arquivos `.md` com conhecimento geral
- Usado para contexto de longo prazo
- Sincronizado com `.hermes/memory/` no WSL

### 2. **Memória Core** (`.openclaw/memory/main.sqlite`)
- Banco SQLite com chunks de texto
- Busca por similaridade de conteúdo
- Usado para perguntas específicas

### 3. **Memória Vetorial** (`.openclaw/chroma_memory/`)
- Embeddings gerados por IA
- Busca semântica avançada
- 100 embeddings armazenados

---

## 🛠️ Comandos Úteis

### Verificar status
```bash
# Gateway
wsl bash -c "ps aux | grep gateway | grep -v grep"

# Logs
wsl bash -c "tail -f ~/.hermes/logs/gateway.log"

# Configuração
wsl bash -c "cat ~/.hermes/config.yaml | grep -A 5 'memory:'"
```

### Verificar memórias
```bash
# Markdown
wsl bash -c "ls -la /mnt/e/openclaw/.claude/memory/"

# Chroma (contar embeddings)
wsl bash -c "python3 -c \"import sqlite3; c=sqlite3.connect('/mnt/e/openclaw/.openclaw/chroma_memory/chroma.sqlite3'); print('Embeddings:', c.execute('SELECT COUNT(*) FROM embeddings;').fetchone()[0])\""
```

### Reiniciar gateway
```bash
wsl bash -c "~/start-gateway.sh"
```

---

## ⚠️ Problemas Comuns

### Memória não carrega

**Verificar:**
1. Caminhos no config.yaml estão corretos
2. Arquivos existem nos diretórios
3. `MEMORY_SEARCH_ENABLED=true` no .env

### Chroma vazio

**Solução:**
```bash
# Reiniciar gateway para recarregar
wsl bash -c "~/start-gateway.sh"
```

### Gateway não responde

**Verificar:**
```bash
# Status do processo
wsl bash -c "ps aux | grep gateway"

# Logs de erro
wsl bash -c "tail -50 ~/.hermes/logs/gateway.log | grep ERROR"
```

---

## 📝 Tags

`hermes`, `memoria`, `chroma`, `openclaw`, `configuracao`, `wsl`

---

**Última atualização:** 2026-03-17  
**Próxima revisão:** 2026-03-24


---

*Enriquecido automaticamente pelo sistema de auto-documentação*