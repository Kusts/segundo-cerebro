---
type: knowledge
id: skills-do-openclaw-513-skills-3ae80bb5
category: Reference
created: 2026-03-07
tags: [knowledge, Reference, auto-generated]
---

# 📚 Skills do OpenClaw - 513+ Skills

# Skills do OpenClaw - Sistema Extensível

## Visão Geral

O OpenClaw possui um sistema de **skills** instaláveis e extensíveis. Cada skill é um pacote npm independente que adiciona funcionalidades ao assistente.

**Total de Skills:** 513+

## Estrutura das Skills

```
skills/
├── [skill-name]/
│   ├── package.json         # Metadados da skill
│   ├── skill.md             # Documentação
│   ├── scripts/             # Scripts da skill
│   ├── hooks/               # Hooks de evento
│   └── [arquivos da skill]
```

## Skills Principais Instaladas

### Sistema de Memória

#### memory-system
**Descrição:** Sistema completo de memória para o assistente.

#### memory-qdrant
**Descrição:** Memória vetorial usando Qdrant.

#### lily-memory
**Descrição:** Sistema de memória Lily.

#### smart-memory
**Descrição:** Memória inteligente com contexto.

#### secure-memory-stack
**Descrição:** Stack de memória segura.

### Agentes Especializados

#### agent-chronicle
**Descrição:** Agente cronista - registra eventos.

#### agent-weave
**Descrição:** Agente que tece conexões.

#### agent-social
**Descrição:** Agente para interações sociais.

#### agent-avengers
**Descrição:** Agente estilo Vingadores.

#### agent-services-cn
**Descrição:** Agente de serviços em chinês.

### Integrações

#### asana
**Descrição:** Integração com Asana para gestão de tarefas.
- Scripts: `asana_api.mjs`, `asana_chat.mjs`
- OAuth: `oauth_oob.mjs`
- Configure: `configure.mjs`

#### password-manager
**Descrição:** Gerenciador de senhas seguro.
- Scripts: `password-manager.mjs`
- Hooks: `openclaw/handler.mjs`

### Pesquisa e Automação

#### research-engine
**Descrição:** Motor de pesquisa avançada.

#### browser-research-lite
**Descrição:** Pesquisa via navegador.

#### web-autopilot
**Descrição:** Automação web com IA.

#### ai-humanizer
**Descrição:** Humaniza respostas de IA.

#### research-paper-writer
**Descrição:** Escreve papers de pesquisa.

### Capacidades

#### accessibility-toolkit / ct-accessibility-toolkit
**Descrição:** Toolkit de acessibilidade.

### Outros Skills

- `cross-model-review` - Revisão cross-modelo
- `self-evolving-skill` - Skill auto-evolutiva
- `evolver` - Evolução de capacidades
- `capability-evolver` - Evolução de capabilities
- `memory-master` - Mestre de memória
- `mlops-automation-cn` - MLOps chinês
- `deep-research-pro` - Pesquisa profunda
- `startup-agent` - Agente para startups
- `agent-casino` - Agente cassino
- `agent-bounty-scanner` - Scanner de bounties

## Como Criar Nova Skill

### Estrutura Básica

```bash
mkdir skills/minha-skill
cd skills/minha-skill
npm init -y
```

### package.json

```json
{
  "name": "minha-skill",
  "version": "1.0.0",
  "openclaw": {
    "type": "skill",
    "name": "Minha Skill",
    "description": "Descrição da skill"
  }
}
```

### skill.md

```markdown
# Minha Skill

## Descrição
O que esta skill faz.

## Uso
Quando usar esta skill.

## Comandos
- `comando1` - Descrição
- `comando2` - Descrição
```

## Instalar Skill

```bash
cd skills/minha-skill
pnpm install
pnpm link ../
```

## Hooks

As skills podem usar hooks para responder a eventos:

```javascript
// hooks/openclaw/handler.mjs
export async function handleEvent(event) {
  // Processa evento
}
```

## Eventos Disponíveis

- `message` - Mensagem recebida
- `command` - Comando executado
- `schedule` - Evento agendado
- `webhook` - Webhook recebido

## Integração com MoltBot

O projeto `packages/moltbot/` é uma skill/configuração específica para MoltBot.

## Scripts Úteis

### Listar skills instaladas

```bash
ls skills/
```

### Ver info de skill

```bash
cd skills/nome-da-skill
cat package.json
```

### Testar skill

```bash
cd skills/nome-da-skill
npm test
```


## 📊 Metadados

**Criado:** 2026-03-07 14:14
**Categoria:** Reference
**Fonte:** Auto-documentação

## 🔗 Relacionado

-
