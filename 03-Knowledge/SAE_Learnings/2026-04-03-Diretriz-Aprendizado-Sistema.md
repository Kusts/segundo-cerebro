---
created: 2026-04-03
tags: []
type: note
---

# Diretriz: Sistema de Aprendizado Contínuo

**Data:** 2026-04-03  
**Professor:** walis  
**Tags:** #hermes #learning #diretriz #auto-aprimoramento

---

## Princípio Central

Todo aprendizado deve ser:
1. **Salvo** no Vault do Obsidian + Memória
2. **Analisado** de forma inteligente para determinar próxima ação
3. **Consultado** automaticamente antes de executar tarefas

---

## Fluxo de Aprendizado

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUXO DE APRENDIZADO                          │
└─────────────────────────────────────────────────────────────────┘

   APRENDIZADO OCORRE
          │
          ▼
┌─────────────────────┐
│  1. SALVAR          │
│  - Vault (Obsidian) │
│  - Memória (Hermes) │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│  2. ANALISAR        │
│  O que posso fazer  │
│  com este conheci-  │
│  mento?             │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────────────────────────┐
│  3. AÇÕES POSSÍVEIS (escolher ≥1)       │
├─────────────────────────────────────────┤
│  □ Auto-aprimoramento (melhorar Hermes) │
│  □ Melhorar projetos existentes          │
│  □ Gerar novo recurso/skill            │
│  □ Melhorar recurso existente            │
│  □ Passar conteúdo ao walis             │
│  □ Criar nota de conhecimento           │
│  □ Atualizar skill                      │
│  □ Corrigir/gap identificado            │
│  □ Criar avaliação (eval)               │
└─────────────────────────────────────────┘
          │
          ▼
┌─────────────────────┐
│  4. EXECUTER +      │
│  REGISTRAR RESULTADO│
└─────────────────────┘
```

---

## Categorias de Aprendizado

| Categoria | Descrição | Exemplo |
|-----------|-----------|---------|
| **Novo Conhecimento** | Informação nova que amplia saber | "Agentic search é melhor que indexação" |
| **Nova Forma de Fazer** | Método alternativo para tarefa | "Usar terminal como adaptador universal" |
| **Solução de Erro** | Correção de problema | "Erro de cookies → usar login via browser" |
| **Melhoria de Processo** | Otimização de workflow existente | "Pattern paralelo para tasks independentes" |
| **Padrão Arquitetural** | Estrutura comprovada | "3 patterns de agents: único/sequencial/paralelo" |
| **Insight de Research** | Descoberta em pesquisa | "CLAUDE.md melhora contexto persistente" |

---

## Análise Inteligente — Perguntas a Fazer

Para cada aprendizado, devo perguntar:

```
1. AUTO-APRIMORAMENTO
   → Como isso pode melhorar o Hermes/SAE?
   → Posso criar uma skill nova?
   → Posso melhorar skill existente?

2. PROJETOS EXISTENTES
   → Isso se aplica a algum projeto atual?
   → Há projetos que precisam ser atualizados?

3. CONHECIMENTE DO WALIS
   → O walis se beneficiaria desse conteúdo?
   → Devo gerar relatório/resumo?

4. RECURSOS EXISTENTES
   → Isso contradiz algo que já sabemos?
   → Atualiza ou expande conhecimento anterior?

5. PRÓXIMOS PASSOS
   → Como posso validar/testar esse aprendizado?
   → Preciso de mais research?
```

---

## Exemplo Prático — Aprendizado Claude Code

### Aprendizado
> "Pattern Paralelo para tasks independentes reduz latência"

### Análise

| Pergunta | Resposta |
|----------|----------|
| Auto-aprimoramento? | SIM → Implementar no Hermes para tasks paralelas |
| Melhorar projetos? | SIM → SAE hooks podem rodar em paralelo |
| Passar ao walis? | SIM → Relatório de arquitetura |
| Gerar recurso? | SIM → Nova skill: `parallel-agent-pattern` |
| Melhorar existente? | Atualizar `agent-autonomy` skill |

### Ações Geradas
```
□ Implementar executor paralelo no Hermes
□ Criar skill parallel-agent-pattern
□ Atualizar agent-autonomy com pattern paralelo
□ Passar relatório de 3 patterns ao walis
□ Adicionar eval para medir speedup paralelo
```

---

## Implentação no Hermes

### Antes de Cada Tarefa
```python
# Checklist de Aprendizado
if nova_tarefa:
    1. Consultar skills        # mcp_skills_list()
    2. Consultar memória       # memory
    3. Consultar vault          # grep no Segundo_Cerebro
    4. Consultar SAE            # patterns, gaps, outcomes
    5. Se não encontrou → research
```

### Após Cada Aprendizado
```python
# Checklist de Salvamento
if aprendeuAlgo():
    1. Salvar no Vault         # Nota em 03-Knowledge/SAE_Learnings/
    2. Salvar na memória       # mcp_memory()
    3. Analisar implicações    # Perguntas acima
    4. Executer ações           # Criar skill, passar info, etc.
```

---

## Local de Salvamento

### Vault (Obsidian)
```
Segundo_Cerebro/03-Knowledge/SAE_Learnings/
├── YYYY-MM-DD-Tema-Aprendizado.md    (conhecimento)
├── YYYY-MM-DD-Erro-Solução.md        (erros resolvidos)
├── YYYY-MM-DD-Diretriz-New.md        (diretrizes/processos)
└── YYYY-MM-DD-Padrão-Arquitetural.md (arquitetura)
```

### Memória (Hermes)
```
# Todo aprendizado vai para memory E vault
# Memória = resumo executivo
# Vault = detalhes completos
```

---

## Status de Implementação

| Item | Status |
|------|--------|
| Salvar no Vault | ✅ Habitual |
| Salvar na Memória | ✅ Habitual |
| Análise Inteligente | ⚠️ EM ANDAMENTO (lição aprendida hoje) |
| Consultar Aprendizados | ⏳ A IMPLEMENTAR |
| Ações pós-aprendizado | ⏳ A IMPLEMENTAR |

---

**Próximo Passo:** Aplicar análise inteligente ao aprendizado de Claude Code e gerar ações concretas.
