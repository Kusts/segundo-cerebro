---
created: 2026-04-03
tags: []
type: note
---

# Análise: Agentic Search no SAE Context

**Data:** 2026-04-03  
**Investigador:** Hermes (autônomo)  
**Tags:** #agentic-search #sae #context #architecture

---

## Situação Atual — Investigação

### Sistema de Contexto Atual do Hermes

```
┌─────────────────────────────────────────────────────────────────┐
│                    HERMES CONTEXT LAYER                          │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────┐
│         context_compressor.py        │ ← Comprime contexto quando
│  (Compressão de conversa)            │   atinge limite (usa LLM)
└─────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────┐
│         context_references.py        │ ← Resolve @file, @folder,
│  (Referências @)                     │   @git, @url
└─────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────┐
│         vault_reader.py              │ ← Busca vault por KEYWORDS
│  Busca: keyword matching (grep)      │   (NÃO entende intenção)
│  Relevância: contagem de palavras   │   (RETORNA LISTA, não GRAFO)
└─────────────────────────────────────┘
```

### O que o VaultReader faz HOJE

```python
# Método _calculate_relevance (linha 173)
def _calculate_relevance(self, query: str, text: str) -> float:
    query_words = set(query.lower().split())
    text_lower = text.lower()
    matches = sum(1 for word in query_words if word in text_lower)
    return matches / len(query_words)  # Simples contagem!
```

**Problemas identificados:**

| Problema | Descrição |
|----------|-----------|
| **Keyword matching** | "auth flow" ≠ busca por intenção de entender auth |
| **Lista plana** | Retorna matches soltos, sem relações |
| **Zero compreensão** | Não entende O QUE o usuário QUER |
| **Sem navegação** | Não explora caminhos relacionados |

---

## Agentic Search — O que seria diferente

```
┌─────────────────────────────────────────────────────────────────┐
│              AGENTIC SEARCH (Futuro)                             │
└─────────────────────────────────────────────────────────────────┘

    Query: "como auth funciona no projeto?"

                    ▼
    ┌─────────────────────────────────────┐
    │     ETAPA 1: ENTENDER INTENÇÃO       │
    │     "Usuário quer entender fluxo     │
    │      de autenticação, não buscar     │
    │      palavra 'auth'"                 │
    └─────────────────────────────────────┘
                    │
                    ▼
    ┌─────────────────────────────────────┐
    │     ETAPA 2: PLANEJAR NAVEGAÇÃO      │
    │     Identificar pontos de entrada:   │
    │     - /auth/login.ts                 │
    │     - /middleware/auth.ts            │
    │     - /docs/auth.md                  │
    └─────────────────────────────────────┘
                    │
                    ▼
    ┌─────────────────────────────────────┐
    │     ETAPA 3: NAVEGAR COMO HUMANO     │
    │     Explora relações:                 │
    │     login.ts → middleware → JWT → API │
    └─────────────────────────────────────┘
                    │
                    ▼
    ┌─────────────────────────────────────┐
    │     ETAPA 4: CONSTRUIR GRAFO         │
    │     Output: GRAFO de contexto        │
    │     (não lista de matches)          │
    └─────────────────────────────────────┘
```

---

## Análise de Impacto e Risco

### Impacto: 🔴 ALTO
- Melhoraria **significativamente** qualidade de contexto
- Hermes seria mais inteligente em entender necessidades
- Menos "descontext" em respostas

### Risco: 🟡 MÉDIO
- **Arquitetura grande** — precisa alterar vault_reader.py (576 linhas)
- **Complexidade** — Agentic Search requer LLM para entender intenção
- **Performance** — navegação recursiva pode ser lenta
- **Testing** — precisa validar que não quebra busca atual

### Esforço estimado: 🟡 MÉDIO-ALTO
- ~2-3 dias para implementar versão funcional
- ~1 semana para testar e validar

---

## Alternativas Consideradas

| Alternativa | Prós | Contras |
|-------------|------|---------|
| **1. Implementar full Agentic Search** | Máximo benefício | Alto risco, muito esforço |
| **2. Melhorar relevância simples** | Baixo risco, rápido | Benefício limitado |
| **3. Híbrido: keyword + intent detection** | Balanceado | Mais complexo que #2 |
| **4. Adiar para v5** | Sem risco agora | Benefício perdido |

---

## Recomendação do Hermes (Autônomo)

```
┌─────────────────────────────────────────────────────────────────┐
│              RECOMENDAÇÃO: ALTERNATIVA 3                        │
│              HÍBRIDO: Keyword + Intent Detection               │
└─────────────────────────────────────────────────────────────────┘
```

### Por que NÃO a opção full Agentic Search agora?
- Alto risco + alto esforço = não justifica momento atual
- Precisamos validar conceito antes de implementar completo
- Podemos ganhar 70% do benefício com 30% do esforço

### O que seria o Híbrido?

```python
class HybridSearch:
    """
    Fase 1: Intent detection (simples)
    Fase 2: Keyword search melhorado
    Fase 3: Context graph básico
    """
    
    def search(self, query: str):
        # FASE 1: Detectar intenção
        intent = self.detect_intent(query)  # "entender", "encontrar", "comparar"
        
        # FASE 2: Buscar com estratégia baseada em intent
        if intent == "understand":
            # Busca por proximidade conceitual
            results = self.concept_search(query)
        else:
            # Busca keyword tradicional
            results = self.keyword_search(query)
        
        # FASE 3: Agrupar por contexto
        return self.build_context_groups(results)
```

---

## Plano de Implementação Sugerido

### Fase 1: Quick Wins (1-2 horas) ✅
```
- Melhorar scoring de relevância com IDF
- Adicionar n-grams para frases
- Agrupar resultados por arquivo
```

### Fase 2: Intent Detection básica (1 dia)
```
- Detectar tipo de query: "o que", "como", "encontre"
- Usar keywords + pequenas heurísticas
- Não precisa LLM ainda
```

### Fase 3: Context Graph simples (2-3 dias)
```
- Construir grafo de links entre notas
- Usar Graph navigation para explorar
- Medir melhoria vs baseline
```

---

## Métricas de Sucesso

| Métrica | Antes | Depois (meta) |
|---------|-------|--------------|
| Relevância média | ~40% | ~70% |
| Contexto perdido | Alto | Médio |
| Tempo de busca | 2s | 4s (trade-off aceitável) |

---

## Decisão Final

```
┌─────────────────────────────────────────────────────────────────┐
│  IMPLEMENTAR AGORA: Não                                         │
│  ADIAR PARA: v5 do SAE (after v4 stable)                       │
│  MOTIVO: Risco médio-alto + benefício comprovável só depois    │
│          de validar em sandbox primeiro                         │
└─────────────────────────────────────────────────────────────────┘
```

### Ações imediatas (baixo risco):
1. ✅ Documentar arquitetura desejada (esta nota)
2. ⏳ Criar sandbox para testar Agentic Search
3. ⏳ Implementar intent detection básica
4. ⏳ Validar com metrics antes de production

---

## Status: INVESTIGAÇÃO COMPLETA

Hermes recomenda **não implementar agora** (ALTO RISCO + ALTO ESFORÇO).

**Próximo passo:** Documentar como feature request para SAE v5.

Se walis quiser prosseguir, posso implementar a **Alternativa 3 (Híbrido)** com riesgo controlado.
