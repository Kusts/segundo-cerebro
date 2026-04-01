---
type: knowledge
id: agentes-python-asset-factory-395a34d1
category: Architecture
created: 2026-03-07
tags: [knowledge, Architecture, auto-generated]
---

# 📚 Agentes Python - Asset Factory

## Agentes Python - Asset Factory

### Visão Geral

O sistema possui **12 agentes Python especializados** que implementam o pipeline SPARC (Plan→Speak→Act→Reflect→Correct).

### 1. ResearchAgent (`research_agent.py`)

**Arquivo:** `.claude/agents/research_agent.py`
**Classe:** `ResearchAgent(BaseAgent)`

**Propósito:** Pesquisa e investigação na web

**Capabilidades:**
- Web search para documentação e best practices
- Síntese de informações de múltiplas fontes
- Relatórios de pesquisa estruturados

**Pipeline SPARC:**
```
Plan → Decompõe pesquisa em queries de busca
Act  → Executa searches via WebSearchTool
Reflect → Sintetiza resultados coletados
Correct → Refina busca se necessário
```

**Métodos Principais:**
- `plan(state)` - Analisa tarefa e cria queries de busca
- `act(state)` - Executa searches e coleta informações
- `_decompose_research(task)` - Divide tarefa em queries (até 5)
- `_synthesize_results(collected_info)` - Compila relatório final

**Ferramentas:**
- `WebSearchTool` - Busca na web com max_results padrão de 10

**Quando Usar:**
- Pesquisar antes de implementar
- Encontrar exemplos e tutoriais
- Investigar best practices

---

### 2. CoderAgent (`coder_agent.py`)

**Arquivo:** `.claude/agents/coder_agent.py`
**Classe:** `CoderAgent(BaseAgent)`

**Propósito:** Implementação de código

**Capabilidades:**
- Geração de código a partir de specs
- Execução e teste de código
- Correção de bugs e erros

**Pipeline SPARC:**
```
Plan → Analisa requisitos e decompõe em passos
Act  → Implementa via CodeExecutionTool
Reflect → Verifica implementação
Correct → Corrige erros se necessário
```

**Métodos Principais:**
- `plan(state)` - Decompõe em passos de implementação
- `act(state)` - Executa cada passo sequencialmente
- `_decompose_implementation(task)` - Divide tarefa em passos

**Ferramentas:**
- `CodeExecutionTool` - Execução sandboxed de código

**Quando Usar:**
- Implementar features
- Escrever testes
- Corrigir bugs

---

### 3. PlannerAgent (`planner_agent.py`)

**Arquivo:** `.claude/agents/planner_agent.py`
**Classe:** `PlannerAgent(BaseAgent)`

**Propósito:** Planejamento e decomposição de tarefas

**Capabilidades:**
- Divide tarefas complexas em subtarefas
- Identifica dependências entre tarefas
- Estima tempo e recursos necessários
- Cria planos de execução estruturados

**Estrutura de Saída (TaskDecomposition):**
```python
{
    "main_task": "Tarefa principal",
    "subtasks": [
        {"id": "1", "task": "Analyze requirements", "priority": "high"},
        {"id": "2", "task": "Design solution", "priority": "high"},
        {"id": "3", "task": "Implement", "priority": "medium"},
        {"id": "4", "task": "Test", "priority": "medium"},
        {"id": "5", "task": "Deploy", "priority": "low"}
    ],
    "dependencies": {
        "3": ["2"],  # Tarefa 3 depende da 2
        "4": ["3"],
        "5": ["4"]
    },
    "estimated_time": "4 hours"
}
```

**Quando Usar:**
- Planejar sprints
- Quebrar epics em histórias
- Criar planos de projeto

---

### 4. ReviewerAgent (`reviewer_agent.py`)

**Propósito:** Revisão de código

---

### 5. AnalyzerAgent (`analyzer_agent.py`)

**Propósito:** Análise de código

---

### 6. QAAgent (`qa_agent.py`)

**Propósito:** Testes e QA

---

### 7. DevOpsAgent (`devops_agent.py`)

**Propósito:** DevOps e infraestrutura

---

### 8. DataCollectorAgent (`data_collector_agent.py`)

**Propósito:** Coleta de dados

---

### 9. EmailAgent (`email_agent.py`)

**Propósito:** Emails e notificações

---

### 10. SecurityAgent (`security_agent.py`)

**Propósito:** Segurança e vulnerabilidades

---

### 11. DataAnalyticsAgent (`data_analytics_agent.py`)

**Propósito:** Analytics e dashboards

---

### 12. IntegrationAgent (`integration_agent.py`)

**Propósito:** Integrações de API

---

## Arquitetura Base

### BaseAgent

Todos os agentes herdam de `BaseAgent` localizado em `.claude/core/base_agent.py`:

**Atributos:**
- `name: str` - Nome do agente
- `description: str` - Descrição das capacidades
- `config: AgentConfig` - Configurações

**Métodos do Pipeline SPARC:**
- `async plan(state: AgentState) -> AgentState`
- `async speak(state: AgentState) -> AgentState`
- `async act(state: AgentState) -> AgentState`
- `async reflect(state: AgentState) -> AgentState`
- `async correct(state: AgentState) -> AgentState`

**Gerenciamento de Ferramentas:**
- `add_tool(tool: BaseTool)` - Registra ferramenta
- `execute_tool(name, **kwargs)` - Executa ferramenta
- `_register_tools()` - Override para registrar ferramentas

### AgentConfig

Configuração do agente:
```python
{
    "enable_auto_resource_selection": True,  # Auto-detecção de recursos
    "enable_auto_expansion": True,           # Auto-expansion
    "max_reflections": 3,                    # Máx de correções
    "timeout": 300          