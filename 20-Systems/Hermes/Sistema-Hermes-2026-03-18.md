---
tags: [hermes, gateway, sistema, revisao, 2026-03-18]
data: 2026-03-18
status: operacional
---

# Sistema Hermes - Revisao Completa e Correcoes

## Status Atual

**Gateway:** RODANDO (PID ativo)
**Provider:** MiniMax-M2.5 (OpenAI-compatible)
**API:** Funcionando (HTTP 200)
**Versao hermes-agent:** 0.4.0 (atualizado do repo oficial)
**Telegram:** @SynkrooClawBot

---

## Resumo Executivo

Revisao completa do sistema Hermes e suas integracoes. Identificados **18 problemas** (3 criticos, 5 importantes, 4 configuracao, 3 infraestrutura, 3 menores). Todos corrigidos e sistema atualizado.

---

## Problemas Criticos Corrigidos

### BUG-01: Sintaxe URL em `start_hermes_v3.sh`
- **Problema:** `$https://api.minimax.io/v1` - `$` antes de URL causava expansao de variavel vazia
- **Correcao:** Substituido por script unificado `hermes.sh`

### BUG-02: Auto-referencia API Key
- **Problema:** `export MINIMAX_API_KEY="$MINIMAX_API_KEY"` - auto-referencia circular
- **Correcao:** Script unificado usa `source .env` com `set -a`

### BUG-03: Caminho venv Windows em WSL2
- **Problema:** `python.exe` do Windows nao funciona no WSL2
- **Correcao:** Script unificado usa `$HOME/.hermes/hermes-agent/venv/bin/python`

---

## Problemas Importantes Corrigidos

### BUG-04-08: Scripts Fragmentados
- **Problema:** 8+ scripts com caminhos inconsistentes (`/e/hermes`, `/mnt/e/hermes`, `~/.hermes/hermes-agent`)
- **Correcao:** Script unico `hermes.sh` com todos os caminhos padronizados

### Script Unificado: `scripts/hermes/hermes.sh`
Comandos disponiveis:
```bash
./hermes.sh start        # Iniciar gateway (persistente)
./hermes.sh stop         # Parar gateway
./hermes.sh restart      # Reiniciar gateway
./hermes.sh status       # Ver status
./hermes.sh logs         # Ver logs em tempo real
./hermes.sh diagnose     # Diagnostico completo
./hermes.sh test-api     # Testar API MiniMax
./hermes.sh clean        # Limpar sessoes corrompidas
```

Wrapper Windows: `scripts/hermes/hermes.bat`
Wrapper WSL2: `~/bin/hermes` (configurado via setup)

---

## Atualizacao do Repo Oficial

### Versao Antiga
- Git hash: `64d33320` (Merge PR #1242)
- Problema: `AttributeError: 'GatewayConfig' has no attribute 'group_sessions_per_user'`

### Versao Nova
- Git hash: `7c7feaa0` (v0.4.0, Merge PR #1929)
- Correcoes: 100+ commits de atualizacao
- Novos recursos: MCP tools, smart model routing, checkpoints

---

## Infraestrutura Atualizada

### systemd Service (`hermes-gateway.service`)
- Agora usa `EnvironmentFile` para carregar `.env`
- User dinamico (`%i`) ao inves de hardcoded (`junio`)
- Logs via systemd journal
- Limites de recursos (MemoryMax=1G, CPUQuota=80%)

### Configuracao `.env`
Localizacao: `~/.hermes/.env` (no WSL2)
Variaveis obrigatorias:
- `MINIMAX_API_KEY` (125 chars)
- `HERMES_INFERENCE_PROVIDER=minimax`
- `MINIMAX_BASE_URL=https://api.minimax.io/v1`

Template disponivel: `scripts/hermes/.env.example`

---

## Limpeza de Sessoes

- 66 arquivos `request_dump_*.json` removidos
- 35 sessoes antigas `.json` backed up e removidas
- 7 sessoes `.jsonl` backed up e removidas
- Backups em: `~/.hermes/sessions/backup_clean_20260318/`

---

## Testes Realizados

| Teste | Resultado |
|-------|-----------|
| Script help | OK |
| Script diagnose | OK |
| Gateway start | OK |
| Gateway status | OK |
| API MiniMax | HTTP 200 |
| MCP tools | 8 tools registradas |
| Memoria ChromaDB | 507 embeddings |
| Memoria Markdown | 6 arquivos |

---

## Arquitetura de Caminhos

```
/home/junio/.hermes/              # WSL2 - Hermes Home
├── hermes-agent/                 # Codigo do agente
│   ├── venv/                     # Virtual environment Python 3.11
│   ├── gateway/                  # Gateway (run.py)
│   ├── tools/                    # 23 ferramentas
│   └── skills/                   # 30 skills
├── .env                          # Variaveis de ambiente
├── logs/                         # Logs do gateway
│   ├── gateway.log               # Log principal
│   └── errors.log                # Log de erros
└── sessions/                     # Sessoes do Telegram

/mnt/e/openclaw/                  # E: drive - OpenClaw
├── .claude/memory/               # 6 arquivos Markdown
└── .openclaw/
    ├── memory/                   # SQLite core memory
    └── chroma_memory/            # 507 embeddings vetoriais

/mnt/c/Users/walis/.hermes/       # C: drive - Windows
└── sessions/                     # Session storage (config.yaml)
```

---

## Proximos Passos

- [ ] Monitorar gateway por 24h sem erros
- [ ] Implementar health check automatizado (cron)
- [ ] Rotacionar logs antigos automaticamente
- [ ] Testar fluxo completo via Telegram

---

## Referencias

- Repo oficial: https://github.com/NousResearch/hermes-agent
- Docs: https://hermes-agent.nousresearch.com/docs/
- MiniMax API: https://platform.minimax.io/

---

*Revisao realizada em 2026-03-18*
