---
created: "2026-03-07T16:09:19.295820"
updated: "2026-03-18T13:38:42.193638"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🔐 Recursos e Credenciais

> References for important resources. **DO NOT store actual credentials here.**

## Ambientes

### Desenvolvimento Local
- **API URL**: `http://localhost:5000`
- **Gateway**: `http://127.0.0.1:18789`
- **Database**: Local PostgreSQL

### Produção
- **API**: https://api.synkroo.com
- **Dashboard**: https://app.synkroo.com

## Serviços

### Telegram
- Bot: @SynkrooClawBot
- API ID: Variável de ambiente `TELEGRAM_API_ID`
- API Hash: Variável de ambiente `TELEGRAM_API_HASH`

### OpenAI
- API Key: Variável `OPENAI_API_KEY`
- Modelo padrão: gpt-4

### Anthropic
- API Key: Variável `ANTHROPIC_API_KEY`
- Modelo: claude-opus-4-6

### Supabase
- Project URL: Variável `SUPABASE_URL`
- API Key: Variável `SUPABASE_ANON_KEY`

### AWS
- Region: us-east-1
- Access Key: Variável `AWS_ACCESS_KEY_ID`
- Secret Key: Variável `AWS_SECRET_ACCESS_KEY`

## Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
# OpenClaw
TELEGRAM_API_ID=seu_api_id
TELEGRAM_API_HASH=seu_api_hash

# OpenAI
OPENAI_API_KEY=sk-...

# Anthropic
ANTHROPIC_API_KEY=sk-ant-...

# Supabase
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_ANON_KEY=eyJxxx

# Database
DATABASE_URL=postgresql://...

# JWT
JWT_SECRET=sua_chave_secreta
```

## Notas
- Nunca commite arquivos `.env`
- Use `.env.example` como template
- Armazene secrets em password manager
- Use Vault para produção


---

*Enriquecido automaticamente pelo sistema de auto-documentação*