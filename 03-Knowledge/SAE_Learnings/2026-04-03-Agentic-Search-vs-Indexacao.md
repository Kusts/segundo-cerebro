---
created: 2026-04-03
tags: []
type: note
---

# Agentic Search vs Traditional Indexation

**Data:** 2026-04-03  
**Fonte:** Anthropic — Claude Code Best Practices  
**Tags:** #agentic-search #indexation #context #claude-code #ai

---

## Paradigma Tradicional: Indexação

```
┌─────────────────────────────────────────────────────────────┐
│              INDEXAÇÃO TRADICIONAL                            │
└─────────────────────────────────────────────────────────────┘

    1. CRAWLER varre todo o codebase
           │
           ▼
    2. INDEX cria lista de keywords/embeddings
           │
           ▼
    3. QUERY busca por matches de keywords
           │
           ▼
    4. RETORNA results desconectados do contexto
           │
           ▼
    ┌─────────────┐
    │   RESULT    │  ← Lista de arquivos sem conexão
    └─────────────┘
```

### Problemas da Indexação

| Problema | Descrição |
|----------|-----------|
| **Descontexto** | Retorna arquivos soltos, sem relação |
| **Keywords frágil** | Se palavra não está indexada, não encontra |
| **Sinônimos perdidos** | "car" ≠ "vehicle" ≠ "automobile" |
| **Atualização constante** | Index precisa ser reconstruído |
| **Sem intenção** | Não entende o QUE o usuário QUER |

---

## Novo Paradigma: Agentic Search

```
┌─────────────────────────────────────────────────────────────┐
│                  BUSCA AGÊNTICA                               │
└─────────────────────────────────────────────────────────────┘

    1. ENTENDE a intenção do usuário
           │
           ▼
    2. PLANEJA estratégia de navegação
           │
           ▼
    3. NAVEGA como desenvolvedor humano faria
           │
           ▼
    4. EXPLORA caminhos relevantes iterativamente
           │
           ▼
    5. CONSTRÓI contexto orgânico das relações
           │
           ▼
    ┌─────────────────────────────────────────┐
    │   CONTEXTO ESTRUTURADO + RELACIONADO    │
    └─────────────────────────────────────────┘
```

### Vantagens do Agentic Search

| Vantagem | Descrição |
|----------|-----------|
| **Contexto orgânico** | Constrói关系 dinamicamente |
| **Intenção primeiro** | Entende o objetivo, não só palavras |
| **Navegação humana** | Como um dev navegaria o código |
| **Adapta-se** | Pode mudar de estratégia conforme explora |
| **Menos false negatives** | Encontra mesmo sem keywords explícitas |

---

## Comparação Direta

| Aspecto | Indexação Tradicional | Agentic Search |
|---------|----------------------|-----------------|
| **Metodologia** | Index → Match → Return | Entende → Navega → Contextualiza |
| **Resultado** | Lista de arquivos | Grafo de contexto |
| **Qualidade** | Quantidade | Relevância contextual |
| **Atualização** | Rebuild constante | Aprende com uso |
| **Intention awareness** | ❌ | ✅ |
| **Relational understanding** | ❌ | ✅ |
| **Adaptativo** | ❌ | ✅ |

---

## Exemplo Prático

### Cenário
> "Preciso entender como o auth funciona neste projeto"

#### Abordagem Indexação
```
Query: "auth"
Resultado: 
- /src/auth/login.ts
- /src/auth/logout.ts
- /src/middleware/auth.ts
- /docs/auth.md

❌ Tenho 4 arquivos mas não sei como se relacionam
❌ Não sei o fluxo de autenticação
❌ Não sei onde começar
```

#### Abordagem Agentic Search
```
Entendimento: "Como auth funciona no projeto"
Navegação:
1. Vai para /src/auth/ e entende estrutura
2. Vê que login.ts chama middleware/auth.ts
3. Descobre que middleware verifica JWT
4. Identifica que /api/auth/* usa esse fluxo
5. Constrói grafo: login → middleware → JWT → API routes

✅ Resultado: Contexto completo do fluxo de autenticação
✅ Sei onde começar: login.ts
✅ Sei as relações: login → middleware → JWT
✅ Sei o fluxo completo
```

---

## Implementação Conceitual

```python
class AgenticSearch:
    """
    Busca agentica que navega como desenvolvedor humano
    """
    
    def __init__(self, codebase):
        self.codebase = codebase
        self.context_graph = Graph()
    
    async def search(self, query: str) -> ContextGraph:
        # 1. Entender intenção
        intention = self.understand_intention(query)
        
        # 2. Identificar ponto de entrada
        entry_points = self.find_entry_points(intention)
        
        # 3. Navegação agentica
        for entry in entry_points:
            await self.navigate_from(entry, intention)
        
        # 4. Construir contexto consolidado
        return self.context_graph.consolidate()
    
    async def navigate_from(self, node, intention):
        """Navega a partir de um nó como dev humano faria"""
        connections = self.codebase.get_connections(node)
        
        for conn in connections:
            if self.is_relevant(conn, intention):
                self.context_graph.add_edge(node, conn)
                await self.navigate_from(conn, intention)  # Recursivo
```

---

## Aplicação no Hermes

### Para o SAE Context Engine

```python
# ANTES (indexação simples)
def search_knowledge(query):
    results = []
    for note in all_notes:
        if query.lower() in note.content.lower():
            results.append(note)
    return results  # Lista desconexa

# DEPOIS (agentic search)
async def agentic_search(query):
    # 1. Entender intenção
    intention = understand(query)  # "auth flow", "como fazer login", etc
    
    # 2. Identificar notas candidatas
    candidates = find_candidates(intention)
    
    # 3. Navegar relações entre notas
    context = await build_context_graph(candidates, intention)
    
    # 4. Retornar grafo de conhecimento
    return context  # Com relações explícitas
```

---

## Quando Usar Cada Um

| Cenário | Recomendação |
|---------|--------------|
| Codebase pequeno (< 100 arquivos) | Qualquer um funciona |
| Codebase grande (> 1000 arquivos) | **Agentic Search** |
| Busca precisa por keyword | Indexação (rápido) |
| Entender fluxo/contexto | **Agentic Search** |
| autocomplete | Indexação (velocidade) |
| Exploração de código | **Agentic Search** |

---

## Referências

- Anthropic — Claude Code Best Practices
- https://youtube.com/watch?v=gv0WHhKelSE
- Nota relacionada: `2026-04-03-Claude-Code-Arquitetura-Software.md`

---

## Resumo Executive

> **Agentic Search** representa uma evolução fundamental: em vez de buscar por matches de keywords, o sistema **entende a intenção** e **navega organicamente** como um desenvolvedor humano faria, construindo um grafo de contexto rico em relações.

**Próxima ação:** Implementar Agentic Search no SAE Context Engine para melhorar qualidade de contexto.
