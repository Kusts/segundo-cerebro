---
title: Limpeza e Atualizacao do Hermes
date: 2026-03-19
tags:
  - hermes
  - wsl2
  - manutencao
type: solucao
---

# Limpeza e Atualizacao do Hermes - 2026-03-19

## Acoes Realizadas

### 1. Limpeza de Lixo do Hermes

**Removido definitivamente:**
- state.db.corrupt.bak (2.8 MB)
- state.db.broken-backup.* (24 KB)
- debug_smart*.py (5 arquivos)
- test_*.py (4 arquivos)
- openclaw_config.json.bak
- CLEANUP_REPORT.md
- __pycache__/

**Removido - Residuos OpenClaw (~35 MB):**
- agents/openclaw/ (1.8 MB)
- agents/openclaw_main/ (17 MB)
- auto-evolution/openclaw/ (16 MB)
- memory/openclaw_import/ (72 KB)
- cron/openclaw/ (288 KB)
- sessions/openclaw/ (20 KB)
- telegram/openclaw/ (12 KB)
- identity/openclaw/ (12 KB)
- credentials/openclaw/ + arquivos _openclaw.json
- skills/openclaw/ + skills/openclaw_main/
- identity/SOUL_OPENCLAW.md

### 2. Instalacao python-telegram-bot
- Versao 20.7 instalada no venv do Hermes
- Corrigido conflito de httpx

### 3. Configuracao de Modelo e Fallback

**Modelo primario:** minimax/MiniMax-M2.7
**Fallback:** openrouter/stepfun/step-3.5-flash:free

**Arquivos alterados:**
- openclaw_config.json - adicionado provider openrouter e modelo M2.7
- .env - ja tinha HERMES_MODEL=MiniMax-M2.7
- config.yaml - ja tinha model: MiniMax-M2.7

## Status do Gateway
- Gateway reiniciado e funcionando (PID 25169)
- Telegram conectado e polling
- 3.6 GB total apos limpeza

## Verificacoes
- Hermes funcionando normalmente apos limpeza
- Auto-evolution intacto
- Skills e agents intactos
