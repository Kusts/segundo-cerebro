---
name: software-development-mastery
description: Domínio completo de metodologias de desenvolvimento de software — do Waterfall ao AI-augmented development. Saber quando usar cada metodologia e como combiná-las.
version: 1.0.0
category: development
tags: [methodology, software-engineering, agile, devops, tdd, ddd, architecture, ai-development]
---

# Software Development Mastery

Mapa de domínio completo de metodologias de desenvolvimento de software. Saber **quando usar**, **como combinar**, e **como integrar com AI**.

---

## 1. DECISION GUIDE — Quando Usar O Quê

```
START
 │
 ├─► Regulação / compliance / segurança crítica?
 │    ├─ SIM → V-Model (embedded, médica, aeroespacial)
 │    └─ NÃO ↓
 │
 ├─► > 50 engenheiros no mesmo produto?
 │    ├─ SIM → SAFe (enterprise) ou LeSS (simplicidade)
 │    └─ NÃO ↓
 │
 ├─► Projeto novo com requisitos incertos?
 │    ├─ SIM → Scrum (sprints) ou Kanban (prioridades mudam constantemente)
 │    │         └─ Código é crítico? → XP (TDD + Pair Programming)
 │    └─ NÃO ↓
 │
 ├─► Fazendo ops/support/manutenção?
 │    ├─ SIM → Kanban + SRE (error budgets + blameless postmortems)
 │    └─ NÃO ↓
 │
 ├─► MVP / experimento / projeto pessoal?
 │    ├─ SIM → Getting Real + Vibe Coding
 │    └─ NÃO ↓
 │
 └─► Domínio de negócio complexo?
      ├─ SIM → DDD + Event-Driven
      └─ NÃO → DevOps + CI/CD (para qualquer equipa que queira entregar rápido)
```

**Resumo rápido:**

| Situação | Metodologia |
|---|---|
| Compliance / regulated | V-Model |
| Produto novo, requisitos mudam | Scrum + AI-Assisted |
| Código como vantagem competitiva | XP + TDD |
| Ops / maintenance / support | Kanban + SRE |
| 50-500+ engenheiros | SAFe |
| MVP rápido, pequena equipa | Getting Real + Vibe Coding |
| Domínio complexo | DDD + Event Sourcing |
| Fiabilidade > features | SRE + Error Budgets |
| Developer experience interna | Platform Engineering |
| AI-first workflows | Prompt-Driven + AI Agents |

---

## 2. TRADITIONAL METHODS

### Waterfall
**Princípio:** Cada fase completa antes da próxima começar. Linear, documentado.

- **Usa quando:** Requisitos fixos (contratos, regulação), tecnologia comprovada, procurement longo
- **Problemas:** Sem feedback até tarde, mudanças caro, cliente só vê no fim
- **AI fit:** Baixo — feedforward, não iterativo

### V-Model
**Princípio:** Waterfall + teste por fase. Cada fase de desenvolvimento tem teste correspondente.

- **Usa quando:** Software crítico de segurança (aviónica, médica, automóvel), certificação obrigatória (DO-178C, IEC 62304)
- **Melhoria sobre Waterfall:** Validação em cada etapa, matriz de rastreabilidade

---

## 3. AGILE FAMILY

### Scrum — sprints com papéis definidos
**Princípio:** Time-boxed iterations (2-4 semanas), roles definidos (PO, SM, Dev), artefactos (backlog, sprint backlog, increment)

| Cerimónia | Duração | O que é |
|---|---|---|
| Sprint Planning | 8h (sprint 2 sem) | O que? + Como? |
| Daily Standup | 15 min/dia | O que fiz? O que vou fazer? Bloqueios? |
| Sprint Review | 4h máx | Demo do increment |
| Sprint Retro | 3h máx | O que melhorar? |

- **Equipa:** 5-9 pessoas
- **Melhor para:** Produtos com requisitos em mudança
- **AI fit:** Excelente — ciclos curtos = feedback natural para AI

### Kanban — fluxo contínuo, sem papéis fixos
**Princípio:** WIP limits, fluxo contínuo, visualização (board)

- **Usa quando:** Equipas de ops/support, prioridades mudam constantemente, trabalho interrupt-driven
- **Não tem:** Sprints, roles obrigatórios, time-boxes
- **Métricas:** Lead time, throughput, WIP
- **AI fit:** Excelente — categorização automática, SLA prediction

### XP (eXtreme Programming) — excelência técnica
**Princípio:** Todas as práticas ao extremo. engineering-first Agile.

| Prática | O que faz |
|---|---|
| Pair Programming | 2 devs, 1 teclado — code review contínuo |
| TDD | Testes ANTES do código |
| Continuous Integration | Integrar a cada horas, nunca no fim |
| Refactoring | Melhorar código sem adicionar features |
| Simple Design | Simplest thing that works |
| Collective Ownership | Qualquer um pode alterar qq ficheiro |
| 40-hour Week | Sem crunch |

- **Equipa:** 2-12 (não escala acima de 12-16)
- **Melhor para:** Greenfield, alta qualidade de código
- **AI fit:** Excelente — AI como pair programming partner

### SAFe — scaling Agile para enterprise
**Princípio:** 5 níveis (Portfolio → Solution → Essential → Team), PI Planning de 2 dias, Agile Release Train (50-125 pessoas)

- **Usa quando:** Enterprise (500+), múltiplas equipas, sistemas interdependentes
- **Cuidado:** Complexidade alta, pode virar "SAFe theater"
- **AI fit:** Bom mas complexo de integrar uniformemente

### LeSS — Scrum scaled, não novo framework
**Princípio:** Menos é mais. 1 Product Backlog, 1 Product Owner, equipas Scrum partilham sprint

- **Usa quando:** 2-8 equipas no mesmo produto, simplicidade > estrutura
- **Diferente de SAFe:** Baseado em Scrum puro, menos roles/cerimónias

---

## 4. MODERN OPERATIONS

### DevOps
**Princípio:** Unificar Dev + Ops. CALMS (Culture, Automation, Lean, Measurement, Sharing)

**3 Ways:**
1. Flow: esquerda→direita, dev→cliente o mais rápido possível
2. Feedback: direita→esquerda, ops→dev rápido
3. Continuous Learning: cultura blameless

**DORA Metrics:**
| Métrica | Elite | High | Medium | Low |
|---|---|---|---|---|
| Deployment Frequency | On-demand | Diário | Semanal | Mensal+ |
| Lead Time | < 1h | 1d-1sem | 1-6 meses | 6+ meses |
| Time to Restore | < 1h | < 1 dia | 1-7 dias | 6+ meses |
| Change Failure Rate | 0-15% | 16-30% | 16-30% | 16-30% |

### SRE (Site Reliability Engineering)
**Princípio:** Tratar operações como problema de engenharia. Data > intuition.

**Conceitos-chave:**
- **SLI** (Service Level Indicator): métrica (latência < 200ms)
- **SLO** (Service Level Objective): target (99.9% < 200ms)
- **Error Budget**: 100% - SLO = quanto pode falhar
  - Budget esgotado → não faz features, foca em reliability
  - Budget saudável → ship livremente
- **Toil**: trabalho manual/repetitivo que deveria ser automático
- **Blameless Postmortem**: documentar sem culpar

### Platform Engineering
**Princípio:** Construir Internal Developer Platform (IDP) com self-service. Golden Path = default opinativo que "just works".

```
┌─────────────────────────────────────────┐
│  Developer Self-Service (Portal, CLI)   │
├─────────────────────────────────────────┤
│  CI/CD │ Observability │ DB │ IAM │ Infra│
├─────────────────────────────────────────┤
│  Kubernetes │ Terraform │ Vault │ ...   │
└─────────────────────────────────────────┘
```

---

## 5. AI-AUGMENTED DEVELOPMENT

### Nível 1: AI-Assisted (complementa qualquer metodologia)
**Princípio:** AI como ferramenta — autocomplete, code review, bug finding

- Funciona com Scrum, Kanban, XP, DevOps
- AI-generated code = review obrigatório (igual a PR humano)

### Nível 2: Vibe Coding (prompt → code → iterate)
**Princípio:** Humano=diretor, AI=builder. Iterar prompt→código→executa.

- Melhor para: prototypes, MVPs, explorar código unfamiliar
- **Cuidado:** Sem architectural oversight, dívida técnica acumula rápido
- **Best practice:** AI gera, humano revê arquitetura e integration tests

### Nível 3: Prompt-Driven Development (multi-agent)
**Princípio:** Humano escreve spec/prompt detalhado, agentes AI executam loops

```
Spec → AI Agent (plan→implement→test→report) → Sucesso?
                                              ↓ Falha?
                                         Debug / Refine prompt → Retry
```

- Melhor para: refactoring em escala, generate tests para 100 ficheiros
- **Cuidado:** Agentes podem fazer erros em cascata

### Compatibilidade AI × Metodologia

| Metodologia | AI-Assisted | Vibe Coding | Prompt-Driven |
|---|---|---|---|
| Scrum | ✅ Excelente | ✅ Bom | ✅ Bom |
| Kanban | ✅ Excelente | ⚠️ Contexto | ✅ Bom |
| XP | ✅ Excelente | ⚠️ Com TDD | ✅ Bom |
| DevOps | ✅ Excelente | ✅ Bom | ✅ Bom |
| SRE | ✅ Excelente (AIOps) | ⚠️ Não típico | ✅ Excelente |
| Waterfall | ⚠️ Limitado | ⚠️ Limitado | ⚠️ Docs/specs |
| V-Model | ⚠️ Limitado | ⚠️ Limitado | ⚠️ Limitado |
| Getting Real | ✅ Excelente | ✅ Excelente | ⚠️ Limitado |
| DDD | ✅ Excelente | ✅ Bom | ✅ Bom |

---

## 6. ARCHITECTURE + PROCESS

### DDD (Domain-Driven Design)
**Princípio:** Modelo partilhado entre tech e business. Código = modelo.

**Strategic:**
- **Bounded Context**: fronteira onde um domínio é válido
- **Ubiquitous Language**: linguagem partilhada devs ↔ domain experts
- **Subdomain**: core, supporting, generic

**Tactical:**
- **Aggregate**: cluster de objetos relacionados (Order + OrderItems)
- **Entity**: identidade (Order #123 ≠ Order #456)
- **Value Object**: sem identidade, imutável (Money, Address)
- **Domain Event**: algo significativo que aconteceu

### TDD (Test-Driven Development)
**Princípio:** RED (teste a falhar) → GREEN (código mínimo) → REFACTOR

```
         ┌───────┐
         │  RED  │  Escreve teste pequeno
         └───┬───┘
             ▼
         ┌───────┐
         │ GREEN │  Código mínimo para passar
         └───┬───┘
             ▼
         ┌──────────┐
         │ REFACTOR │  Limpa código, testes ficam verdes
         └──────────┘
```

**Testing Pyramid:**
```
       ┌──────┐
       │  E2E │  (poucas, lentas)
       ├──────┤
       │Integr│  (algumas)
       ├──────┤
       │ Unit │  (muitas, rápidas)
       └──────┘
```

### BDD (Behavior-Driven Development)
**Princípio:** Given-When-Then em linguagem natural. Tests = especificação executável.

```gherkin
Scenario: Login com sucesso
  Given utilizador "alice" existe com password "Secret123"
  When utilizador submete login com username "alice" e password "Secret123"
  Then utilizador é redireccionado para dashboard
  And utilizador vê mensagem de boas-vindas
```

- Ferramentas: Cucumber, SpecFlow, Behave
- **Melhor para:** Equipas onde stakeholders non-tech participam

### Event-Driven Architecture
**Princípio:** Componentes comunicam por eventos assíncronos, não chamadas directas

| Pattern | Quando usar |
|---|---|
| Pub/Sub | 1 producer, muitos consumers (notificações) |
| Event Streaming | Kafka — log durável, replays (audit trail) |
| CQRS | Separa read/write models (alta escala) |
| Saga | Transações distribuídas via eventos |
| Event Sourcing | Guardar estado como sequência de eventos |

---

## 7. LIGHTWEIGHT PROJECT MANAGEMENT

### Shape Up (Basecamp)
**Princípio:** Tempo fixo, scope variável. 6 semanas por cycle.

| Conceito | O que é |
|---|---|
| Appetite | Tempo que estamos dispostos a gastar (não dinheiro) |
| Bets | Projetos financiados para o cycle |
| Hill Charts | Tracking progresso → objetivo (não só % completo) |
| Cool-down | 2 semanas entre cycles para exploração |

**Vantagem sobre Scrum:** Sem death marches — tempo fixo, scope adapta.

### Getting Real (37signals)
**Princípio:** Build less, ship faster. Começa pequeno, itera com feedback real.

Rejeita:
- Long requirements docs
- Extended planning phases
- Large teams
- Enterprise features antes de ter customers
- Over-engineering para escala hipotética

---

## 8. COMBINAÇÕES PRÁTICAS

### High-velocity Product Team
```
Scrum (cadência) + DevOps (delivery) + SRE (reliability) + AI-Assisted (produtividade)
```

### Code Quality Focus
```
XP (engineering) + TDD (tests) + DDD (domain model) + AI Pair Programming
```

### Scale + Speed
```
LeSS ou SAFe (scaling) + Platform Engineering (DX) + DevOps (delivery) + AI-Assisted
```

### Solo Developer / Startup
```
Getting Real (minimal process) + Vibe Coding (rapid build) + AI Agents (escalamar)
```

### Complex Domain
```
DDD (bounded contexts) + Event Sourcing (audit) + CQRS (scale) + BDD (specs com stakeholders)
```

---

## 9. PITFALLS COMUNS

| Metodologia | Erro comum | Solução |
|---|---|---|
| Scrum | Sprint commitment = deadline pressão | Product Owner define scope, não a equipa |
| Kanban | "Apenas faz o próximo" sem disciplina | WIP limits estritos, políticas explícitas |
| XP | Pair programming =也觉得累 | Pair rota,也觉得难 |
| SAFe | SAFe theater (cerimónias sem substance) | Começar pelo Essential SAFe, não tudo de uma vez |
| TDD | 100% coverage = correctness | Tests de valor, não apenas cobertura |
| DDD | Analysis paralysis com tactical patterns | Strategic DDD primeiro, tactical depois |
| DevOps | Criar "DevOps team" separado | DevOps é cultura, não team |
| Vibe Coding | Confiar em AI sem architectural oversight | Humano revê arquitectura, AI gera código |

---

*Skill criada: 2026-04-03 | Domínio: software engineering methodology*
*Versão: 1.0.0 | Tags: #methodology #agile #devops #ai-development*
