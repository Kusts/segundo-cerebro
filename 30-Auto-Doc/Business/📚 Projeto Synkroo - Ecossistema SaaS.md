---
type: knowledge
id: projeto-synkroo-ecossistema-sa-2b4d3c11
category: Project
created: 2026-03-07
tags: [knowledge, Project, auto-generated]
---

# 📚 Projeto Synkroo - Ecossistema SaaS

# Projeto Synkroo - Ecossistema SaaS Multi-Tier

## Visão Geral

**Localização:** `projects/Synkroo/`
**Status:** Em desenvolvimento
**Versão:** 1.0.0 (Produção Ready)

O **Synkroo** é um sistema de automação com IA para agências, vendido como SaaS white-label para clínicas.

## Ecossistema de 3 Camadas

| Plataforma | Descrição | Acesso |
|------------|-----------|--------|
| **👑 Nexus** | Plataforma master - Gestão de clientes, faturamento e feature flags | Donos da agência |
| **⚙️ Ops** | Operações técnicas - Prompts, agentes Python, monitoramento | Equipe técnica |
| **🏥 Hub** | Produto final white-label - Dashboard, Kanban, CRM, Agendamento | Clientes finais |

## Arquitetura

```
Frontend (React) → Backend (Supabase) → Integrações
```

**Tecnologias:**
- **Frontend:** React 18, TypeScript, Vite, TailwindCSS, shadcn/ui
- **Backend:** Supabase (PostgreSQL + Auth + Realtime)
- **Python:** FastAPI, LangChain, CrewAI
- **WhatsApp:** Evolution API
- **Pagamentos:** Asaas API

## Instalação Local

```bash
# Clone
git clone <repo-url>
cd Synkroo

# Instale
npm install

# Configure
cp .env.example .env.local

# Suba serviços locais
docker-compose -f docker-compose.dev.yml up -d

# Rode
npm run dev
```

**Acesso:** http://localhost:8080
**Credenciais:** `demo@synkroo.com` / `demo123`

## Instalação Produção (VPS Hostinger)

```bash
# Credenciais VPS (moltbot):
# PostgreSQL: postgres://postgres:moiika310s@moltbot_postgress:5432/moltbot
# Redis: redis://default:moiika310s@moltbot_redis:6379

# Deploy
cp .env.example .env.local
# Configure SECRET_KEY e chaves de API

docker-compose up -d
```

## Estrutura do Projeto

```
src/
├── pages/          # 16 páginas
├── features/       # Módulos (auth, conversations, admin, payments...)
├── packages/       # Design system, Supabase, Evolution API
└── components/     # UI components

brain/              # Python AI (4 agentes)
supabase/           # Migrations + Edge Functions
scripts/deploy/     # VPS deploy scripts
docs/               # Documentação completa
```

## Documentação Disponível

- `README.md` - Visão geral
- `MONOREPO.md` - Estrutura do monorepo
- `DEPLOYMENT.md` - Deploy em produção
- `DEVELOPER_GUIDE.md` - Guia para desenvolvedores
- `LOCAL_SETUP.md` - Setup local
- `TROUBLESHOOTING.md` - Solução de problemas
- `DEV_FULL_GUIDE.md` - Guia completo de desenvolvimento
- `IMPLEMENTATION_SUMMARY.md` - Resumo de implementação
- `CATEGORY_IMPLEMENTATION_SUMMARY.md` - Implementação por categoria
- `CATEGORY_SYSTEM_GUIDE.md` - Guia do sistema de categorias
- `VALIDACAO_FINAL.md` - Validação final

## Scripts de Deploy

- `dev-full-start.sh` / `dev-full-start.bat` - Inicia ambiente completo
- `dev-full-stop.sh` / `dev-full-stop.bat` - Para ambiente completo

## Configurações

### Docker Compose

- `docker-compose.yml` - Configuração base
- `docker-compose.dev.yml` - Desenvolvimento
- `docker-compose.prod.yml` - Produção
- `docker-compose.staging.yml` - Staging
- `docker-compose.production.yml` - Produção
- `docker-compose.monitoring.yml` - Monitoramento

### Variáveis de Ambiente

- `.env.example` - Template de variáveis
- `.env.local` - Variáveis locais (não commitado)
- `.env.production.template` - Template produção
- `.env.staging.example` - Exemplo staging

## Deploy

### VPS

O projeto usa PostgreSQL e Redis compartilhados na VPS Hostinger:

**Credenciais:**
- PostgreSQL: `postgres://postgres:moiika310s@moltbot_postgress:5432/moltbot`
- Redis: `redis://default:moiika310s@moltbot_redis:6379`

### Netlify

Configurado para deploy estático (frontend).

### Vercel

Configurado para deploy alternativo.

## Status do Projeto

- ✅ Produção Ready
- ✅ Multi-plataforma (3 tiers)
- ✅ White-label
- ✅ Automação com IA
- ✅ Integração WhatsApp
- ✅ Sistema de pagamentos

## Próximos Passos

1. Completar documentação técnica
2. Adicionar mais testes E2E
3. Otimizar performance
4. Expandir funcionalidades de IA


## 📊 Metadados

**Criado:** 2026-03-07 13:53
**Categoria:** Project
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
