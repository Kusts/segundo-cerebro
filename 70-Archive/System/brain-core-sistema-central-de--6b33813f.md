---
type: knowledge
id: brain-core-sistema-central-de--6b33813f
category: System
created: 2026-03-07
tags: [knowledge, System, auto-generated]
---

# 📚 Brain Core - Sistema Central de Conhecimento

# Brain Core - Sistema Central de Conhecimento

## Visão Geral

O **Brain Core** é o núcleo do sistema de conhecimento automatizado que:
1. Documenta AUTOMATICAMENTE tudo que o Claude faz
2. Permite que o Claude CONSULTE o cérebro como base de conhecimento
3. Mantém logs completos de toda atividade
4. Indexa conteúdo para busca rápida

**Arquivo:** `.claude/execution/brain_core.py`
**Classe:** `BrainCore`
**Versão:** 2.0.0 - Full Automation

## Inicialização

```python
from brain_core import BrainCore

brain = BrainCore(
    vault_path="C:/Users/walis/Documents/Obsidian/OpenClaw",
    workspace_root=None  # Detecta automaticamente
)
```

## Estrutura da Vault

```
Obsidian/
└── OpenClaw/
    ├── 00-Inbox/          # Capturas rápidas
    ├── 01-Projects/       # Projetos
    ├── 02-Planning/       # Planejamentos
    ├── 03-Knowledge/      # Conhecimento permanente
    │   ├── Architecture/
    │   ├── Procedures/
    │   ├── Discoveries/
    │   └── [categorias]
    ├── 04-Solutions/      # Soluções de problemas
    ├── 05-Archive/        # Arquivo
    ├── 06-Areas/          # Áreas de responsabilidade
    ├── 07-Daily/          # Notas diárias
    ├── 98-Assets/         # Assets
    ├── 99-Templates/      # Templates
    └── .brain/            # Metadados do sistema
        ├── index.json     # Índice de busca
        ├── embeddings.json# Embeddings (futuro)
        └── activity.log   # Log de atividades
```

## Documentação Automática

### `auto_document(event, data)`

Documenta automaticamente um evento no cérebro.

**Tipos de Evento:**

#### 1. `solution`

Documenta uma solução de problema.

```python
brain.auto_document("solution", {
    "problem": "Erro X ao fazer Y",
    "solution": "Fazer Z",
    "context": "Contexto adicional"
})
```

**Saída:** `04-Solutions/{id}.md`

```markdown
---
type: solution
id: erro-x-ao-fazer-y-abc123
created: 2026-03-07
tags: [solution, auto-generated]
---

# 🔧 Erro X ao fazer Y

## ❗ Problema

Erro X ao fazer Y

## 💡 Solução

Fazer Z

## 📊 Contexto

**Data:** 2026-03-07 14:30
**Fonte:** Auto-documentação
```

#### 2. `knowledge`

Documenta conhecimento permanente.

```python
brain.auto_document("knowledge", {
    "title": "Conceito Importante",
    "content": "Explicação detalhada...",
    "category": "Architecture"
})
```

**Saída:** `03-Knowledge/Architecture/{id}.md`

#### 3. `file_change`

Documenta mudança de arquivo significativa.

```python
brain.auto_document("file_change", {
    "path": "src/app.ts",
    "operation": "modified",
    "description": "Refatorou para usar novo padrão"
})
```

#### 4. `error`

Documenta erro e sua solução.

```python
brain.auto_document("error", {
    "error": "Stack trace do erro",
    "solution": "Como corrigir",
    "context": "Quando acontece"
})
```

**Saída:** `04-Solutions/{id}.md`

#### 5. `discovery`

Documenta descoberta importante.

```python
brain.auto_document("discovery", {
    "title": "Descoberta Importante",
    "description": "Explicação..."
})
```

**Saída:** `03-Knowledge/Discoveries/{id}.md`

## Busca e Consulta

### `search(query, limit)`

Busca no cérebro.

```python
results = brain.search("autenticação OAuth", limit=10)

for result in results:
    print(f"[{result['type']}] {result['title']}")
    print(f"   Relevância: {result['relevance']}")
    print(f"   📁 {result['path']}")
```

**Retorno:**
```python
[
    {
        "id": "oauth-auth-abc123",
        "type": "knowledge",
        "title": "Autenticação OAuth",
        "path": "03-Knowledge/Architecture/oauth-auth.md",
        "relevance": 25.0
    },
    ...
]
```

**Algoritmo de Relevância:**
- Matches exatos: 10 pontos
- Matches de palavras: 2 pontos

### `get_context_for_query(query)`

Retorna contexto formatado para query.

```python
context = brain.get_context_for_query("como implementar caching?")
```

**Saída:**
```markdown
## 🧠 Contexto do Segundo Cérebro

### 1. Implementação de Caching
**Tipo:** knowledge

Conteúdo da nota sobre caching...

### 2. Redis vs Memcached
**Tipo:** solution

Conteúdo da nota comparando Redis e Memcached...
```

### `ask_brain(query)`

Consulta o cérebro com resposta formatada.

```python
answer = brain.ask_brain("Qual a melhor estratégia de caching?")
print(answer)
```

## Indexação

### Índice Automático

Toda nota criada é automaticamente adicionada ao índice:

```json
{
  "oauth-auth-abc123": {
    "type": "knowledge",
    "title": "Autenticação OAuth",
    "path": "03-Knowledge/Architecture/oauth-auth.md",
    "created": "2026-03-07T14:30:00"
  }
}
```

### `rebuild_index()`

Reconstrói índice completo da vault.

```python
count = brain.rebuild_index()
print(f"{count} itens indexados")
```

Útil para:
- Indexar notas criadas manualmente
- Reindexar após mudanças na estrutura
- Recuperar índice corrompido

## Activity L