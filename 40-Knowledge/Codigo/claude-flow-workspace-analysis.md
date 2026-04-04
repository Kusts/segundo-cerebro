# Claude Code Workspace Analysis

**Generated:** 2026-04-03  
**Source:** `/mnt/c/Users/walis/OneDrive/Desktop/claude_code/workspace/projects/` e `/obsidian/`

---

## 1. PROJECT: cfo-pessoal

### Função no Ecossistema
Plataforma de gestão financeira pessoal com backend Node.js/Express e frontend mobile React. Integra-se com Supabase para base de dados e autenticação, e utiliza Claude AI (Anthropic) para assistência inteligente.

### Arquitectura e Tecnologias

| Camada | Tecnologia |
|--------|------------|
| Backend | Node.js + Express + TypeScript |
| Frontend Mobile | React 18 + React Router + Vite |
| Base de Dados | Supabase (PostgreSQL) |
| AI | Anthropic Claude SDK |
| Testing | Vitest |
| Validação | Zod |
| UI | TailwindCSS + Recharts |

**Key Dependencies:**
- `@supabase/supabase-js`: ^2.39.0
- `@anthropic-ai/sdk`: ^0.27.0
- `express`: ^4.18.2
- `zod`: ^3.22.4
- `playwright`: ^1.41.0

### Estrutura de Ficheiros

```
cfo-pessoal/
├── src/
│   ├── agent/          # Agentes AI
│   ├── api/            # Endpoints Express
│   ├── controllers/     # Controladores
│   ├── integrations/    # Integrações externas
│   ├── services/        # Lógica de negócio
│   ├── types/           # Definições TypeScript
│   └── index.ts         # Entry point
├── mobile/             # App React mobile
│   ├── src/
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── package.json
│   └── vite.config.ts
├── supabase/
│   ├── functions/       # Edge functions
│   ├── migrations/      # Schema migrations
│   └── seed.sql
├── tests/
│   ├── unit/           # Testes unitários Vitest
│   └── integration/    # Testes de integração
├── dist/               # Build output
└── package.json
```

### Dependencies e Conexões

- **Supabase**: Autenticação + Base de dados
- **Anthropic AI**: Assistente financeiro inteligente
- **Playwright**: Automação de testes E2E
- **WhatsApp Session**: `.swarm/model-router-state.json` - Estado de sessões AI

---

## 2. PROJECT: evolution-api

### Função no Ecossistema
API Docker para gestão de instâncias WhatsApp. Permite criar/gerir múltiplas sessões WhatsApp via API REST com autenticação por API key.

### Arquitectura e Tecnologias

| Componente | Tecnologia |
|------------|------------|
| API Server | Evolution API v2.3.7 (Node.js) |
| Base de Dados | MySQL 8.0 |
| Cache | Redis 7 Alpine |
| Containerização | Docker Compose |

### Estrutura de Ficheiros

```
evolution-api/
├── docker-compose.yml   # Configuração completa
├── .env                 # Variables de ambiente
└── EVOLUTION-API.md     # Documentação
```

### Dependencies e Conexões

**Serviços Docker:**
- `evolution-api`: Porta 8080
- `evolution-mysql`: Porta 3306
- `evolution-redis`: Porta 6379

**Configuração Importante:**
- API Key: `evolution_api_key_2026_secure`
- Endpoints: `http://localhost:8080`
- Docs: `http://localhost:8080/docs`

---

## 3. PROJECT: hermes

### Função no Ecossistema
Interface Python para integração Hermes-SAE. Contrato de comunicação entre o sistema Hermes e SAE (Sistema de Assistência Especial).

### Arquitectura e Tecnologias

| Componente | Tecnologia |
|------------|------------|
| Interface | Python 3 (type hints) |
| Tracking | SAEUsageTracker |
| Padrão | Observer Pattern |

### Estrutura de Ficheiros

```
hermes/
└── hermes_sae_interface.py  # Interface principal
```

### Dependencies e Conexões

**Fases de Integração:**
- Phase 0: Observação apenas (no action)
- Phase 1: Hermes pede sugestões à SAE

**Métodos Principais:**
- `init()`: Instala observer hooks
- `suggest()`: Request sugestão
- `capture()`: Envio de eventos
- `get_status()`: Debug status

**Eventos Capturados:**
- `tool_result`: Resultados de ferramentas
- `user_feedback`: Feedback do utilizador
- `gap_detected`: Lacunas detetadas

---

## 4. PROJECT: synkroo

### Função no Ecossistema
Plataforma Next.js com integração WhatsApp para gestão de clínica/serviços. Sistema completo com appointments, leads, patients, budgets, analytics e WhatsApp automation.

### Arquitectura e Tecnologias

| Camada | Tecnologia |
|--------|------------|
| Framework | Next.js 15 + React 19 |
| Base de Dados | Supabase |
| Testing | Jest + Playwright |
| PDF Generation | jsPDF + AutoTable |
| Charts | Recharts |
| Validação | Zod |
| Styling | TailwindCSS |
| WhatsApp | Playwright-extra + Puppeteer-stealth |

**Key Dependencies:**
- `@supabase/ssr`: ^0.5.0
- `next`: ^15.1.0
- `playwright`: ^1.48.0
- `jspdf`: ^4.2.1
- `recharts`: ^3.8.1
- `zod`: ^3.23.8

### Estrutura de Ficheiros

```
synkroo/
├── src/
│   ├── app/              # Next.js App Router
│   ├── components/       # Componentes React
│   ├── lib/              # Utilitários
│   ├── middleware/       # Next.js middleware
│   ├── services/         # Lógica de negócio
│   │   ├── agent/        # Agentes AI
│   │   ├── analytics/    # Análises
│   │   ├── appointments/ # Gestão de marcas
│   │   ├── budgets/      # Orçamentos
│   │   ├── followup/     # Follow-up clientes
│   │   ├── leads/        # Gestão leads
│   │   ├── patients/     # Gestão pacientes
│   │   ├── rag/          # RAG system
│   │   ├── reminders/    # Lembretes
│   │   ├── scheduler/    # Agenda
│   │   ├── waitlist/     # Lista de espera
│   │   └── whatsapp/     # Integração WhatsApp
│   └── types/            # Definições TypeScript
├── supabase/
│   ├── migrations/       # Schema migrations
│   └── config.toml       # Supabase config
├── e2e/                  # Playwright tests
├── docs/                 # Documentação
├── coverage/             # Test coverage
├── .whatsapp-session/    # WhatsApp session data
├── .swarm/               # Swarm AI state
└── package.json
```

### Dependencies e Conexões

- **Supabase**: Base de dados + SSR authentication
- **WhatsApp**: Integração via Evolution API ou sessão direta
- **AI Services**: Agent framework para automação
- **RAG System**: Recuperação de informação

**Scripts Úteis:**
```bash
npm run dev                 # Dev server
npm run db:setup           # Setup database
npm run db:push            # Push schema
npm run whatsapp:start     # Iniciar WhatsApp CLI
npm run health             # Health check
```

---

## 5. OBSIDIAN VAULT

### Estrutura e Tipo de Notas

```
obsidian/
├── README.md           # Documentação do vault
├── config/             # Configurações Obsidian
├── daily/              # Notas diárias (log)
├── decisions/          # Decisões arquiteturais (ADR)
├── patterns/           # Padrões aprendidos
├── projects/          # Progresso de projetos
├── templates/         # Templates Obsidian
└── sync.log           # Log de sincronização
```

### Decisões (ADR-like) - decisions/

**Estado:** Pasta vazia  
**Nota:** Decisions folder exists but no decisions recorded yet.

### Padrões - patterns/

Arquivados 2 padrões:

1. **pattern-bmad-workflow** (confidence: 0.92)
   - Tags: bmad, methodology

2. **pattern-clinica-ai-architecture** (confidence: 0.95)
   - Tags: clinica-ai, architecture
   - Valor: "14 módulos BPMN com 8 agentes"

### Daily Notes

**Ficheiros:**
- `2026-03-24.md`: Log do dia com atividades

**Estrutura das Daily Notes:**
- Atividades formatadas com timestamps
- Métricas por namespace
- Relatório de sincronização AgentDB → Obsidian

**Namespaces Monitorados:**
| Namespace | Descrição |
|-----------|------------|
| projects | Progresso de projetos |
| patterns | Padrões aprendidos |
| config | Configurações |
| daily | Logs automáticos |

### Templates

**auto-save-template.md**: Template para auto-save de notas

### Projects

**Ficheiros:**
- `clinica-ai-platform-progress.md`: Progresso do projeto clínica AI
- `teste-projeto.md`: Teste de sync

### Sistema de Sincronização

**Fluxo:**
1. Hook `session-end` detecta fim de sessão
2. Script `sync-agentdb-obsidian.js` executa
3. AgentDB entries → Markdown + Frontmatter
4. Daily log atualizado automaticamente

**Frontmatter Tags:**
- `sync: automated`
- `timestamp`
- `namespace`
- `key`
- `tags`

---

## 6. RESUMO EXECUTIVO

### Projetos

| Projeto | Stack Principal | Estado |
|---------|----------------|--------|
| cfo-pessoal | Node.js + React + Supabase + Claude AI | Ativo |
| evolution-api | Docker + MySQL + Redis | Configurado |
| hermes | Python + TypeScript (interface) | Integração |
| synkroo | Next.js 15 + Supabase + WhatsApp | Ativo |

### Padrões Identificados

1. **Supabase como Backend-as-a-Service** - Usado em cfo-pessoal e synkroo
2. **Arquitetura AI-first** - Agentes em ambos os projetos principais
3. **WhatsApp Integration** - evolution-api + synkroo
4. **BMAD Workflow** - Metodologia documentada
5. **Multi-agente Systems** - Clinica AI com 14 módulos/8 agentes

### Próximos Passos Sugeridos

1. Popular `/decisions/` com ADRs dos projetos
2. Documentar mais padrões aprendidos
3. Migrar documentação do EVOLUTION-API.md para Obsidian
4. Criar índice cross-project no vault

---

*Gerado automaticamente por Claude Code Workspace Analyzer*
