---
created: "2026-03-17T19:29:10.891892"
updated: "2026-03-18T13:38:39.840312"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# ⚙️ Hermes - Status Completo dos Recursos

**Data:** 2026-03-17  
**Status Geral:** ✅ **OPERACIONAL**

---

## 📊 Resumo do Diagnóstico

| Recurso | Status | Detalhes |
|---------|--------|----------|
| **Gateway** | ✅ Rodando | PID 914 |
| **Telegram** | ✅ Conectado | @SynkrooClawBot |
| **OpenClaw** | ✅ Enabled | `/mnt/e/openclaw` |
| **ARES** | ✅ Enabled | Heartbeat ativo |
| **Memória Markdown** | ✅ 6 arquivos | `/mnt/e/openclaw/.claude/memory/` |
| **Memória Core** | ✅ 10 tabelas | SQLite |
| **Memória Chroma** | ✅ 507 embeddings | Vetorial |
| **Ferramentas** | ✅ 23 tools | File, Browser, Code, etc. |
| **Skills** | ✅ 30 skills | Apple, GitHub, MCP, etc. |
| **Provider LLM** | ✅ MiniMax | MiniMax-M2.5 |

---

## 🛠️ Ferramentas Disponíveis (23)

| Categoria | Ferramentas |
|-----------|-------------|
| **Arquivos** | `file_tools.py`, `file_operations.py` |
| **Navegador** | `browser_tool.py` |
| **Código** | `code_execution_tool.py` |
| **Delegação** | `delegate_tool.py` |
| **Cron Jobs** | `cronjob_tools.py` |
| **Home Assistant** | `homeassistant_tool.py` |
| **Honcho** | `honcho_tools.py` |
| **Imagem** | `image_generation_tool.py` |
| **MCP** | `mcp_tool.py` |
| **Clarificação** | `clarify_tool.py` |
| **Checkpoint** | `checkpoint_manager.py` |
| **Ambientes** | `environments/` |

---

## 🧠 Skills Disponíveis (30)

| Categoria | Skills |
|-----------|--------|
| **Apple** | apple-notes, apple-reminders, findmy, imessage |
| **AI Agents** | claude-code, codex, hermes-agent, opencode |
| **Criativo** | ascii-art, ascii-video, excalidraw |
| **Data Science** | jupyter-live-kernel |
| **Domínio** | domain-intel, duckduckgo-search |
| **Email** | himalaya |
| **GitHub** | codebase-inspection, github-auth, github-code |
| **Google** | google-drive, google-workspace |
| **Mídia** | gif-search, youtube-content |
| **MLOps** | accelerate, audiocraft, axolotl, chroma, clip |
| **Note-taking** | obsidian |
| **NotebookLM** | notebooklm |
| **OpenClaw** | web-search-mcpbrowser |
| **Produtividade** | linear, nano-pdf, notion, ocr |
| **Pesquisa** | arxiv, blogwatcher |
| **Smart Home** | openhue |
| **Social** | xitter |
| **Desenvolvimento** | code-review, plan, suba |
| **YouTube** | youtube-transcript |

---

## 📁 Caminhos de Memória

```
E:/openclaw/
├── .claude/
│   └── memory/              # Memória Markdown (6 arquivos)
│       ├── MEMORY.md
│       ├── patterns.md
│       ├── solutions.md
│       ├── ai-agent-development.md
│       ├── synkroo-ux-analysis.md
│       └── ARES_SYNC.md
└── .openclaw/
    ├── memory/              # Memória Core (SQLite, 10 tabelas)
    │   └── main.sqlite
    └── chroma_memory/       # Memória Vetorial (507 embeddings)
        └── chroma.sqlite3
```

---

## ⚙️ Configuração Atual

### Provider LLM
```yaml
provider:
  name: minimax
  model: MiniMax-M2.5
  base_url: https://api.minimax.io/v1
```

### Memory
```yaml
memory:
  enabled: true
  storage_path: /mnt/e/openclaw/.openclaw/memory
  vector_search: true
  chroma_path: /mnt/e/openclaw/.openclaw/chroma_memory
```

### OpenClaw
```yaml
openclaw:
  enabled: true
  base_path: /mnt/e/openclaw
  memory_path: /mnt/e/openclaw/.claude/memory
  skills_path: /mnt/e/openclaw/.claude/skills
```

### ARES
```yaml
ares:
  enabled: true
  api_url: http://localhost:8765
  base_path: /mnt/e/openclaw/.openclaw
```

---

## 🔍 Comandos de Diagnóstico

### Script Completo
```bash
wsl bash -c "python /home/junio/diagnostico.py"
```

### Verificar Gateway
```bash
wsl bash -c "ps aux | grep gateway | grep -v grep"
```

### Verificar Logs
```bash
wsl bash -c "tail -f ~/.hermes/logs/gateway.log"
```

### Verificar Skills
```bash
wsl bash -c "ls ~/.hermes/skills/ | wc -l"
```

### Verificar Embeddings
```bash
wsl bash -c "python3 -c \"import sqlite3; c=sqlite3.connect('/mnt/e/openclaw/.openclaw/chroma_memory/chroma.sqlite3'); print('Embeddings:', c.execute('SELECT COUNT(*) FROM embeddings;').fetchone()[0])\""
```

---

## ✅ Checklist de Recursos

- [x] Gateway rodando
- [x] Telegram conectado
- [x] OpenClaw integrado
- [x] ARES auto-evolution
- [x] Memória Markdown
- [x] Memória Core (SQLite)
- [x] Memória Vetorial (Chroma)
- [x] 23 Ferramentas
- [x] 30 Skills
- [x] MiniMax LLM
- [x] Browser tool
- [x] File editor
- [x] Python executor
- [x] Terminal access
- [x] Cron jobs
- [x] MCP integration
- [x] Home Assistant
- [x] Delegation
- [x] Code execution
- [x] Image generation
- [x] Clarification
- [x] Checkpoint manager

---

## 📝 Tags

`hermes`, `status`, `recursos`, `ferramentas`, `skills`, `diagnostico`

---

**Última verificação:** 2026-03-17 19:30  
**Próxima revisão:** 2026-03-24


---

*Enriquecido automaticamente pelo sistema de auto-documentação*