---
created: "2026-03-07T22:27:10.804000"
updated: "2026-03-18T13:38:41.645711"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
## @@ Notas Relacionadas

-

# Vibe Coding - Guia Completo

**Data:** 2026-03-07
**Tipo:** Conhecimento / Metodologia
**Tags:** [[vibe-coding]] [[ia]] [[programacao]] [[arquitetura]] [[openclaw]] [[memoria]]

---

## O que é Vibe Coding?

**Vibe Coding** = Usar IA para escrever código, focando no resultado desejado (o "vibe") em vez de syntax.

O desenvolvedor se torna um **arquiteto** que orquestra a IA.

---

## O Fluxo do Vibe Coder

```
┌──────────────────────────────────────────────────────┐
│                  VIBE CODING FLOW                     │
├──────────────────────────────────────────────────────┤
│   1. IDEA                                             │
│      "Quero um app de delivery"                       │
│            │                                          │
│            ▼                                          │
│   2. SPEC                                             │
│      Descrever funcionalidades, usuários, stack      │
│            │                                          │
│            ▼                                          │
│   3. VIBE                                             │
│      Descrever resultado com detalhes                 │
│            │                                          │
│            ▼                                          │
│   4. IA GENERATES                                     │
│      Código completo gerado                            │
│            │                                          │
│            ▼                                          │
│   5. REVIEW & ITERATE                                │
│      Testa, ajusta, pede mudanças                    │
│            │                                          │
│            ▼                                          │
│   6. DEPLOY                                          │
│      Vercel / Netlify / Railway                       │
│                                                       │
└──────────────────────────────────────────────────────┘
```

---

## Conceitos de Engenharia Essenciais

### 1. APIs e Comunicação

```javascript
// RESTful
GET /api/resource     // buscar
POST /api/resource    // criar
PUT /api/resource/:id // atualizar
DELETE /api/resource  // deletar

// Query params
GET /api/users?age>=18&city=SP

// Request body
POST /api/users
{ "name": "João", "email": "joao@email.com" }

// Response
{ "success": true, "data": {...} }
```

### 2. Autenticação vs Autorização

| Conceito | O que é | Exemplos |
|----------|---------|----------|
| **Auth** | Quem é você? | Login, JWT, OAuth |
| **Authorization** | O que você pode fazer? | Roles, permissões, RLS |

```javascript
// Auth - verificar identidade
const user = await supabase.auth.getUser()
if (!user) return redirect('/login')

// Authorization - verificar permissão
if (user.role !== 'admin') return forbidden()
```

### 3. Estado (State)

```javascript
// Estado local (componente)
const [count, setCount] = useState(0)

// Estado global (app)
const { user } = useAuth() // Context

// Estado persistente (banco)
await supabase.from('drafts').upsert({ ... })
```

### 4. Dados Relacionais vs Documentos

```
RELACIONAL (PostgreSQL)        DOCUMENTO (MongoDB)
─────────────────────          ──────────────────
users                          users
├── id                         ├── _id
├── name                       ├── name
├── orders[] → orders          ├── orders: [
│   ├── id                        { id, total, items: [...] }
│   ├── total                  ] }
│   └── user_id → users
```

### 5. Sync vs Async

```javascript
// SYNC - espera terminar
const user = await db.getUser(id)
console.log(user) // já tem dados

// ASYNC - não espera
await sendEmail() // dispara e continua

// O melhor dos dois:
await sendEmail() // await garante que enviou
```

---

## Erros Comuns em Vibe Coding

### 1. Não Entender o Código Gerado

```typescript
// ❌ Pediu "faz login" sem especificações
// Resultado: código estranho, bugs

// ✅ Especificou claramente
"Create login with:
- Email/password auth using Supabase Auth
- Redirect to /dashboard on success
- Show error toast on failure
- Use existing design system"
```

### 2. Ignorar Segurança

```typescript
// ❌ Prompt vago
"Add user profile page"

// ✅ Com segurança
"Add user profile page:
- Only authenticated users can access
- Show their own data only
- No sensitive info in URL
- Validate all inputs"
```

### 3. Tudo de Uma Vez

```typescript
// ❌ Muitogrande
"Create entire e-commerce with:
- Products, cart, checkout
- User accounts, admin panel
- Payment integration
- Email notifications
- Analytics
- Blog
- SEO
- Mobile app"

// ✅ Pequenos passos
Step 1: "Create basic product listing"
Step 2: "Add shopping cart"
Step 3: "Add user authentication"
Step 4: "Add checkout flow"
```

---

## Como Pedir para a IA: Templates

### 1. Novo Projeto

```
Create a [TYPE] project with:
- Frame
---

## @@ Tags

#auto-doc #hermes #ai
