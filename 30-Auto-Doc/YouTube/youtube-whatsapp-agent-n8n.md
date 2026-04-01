---
created: "2026-03-13T14:04:33.961906"
updated: "2026-03-18T13:38:45.826710"
tags: [youtube, whatsapp, n8n, ai-agents, automation, tutorial]
type: knowledge
---
# Build a WhatsApp AI Agent for Appointment Handling (n8n Tutorial)

> **Canal:** Ed Hill | AI Automation
> **Data:** 2026-03-13
> **Vídeo ID:** vcvRVlc_VFg

---

## 📝 Transcrição

[Transcrição completa do áudio - 14:04:05]

Meu agente de IA no WhatsApp gerencia meus agendamentos, e é assim que funciona:

1. **Adicionar o trigger do WhatsApp** - para o agente saber quando uma mensagem chega
2. **Selecionar AI Agent** - adicionar o chatGPT como cérebro
3. **Adicionar WhatsApp novamente** - para o agente enviar a resposta
4. **Adicionar Google Calendar** - para buscar informações dos compromissos
5. **Deixar o modelo definir as opções** - e pronto!

**Teste:** "Quais são meus compromissos para amanhã?"
- O agente pega as info do Google Calendar
- Usa ChatGPT para gerar resposta
- Envia de volta para você

---

## 💡 Insights Principais

### Arquitetura do Agent WhatsApp + n8n

```
WhatsApp (trigger) → AI Agent (ChatGPT) → Google Calendar → WhatsApp (resposta)
```

### Componentes Principais
1. **WhatsApp Trigger** - Detecta mensagens recebidas
2. **AI Agent** - Brain com ChatGPT
3. **Google Calendar** - Integração para buscar compromissos
4. **WhatsApp Output** - Envia resposta de volta

### Case de Uso
- Automação de agendamentos
- Consulta de calendário via WhatsApp
- Agentes de IA para atendimento

---

## 🔧 Stack Técnica

- **n8n** - Platform de automação
- **ChatGPT** - LLMs para processamento
- **WhatsApp Business API** - Channel de comunicação
- **Google Calendar API** - Integração de calendário

---

## 🔗 Links

- [Vídeo no YouTube](https://www.youtube.com/watch?v=vcvRVlc_VFg)

---

*Transcrito em: 2026-03-13 14:04 (BRT)*

---

---

## 🔗 Notas Relacionadas

- [[youtube-learning-rotina]] - Rotina de aprendizado geral
- [[youtube-ai-agents-tutorial]] - Tutoriais de AI Agents
- [[youtube-n8n-agent]] - Tutorial de n8n AI Agent
- [[youtube-claude-code-tutorial-comleto]] - Tutorial completo Claude Code
- [[youtube-vibe-coding-2026]] - Pesquisa Vibe Coding 2026
- [[youtube-ai-agency-business]] - Negócio de Agência de IA

---

## 🏷️ Tags

#youtube #learning #ai #automation

---

*Enriquecido automaticamente pelo sistema de auto-documentação*