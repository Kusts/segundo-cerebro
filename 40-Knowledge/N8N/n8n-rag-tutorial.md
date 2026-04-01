---
created: "2026-03-11T12:00:28.535000"
updated: "2026-03-18T13:38:45.411183"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# RAG Systems com n8n - Tutorial

> **Fonte:** n8n Blog
> **Data:** 2026-03-11

---

## O que é RAG?

**RAG = Retrieval-Augmented Generation**

Padrão de recuperar contexto relevante da sua base de conhecimento e usar para melhorar a resposta do modelo de AI.

**Problema:** Quando você joga todos os documentos em uma única base de conhecimento, a AI precisa procurar em tudo paraachar o relevante.

**Solução:** Domínios diferentes = contextos diferentes separados.

---

## Arquitetura

### Componentes:

1. **Google Drive** (ou outro storage)
   - Armazena documentos fonte
   - Ex: documentação de múltiplas propriedades

2. **Chat Interface**
   - n8n Chat trigger
   - Pode responder via webhook, Slack, WhatsApp, Telegram

3. **Search (Semantic Search)**
   - Busca por significado, não só palavras-chave
   - Ex: "freezing" → encontra "thermostat" mesmo sem mencionar a palavra
   - Ferramentas: Pinecone Assistant, Weaviate, etc

4. **Output Generation**
   - Large Language Model (Claude, OpenAI, etc)
   - Transforma os chunks em resposta natural

---

## Exemplo: Vacation Rentals

**Problema:** Guest pergunta "how to turn on the heat" → você envia instruções do thermostat errado → guest fica com frio

**Solução RAG:**
- Separate knowledge bases por propriedade
- Query routing: qual propriedade o guest está?
- Semantic search: encontrar resposta correta
- Gerar resposta personalizada

---

## Quando Usar RAG?

- Múltiplos clientes/produtos com documentação separada
- FAQ com categorias diferentes
- Suporte multi-tier
- Agências com múltiplos clientes

---

## Ferramentas n8n para RAG

- **Pinecone Assistant** - vector store + semantic search
- **Chat nodes** - interface de chat
- **HTTP Request** - APIs externas
- **AI Agent** - routing inteligente

---

## Tags
[[n8n]] [[rag]] [[ai]] [[automation]] [[knowledge-base]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*