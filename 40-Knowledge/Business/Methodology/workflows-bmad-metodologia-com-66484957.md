---
type: knowledge
id: workflows-bmad-metodologia-com-66484957
category: Methodology
created: 2026-03-07
tags: [knowledge, Methodology, auto-generated]
---

# 📚 Workflows BMAD - Metodologia Completa

# Workflows BMAD - Build More, Architect Dreams

## Visão Geral

**BMAD** (Build More, Architect Dreams) é uma metodologia ágil adaptativa com **43+ workflows guiados** para desenvolvimento orientado por IA.

## Estrutura do BMAD

```
_bmad/
├── bmm/                    # BMAD Modules
│   ├── workflows/          # Workflows organizados por fase
│   │   ├── 1-analysis/     # Fase de Análise
│   │   ├── 2-plan-workflows/  # Fase de Planejamento
│   │   ├── 3-implementation/ # Fase de Implementação
│   │   └── 4-quality/      # Fase de Qualidade
│   └── core/               # Módulos core
│       ├── tasks/          # Tarefas reutilizáveis
│       └── agents/         # Definições de agentes
└── output/                 # Artefatos gerados
```

## Fases do Desenvolvimento BMAD

### Fase 1: Análise (1-analysis)

#### Workflows Disponíveis:

| Workflow | Comando | Descrição |
|----------|---------|-----------|
| create-product-brief | `/bmad-create-product-brief` | Brief de produto |
| domain-research | `/bmad-domain-research` | Pesquisa de domínio |
| market-research | `/bmad-market-research` | Pesquisa de mercado |
| technical-research | `/bmad-technical-research` | Pesquisa técnica |

**create-product-brief** - Cria um brief inicial do produto:
1. Inicialização
2. Visão
3. Usuários
4. Métricas
5. Escopo
6. Completação

**research** - Três tipos de pesquisa:
- **Domain Research:** Análise de domínio, competitivos, regulações, tendências
- **Market Research:** Comportamento do cliente, dores, decisões, competição
- **Technical Research:** Overview técnico, padrões, implementação

### Fase 2: Planejamento (2-plan-workflows)

#### Workflows Disponíveis:

| Workflow | Comando | Descrição |
|----------|---------|-----------|
| create-prd | `/bmad-create-prd` | PRD completo |
| create-architecture | `/bmad-create-architecture` | Arquitetura da solução |
| create-ux-design | `/bmad-create-ux-design` | Design UX |
| create-epics-and-stories | `/bmad-create-epics-and-stories` | Épicos e histórias |
| sprint-planning | `/bmad-sprint-planning` | Planejamento de sprint |

**create-prd** - Cria PRD (Product Requirements Document):
- Propósito do produto
- Contexto e usuários
- Requisitos funcionais
- Requisitos não-funcionais
- Restrições e dependências

**create-architecture** - Define arquitetura técnica:
- Componentes
- Comunicação entre componentes
- Stack tecnológica
- Decisões arquiteturais (ADRs)

**create-ux-design** - Especifica design UX:
- Descoberta
- Experiência core
- Resposta emocional
- Sistema de design
- Jornadas do usuário
- Padrões UX

**create-epics-and-stories** - Quebra em épicos e histórias:
- Épicos (grandes funcionalidades)
- Histórias (entregáveis)
- Critérios de aceitação
- Dependências

### Fase 3: Implementação (3-implementation)

#### Workflows Disponíveis:

| Workflow | Comando | Descrição |
|----------|---------|-----------|
| dev-story | `/bmad-dev-story` | Implementar história |
| quick-dev | `/bmad-quick-dev` | Desenvolvimento rápido |
| create-story | `/bmad-create-story` | Criar história |
| code-review | `/bmad-code-review` | Revisão de código |

**dev-story** - Implementa uma história completa:
1. Carrega contexto da história
2. Planeja implementação
3. Implementa código
4. Testa
5. Documenta

**quick-dev** - Para mudanças pequenas:
- Spec rápida
- Implementação
- Teste

**code-review** - Revisão de código adversarial:
- Análise crítica
- Identificação de issues
- Sugestões de melhoria

### Fase 4: Qualidade (4-quality)

#### Workflows Disponíveis:

| Workflow | Comando | Descrição |
|----------|---------|-----------|
| qa-generate-e2e-tests | `/bmad-qa-generate-e2e-tests` | Testes E2E |
| deep-verify | `/bmad-deep-verify` | Verificação profunda |
| validate-prd | `/bmad-validate-prd` | Validar PRD |

## Comandos BMAD

### Comandos de Workflow

```markdown
/bmad-create-product-brief      # Criar brief de produto
/bmad-domain-research            # Pesquisa de domínio
/bmad-market-research            # Pesquisa de mercado
/bmad-technical-research         # Pesquisa técnica
/bmad-create-prd                 # Criar PRD
/bmad-validate-prd               # Validar PRD
/bmad-edit-prd                   # Editar PRD
/bmad-create-architecture        # Criar arquitetura
/bmad-create-ux-design           # Criar design UX
/bmad-create-epics-and-stories   # Criar épicos e histórias
/bmad-sprint-planning            # Planejar sprint
/bmad-sprint-status              # Status do sprint
/bmad-dev-story                  # Desenvolver história
/bmad-code-review                # Revisar código
/bmad-quick-spec                 # Spec rápida
/bmad-quick-dev                  # Dev rápido
/bmad-qa-generate-e2e-tests      # Gerar testes E2E
/bmad-retrospective              # Retrospectiva
/bmad-correct-course        