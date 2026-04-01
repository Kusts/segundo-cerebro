---
type: knowledge
id: frameworks-e-diretivas-claude--748f1275
category: System
created: 2026-03-07
tags: [knowledge, System, auto-generated]
---

# 📚 Frameworks e Diretivas - Claude Code

# Frameworks e Diretivas - Claude Code

## Frameworks de Orquestração

Os frameworks são estruturas para orquestrar múltiplos agentes e coordenar trabalho complexo.

### 1. Supervisor-Worker Framework

**Arquivo:** `.claude/frameworks/supervisor_worker.py`

**Arquitetura:**
```
        SUPERVISOR
             |
    ┌────────┼────────┐
    ▼        ▼        ▼
WORKER1  WORKER2  WORKERN
    │        │        │
    └────────┼────────┘
             ▼
       AGGREGATOR
```

**Funcionalidades:**
- Registra workers (agentes especializados)
- Delega tarefas para workers
- Agrega resultados
- Paralelização até N workers

**Uso:**
```python
framework = SupervisorWorkerFramework()
framework.register_worker("research", ResearchAgent())
framework.register_worker("code", CoderAgent())

result = await framework.execute("Research and implement X")
```

**Decisões do Supervisor:**
- `CONTINUE` - Continuar execução
- `COMPLETE` - Tarefa completa
- `REDISTRIBUTE` - Redistribuir trabalho
- `FAILED` - Falha na execução

---

### 2. Hierarchical Team Framework

**Arquivo:** `.claude/frameworks/hierarchical_team.py`

**Arquitetura:**
```
      TEAM LEAD
         /    \
    LEAD1    LEAD2
    /  \     /  \
  W1  W2   W3  W4
```

**Funcionalidades:**
- Estrutura hierárquica de times
- Múltiplos níveis de liderança
- Comunicação ascendente/descendente
- Delegação em níveis

---

### 3. State Graph Framework

**Arquivo:** `.claude/frameworks/state_graph.py`

**Funcionalidades:**
- Máquina de estados para agentes
- Transições baseadas em eventos
- Estados customizáveis
- Histórico de transições

**Uso:**
```python
graph = StateGraphFramework()
graph.add_state("idle")
graph.add_state("working")
graph.add_transition("idle", "working", "start_task")
```

---

### 4. Cache Manager

**Arquivo:** `.claude/frameworks/cache_manager.py`

**Funcionalidades:**
- Cache inteligente de resultados
- TTL configurável
- Cache semântico (via embeddings)
- Invalidação automática

**Uso:**
```python
cache = CacheManager()
cache.set("key", value, ttl=3600)
result = cache.get("key")
```

---

### 5. Agent Evaluator

**Arquivo:** `.claude/frameworks/agent_evaluator.py`

**Funcionalidades:**
- Avaliação de performance de agentes
- Métricas customizáveis
- Comparações entre agentes
- Ranking por performance

**Métricas:**
- Tempo de execução
- Taxa de sucesso
- Qualidade do resultado
- Uso de recursos

---

## Diretivas (SOPs)

Diretivas são Standard Operating Procedures (SOPs) reutilizáveis que definem "o que fazer" em linguagem natural.

### Estrutura de uma Diretiva

```markdown
# Nome da Diretiva

## Objetivo
[Objetivo da diretiva]

## Entrada
- Input 1
- Input 2

## Ferramentas/Scripts
- script1.py
- ferramenta X

## Processo (Passo a Passo)
### Passo 1
[Ação]

### Passo 2
[Ação]

## Saída
[Resultado esperado]

## Edge Cases
- Caso 1
- Caso 2

## Evolução
[Aprendizados]
```

---

### Diretivas Disponíveis

#### 1. `directive-base`

**Descrição:** Template base para criar novas diretivas.

**Uso:** Copie e adapte para novos procedimentos.

---

#### 2. `directive-implement-feature`

**Descrição:** SOP para implementar novas features.

**Etapas:**
1. Análise de requisitos
2. Design da solução
3. Implementação
4. Testes
5. Documentação
6. Code review

---

#### 3. `directive-devtools-playwright`

**Descrição:** SOP para usar Playwright em testes E2E.

**Etapas:**
1. Configurar ambiente
2. Escrever testes
3. Executar testes
4. Analisar resultados
5. Debug de falhas

---

#### 4. `directive-bmad-autonomous`

**Descrição:** SOP para executar BMAD de forma autônoma.

**Etapas:**
1. Inicializar contexto BMAD
2. Executar workflows
3. Gerar artefatos
4. Documentar decisões

---

#### 5. `skill-security-analysis`

**Descrição:** SOP para análise de segurança de skills.

**Etapas:**
1. Análise de código
2. Verificação de vulnerabilidades
3. Teste de permissões
4. Relatório de segurança

---

## Como Criar Nova Diretiva

1. Copie `directive-base.md`
2. Preencha cada seção
3. Adicione ao diretório `directives/`
4. Documente no índice

## Como Criar Novo Framework

1. Crie arquivo em `frameworks/`
2. Herde de classe base apropriada
3. Implemente métodos obrigatórios
4. Adicione testes
5. Documente uso

---

## Integração com Sistema

### Uso de Frameworks

```python
from frameworks import SupervisorWorkerFramework

# Inicializa
framework = SupervisorWorkerFramework()

# Registra workers
framework.register_worker("coder", CoderAgent())
framework.register_worker("tester", QAAgent())

# Executa
result = await framework.execute(task)
```

### Uso de Diretivas

```
/directive implement-feature
```

Ou referencie diretamente no contexto.

---

## Localização

```
.claude/
├── frameworks/
│   ├── supervisor_worker.py
│   ├── hierarchical_team.py
│   ├── state_graph.py
│   ├── cache_manager.