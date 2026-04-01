---
created: "2026-03-17T22:31:56.374126"
updated: "2026-03-18T13:38:39.904984"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
## @@ Notas Relacionadas

-

# US-009: Setup de Testes - Vitest + Testing Library

**Status:** ✅ JÁ IMPLEMENTADO
**Data:** 2026-03-18

## Configuração Existente

### vitest.config.ts
```typescript
environment: 'jsdom'
setupFiles: ['./src/test/setup.ts']
include: ['src/**/*.{test,spec}.{ts,tsx}']
coverage provider: 'v8'
thresholds: 80% lines/functions, 70% branches
```

### Scripts Disponíveis
```bash
pnpm test                    # Vitest (run único)
pnpm test:watch             # Vitest --watch
pnpm test:e2e               # Playwright
pnpm test:e2e:ui            # Playwright --ui
pnpm test:e2e:auth          # Auth flows E2E
pnpm test:coverage          # Relatório de coverage
```

### Testes Existentes
- `button.test.tsx` ✅
- `badge.test.tsx` ✅
- `LoadingSpinner.test.tsx` ✅
- `useStreamingChat.test.ts` ✅
- `agentMetrics.test.ts` ✅
- `streaming.test.ts` ✅

### Setup File (`src/test/setup.ts`)
- Cleanup automático após cada teste
- Mock global do fetch
- Mock para ResizeObserver, IntersectionObserver, matchMedia
- Supabase mock completo (auth, from, channel)
- TanStack Query mock (useQuery, useMutation, QueryClient)
- Toast mock (sonner)

## Próximos Passos (US-010)

1. Testes unitários - hooks de Auth (useAuth, useTenantId)
2. Testes - components (ProtectedRoute, LoginForm, SignupForm)
3. Mocks do Supabase para testes isolados

## Coverage Thresholds

| Métrica | Threshold |
|---------|-----------|
| Lines | 80% |
| Functions | 80% |
| Branches | 70% |
| Statements | 80% |


---

*Enriquecido automaticamente pelo sistema de auto-documentação*
---

## @@ Tags

#auto-doc #hermes #development
