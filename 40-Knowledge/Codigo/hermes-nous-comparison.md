# Hermes Agent — Comparação: NousResearch vs Instalação Local

**Data:** 2026-04-03
**NousResearch upstream:** v0.7.0 (2026.04.03)
**Instalação local:** v0.6.0 (atrás 1 versão)

---

## Resumo Executivo

A instalação local está **1 versão atrás** do upstream (v0.6.0 vs v0.7.0). Foram feitas **alterações locais** em 6 ficheiros core, maioritariamente **remoções** de funcionalidades do upstream. Há **1 tool custom** (`sae_guidance_tool`) e **1 ficheiro de config local** (`gateway.json`).

---

## Inventário de Diferenças

### Ficheiros apenas na instalação local
| Ficheiro | O que é |
|---|---|
| `CLAUDE.md` | Documentação de identity/architecture do Hermes v3 local |
| `gateway.json` | Config local do gateway (Telegram token, etc) |
| `tools/sae_guidance_tool.py` | Tool custom SAE (239 linhas) — não existe no upstream |
| `node_bin/`, `node_modules/` | Dependências Node instaladas localmente |
| `honcho_integration/` | Integração Honcho (memória) |
| `hermes_agent.egg-info/` | Package info |

### Ficheiros apenas no upstream (ausentes localmente)
| Ficheiro | O que é |
|---|---|
| `RELEASE_v0.7.0.md` | Release notes v0.7.0 (ausente porque local é v0.6.0) |

---

## Alterações por Ficheiro

### 1. `model_tools.py` — +1 linha
```diff
+        "tools.sae_guidance_tool",
```
**Significado:** Adicionou a tool custom `sae_guidance_tool` à discovery de tools. Esta tool é a interface entre o agente e o SAE auto-loop.

---

### 2. `run_agent.py` — REMOVIDO (~24 linhas)
Removido todo o bloco de Memory provider tools routing:
```python
# REMOVIDO:
elif self._memory_manager and self._memory_manager.has_tool(function_name):
    # Memory provider tools (hindsight_retain, honcho_search, etc.)
    # These are not in the tool registry — route through MemoryManager.
    ...
```
**Significado:** O upstream moveu as memory provider tools para o tool registry como plugin system. A instalação local **removou** esta rota, o que pode quebrar ferramentas de memória baseadas em provider (Honcho, hindsight_retain, etc).

---

### 3. `gateway/run.py` — REMOVIDO (~55 linhas)
Remoções múltiplas:

**a) Approve/Deny bypass removido:**
```python
# REMOVIDO:
# /approve and /deny must bypass the running-agent interrupt path.
if _cmd_def_inner and _cmd_def_inner.name in ("approve", "deny"):
    if _cmd_def_inner.name == "approve":
        return await self._handle_approve_command(event)
    return await self._handle_deny_command(event)
```
**Impacto:** Comandos `/approve` e `/deny` no gateway já não fazem bypass do running-agent guard — podem ser engolidos como interrupts.

**b) Per-platform disabled skill check removido:**
```python
# REMOVIDO:
_skill_name = skill_cmds[cmd_key].get("name", "")
_plat = source.platform.value if source.platform else None
if _plat and _skill_name:
    from agent.skill_utils import get_disabled_skill_names as _get_plat_disabled
    if _skill_name in _get_plat_disabled(platform=_plat):
        return f"The **{_skill_name}** skill is disabled for {_plat}..."
```
**Impacto:** Skills desabilitadas por platform no config já não são verificadas antes de executar no gateway.

**c) Button-based approval (Discord) removido:**
```python
# REMOVIDO:
# Prefer button-based approval when the adapter supports it.
if getattr(type(_status_adapter), "send_exec_approval", None) is not None:
    # Discord button-based approval...
```
**Impacto:** Discord perde UI rica com botões — cai para fallback texto.

---

### 4. `agent/skill_utils.py` — SIMPLIFICADO (~19 linhas removidas)
```diff
# ANTES:
def get_disabled_skill_names(platform: str | None = None) -> Set[str]:
    resolved_platform = (
        platform
        or os.getenv("HERMES_PLATFORM")
        or os.getenv("HERMES_SESSION_PLATFORM")  # REMOVIDO
    )

# DEPOIS:
def get_disabled_skill_names() -> Set[str]:
    resolved_platform = os.getenv("HERMES_PLATFORM")  # Só uma fonte
```
**Impacto:** Funcção mais simples, menos flexível. `HERMES_SESSION_PLATFORM` já não é lido.

---

### 5. `agent/prompt_builder.py` — Cache key simplificado (~8 linhas removidas)
```diff
# REMOVIDO do cache key:
_platform_hint = (
    os.environ.get("HERMES_PLATFORM")
    or os.environ.get("HERMES_SESSION_PLATFORM")
    or ""
)
cache_key = (
    ...,
    _platform_hint,  # REMOVIDO
)
```
**Impacto:** Cache de skills prompt já não differentiate por platform — pode servir prompts de platform errada a múltiplosplatformas no mesmo processo.

---

### 6. `hermes_cli/commands.py` — Telegram menu filtering removido (~17 linhas)
Removida a lógica de filtrar skills desabilitadas para Telegram do menu de comandos:
```python
# REMOVIDO:
_platform_disabled: set[str] = set()
try:
    from agent.skill_utils import get_disabled_skill_names
    _platform_disabled = get_disabled_skill_names(platform="telegram")
except:
    pass
...
if skill_name in _platform_disabled:
    continue
```
**Impacto:** Menu Telegram pode mostrar comandos que deveriam estar ocultos.

---

## Ficheiro Custom: `tools/sae_guidance_tool.py`

Tool custom de 239 linhas que:
- Lê recomendações do SAE auto-loop em `~/.hermes/SAE/session_guidance/{session_id}.json`
- Disponibiliza patterns, skills, risks detectados ao agente
- Evita duplicados (track `read[]`)
- Regista-se no tool registry como `"tools.sae_guidance_tool"`

**Não existe no upstream** — é desenvolvimento local do walis/Hermes v3.

---

## O que mudou no upstream v0.7.0 (ausente localmente)

### Funcionalidades novas no upstream que local não tem:

| Funcionalidade | Impacto |
|---|---|
| **Pluggable Memory Provider Interface** | Sistema de memória plugável com Honcho como referência |
| **Same-Provider Credential Pools** | Multiple API keys com rotação automática `least_used` |
| **Camofox Anti-Detection Browser** | Browser stealth com auto-install via `hermes tools` |
| **Inline Diff Previews** | Diffs visuais em write/patch na tool activity feed |
| **API Server Session Continuity** | `X-Hermes-Session-Id` headers, persiste para SessionDB |
| **ACP Client-Provided MCP Servers** | Editors registam os próprios MCP servers |
| **Secret Exfiltration Blocking** | Browser URLs e respostas LLM scanned para secrets |
| **Compression Death Spiral fix** | Para loop onde compression falha e volta a comprimir |
| **`/yolo` command** | Toggle dangerous command approvals por sessão |
| **`/btw` command** | Perguntas efémeras sem afectar contexto principal |
| **`/profile` command** | Info do profile activo sem sair da sessão |
| **Discord button-based approvals** | UI rica com botões `/approve` e `/deny` |

---

## Avaliação de Impacto

### Riscos da instalação desatualizada

| Risco | Severidade | Notas |
|---|---|---|
| Memory provider tools quebradas | **ALTA** | Bloco removido de run_agent.py sem replacement |
| Approve/Deny gateway routing quebrado | **ALTA** | Comandos podem ser engolidos no gateway |
| Sem credential pools (multi-API-key) | MÉDIA | Funcionalidade nova do v0.7.0 |
| Sem Camofox browser | BAIXA | Funcionalidade nova |
| Sem secret exfiltration blocking | **ALTA** | Segurança |

### Alterações locais vs upstream

| Categoria | Count |
|---|---|
| Linhas removidas | ~150+ |
| Linhas adicionadas (custom) | ~240 (sae_guidance_tool) + config |
| Ficheiros custom | 4 (`CLAUDE.md`, `gateway.json`, `sae_guidance_tool.py`, `honcho_integration/`) |

---

## Recomendação

**Atualizar para v0.7.0** — há fixes de segurança críticos (secret exfiltration blocking, compression death spiral) e a arquitetura de memory providers mudou significativamente.

**Antes de atualizar:**
1. Backup do `gateway.json` (token Telegram)
2. Garantir que `sae_guidance_tool.py` continua a funcionar após update
3. Testar `/approve` e `/deny` no gateway após update
4. Verificar se `honcho_integration/` é compatível com o novo pluggable memory system

---

*Relatório gerado: 2026-04-03*
*Fontes: diff upstream vs local, RELEASE_v0.7.0.md*
