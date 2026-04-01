# Hermes Work System - Sistema de Trabalho Inteligente

**Data:** 2026-03-31  
**Versão:** 2.0  
**Status:** ✅ OPERACIONAL

---

## Evolução do Sistema

### Antes (v1)
- Agia sem consultar conhecimento existente
- Falhas não eram documentadas
- Não reaproveitava soluções
- Conhecimento disperso

### Depois (v2)
- **SEMPRE** consulta antes de agir
- Documenta sucesso e falha
- Reaproveita patterns e notas
- Sistema integrado de decisão

---

## Arquitetura do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                    HERMES WORK SYSTEM v2                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              AUTO-CONSULT LAYER                        │   │
│  │                                                         │   │
│  │  task → consult_all_sources()                          │   │
│  │         ├── Vault (Obsidian)                           │   │
│  │         ├── SAE (patterns, conventions, learnings)      │   │
│  │         ├── Failures (evitar repetição)                │   │
│  │         └── → Recommendation                           │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                   │
│                            ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              DECISION ENGINE                            │   │
│  │                                                         │   │
│  │  HIGH CONFIDENCE    → Usar pattern existente          │   │
│  │  MEDIUM-HIGH        → Pattern + Vault                 │   │
│  │  MEDIUM             → Consultar Vault                 │   │
│  │  CAUTION            → Falhas similares - evitar        │   │
│  │  NEW                → Definir abordagem do zero        │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                   │
│                            ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              EXECUTION LAYER                           │   │
│  │                                                         │   │
│  │  Execute with:                                         │   │
│  │  • Logging                                             │   │
│  │  • Error handling                                      │   │
│  │  • Alternative finding                                 │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                   │
│                            ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              DOCUMENTATION LAYER                       │   │
│  │                                                         │   │
│  │  SUCCESS → Update pattern (times_used++)              │   │
│  │  FAILURE → Document in failures_log.json              │   │
│  │            → Find alternatives                         │   │
│  │            → Resolve and update pattern                │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Componentes

### 1. auto_consultant.py
**Propósito:** Script principal de consulta automática

```bash
# Consultar fontes
python3 SAE/sae_v4/auto_consultant.py consult "tarefa"

# Status do sistema
python3 SAE/sae_v4/auto_consultant.py status
```

### 2. work_agent.py
**Propósito:** Agente de execução com logging completo

```bash
# Sessão completa
python3 SAE/sae_v4/work_agent.py consult "topic"
```

### 3. auto_consult() function
**Propósito:** Função integrada ao SAE Learning Processor

```python
from sae_learning_processor import auto_consult

result = auto_consult("minha tarefa técnica")
# Returns: vault_results, patterns, conventions, recommendation
```

### 4. working_protocol.json
**Propósito:** Protocolo de trabalho definindo princípios e fluxo

---

## Fontes de Conhecimento

| Fonte | Uso | Quando |
|-------|-----|--------|
| **Vault** | Notas, projetos, código | Preciso de contexto histórico |
| **SAE Patterns** | Soluções testadas | Tarefa similar já foi feita |
| **SAE Conventions** | Boas práticas | Seguir padrões estabelecidos |
| **Failures** | Erros conhecidos | Evitar repetir falhas |
| **YouTube** | Transcripts, tutoriais | Preciso de tutorial |
| **GitHub** | Código, issues | Preciso de solução técnica |
| **Perplexity** | Pesquisa web | Preciso de info atual |
| **Web** | Geral | Alternativa de pesquisa |

---

## Casos de Uso Testados

| Data | Tarefa | Vault | SAE | Recomendação |
|------|--------|-------|-----|--------------|
| 2026-03-31 | playwright chrome cdp | 5 ✅ | 1 ✅ | Vault + Pattern |
| 2026-03-31 | deploy railway | 5 ✅ | 7 ✅ | Pattern HIGH (score 9) |

---

## Princípios Fundamentais

1. **SEMPRE consultar antes de agir**
2. **Documentar TODO resultado** (sucesso ou falha)
3. **Reaproveitar** conhecimento existente
4. **Falhas são dados** - não终点, são informação
5. **Iterar** - se falhar, tentar alternativa imediatamente

---

## Métricas do Sistema

```python
{
    "patterns": 52,
    "conventions": 8,
    "learnings": 30+,
    "failures_logged": 20+,
    "skills": 40+
}
```

---

## Próximos Passos

- [ ] Integrar auto_consult ao fluxo do SAE principal
- [ ] Adicionar mais fontes (YouTube transcripts, GitHub)
- [ ] Melhorar scoring deVault
- [ ] Criar dashboard visual de consultations
- [ ] Automatizar cron jobs de research

---

**Conclusão:** Sistema de trabalho inteligente operando com consulta automática, documentação contínua e decisões baseadas em conhecimento histórico.
