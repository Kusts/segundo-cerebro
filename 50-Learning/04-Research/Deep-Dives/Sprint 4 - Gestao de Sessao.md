---
type: note
title: Sprint 4 - Gestao de Sessao
project: Synkroo
sprint: 4
status: completo
created: 2026-03-17
updated: 2026-03-17T12:30
tags: [synkroo, sprint, supabase, auth, session, token, logout]
---

# Sprint 4 - Gestão de Sessão

## Objetivo

Implementar gestão avançada de sessão com refresh token automático, logout multi-aba, timeout de sessão e persistente "Lembre-me".

**Período:** 2026-03-17
**Status:** ✅ Completo

---

## Contexto

Após o Sprint 3 estabelecer autenticação OAuth com Google e GitHub, o sistema suporta:
- Login com email/senha
- Magic link (OTP)
- OAuth providers (Google, GitHub)
- Recuperação de senha
- Callback handling

### O que falta
- Refresh token automático (já configurado no client, mas precisa validação)
- Logout sincronizado em múltiplas abas
- Timeout de sessão por inatividade
- Opção "Lembre-me" com persistência estendida

### Solução
- Implementar listener para `TOKEN_REFRESHED` event
- Usar `storage` event para sincronizar logout entre abas
- Adicionar timer de inatividade com warning
- Persistir preferência "Lembre-me" no localStorage

---

## Arquitetura da Implementação

### 1. Refresh Token Automático

**Arquivo:** `src/packages/supabase/client.ts`

**Configuração Atual (já existente):**
```typescript
const supabaseOptions = {
  auth: {
    autoRefreshToken: true,  // ✅ Já habilitado
    detectSessionInUrl: true,
    persistSession: true,
    storageKey: 'synkroo-auth',
    expiresIn: 1800,  // 30 minutos
  },
  // ...
};
```

**Melhoria: Listener de Refresh**
```typescript
// Subscribe to auth state changes
export const onAuthStateChange = (
  callback: (event: string, session: Session | null) => void
) => {
  return supabase.auth.onAuthStateChange((event, session) => {
    logger.info('Auth event:', event, {
      hasSession: !!session,
      email: session?.user?.email
    });
    callback(event, session);
  });
};

// Listener específico para TOKEN_REFRESHED
export const onTokenRefreshed = (
  callback: (session: Session) => void
) => {
  return supabase.auth.onAuthStateChange((event, session) => {
    if (event === 'TOKEN_REFRESHED' && session) {
      callback(session);
    }
  });
};
```

**Casos de Uso:**
| Evento | Ação |
|--------|------|
| `SIGNED_IN` | Log login, atualizar UI |
| `TOKEN_REFRESHED` | Silent refresh, atualizar tokens |
| `SIGNED_OUT` | Limpar estado, redirect |
| `USER_UPDATED` | Atualizar dados do usuário |
| `SESSION_EXPIRED` | Forçar logout, mostrar aviso |

### 2. Logout em Múltiplas Abas

**Arquivo:** `src/App.tsx` (já existente - usarStorageSync)

**Implementação Atual:**
```typescript
const useStorageSync = () => {
  useEffect(() => {
    const handleStorageChange = (e: StorageEvent) => {
      if (e.key === 'demo_user' && !e.newValue) {
        // Session expired in another tab
        window.location.href = '/login';
      }
    };

    window.addEventListener('storage', handleStorageChange);
    return () => window.removeEventListener('storage', handleStorageChange);
  }, []);
};
```

**Melhoria: Suporte para Supabase Auth**
```typescript
const useAuthSync = () => {
  useEffect(() => {
    // Sync com storage event do Supabase
    const handleStorageChange = (e: StorageEvent) => {
      if (e.key === 'synkroo-auth' && !e.newValue) {
        // Logout em outra aba - fechar todas
        window.location.href = '/login';
      }
    };

    // Sync com onAuthStateChange do Supabase
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (event, session) => {
        if (event === 'SIGNED_OUT') {
          // Navegar para login
          window.location.href = '/login';
        }
      }
    );

    window.addEventListener('storage', handleStorageChange);
    return () => {
      window.removeEventListener('storage', handleStorageChange);
      subscription.unsubscribe();
    };
  }, []);
};
```

### 3. Timeout de Sessão por Inatividade

**Arquivo:** `src/features/auth/domain/hooks/useSessionTimeout.ts` (novo)

**Implementação:**
```typescript
import { useEffect, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { auth } from '@/packages/supabase/client';
import { logger } from '@/infrastructure/logger';

interface UseSessionTimeoutOptions {
  /** Timeout em ms (padrão: 30 minutos) */
  timeoutMs?: number;
  /** Warning antes do timeout (padrão: 5 minutos) */
  warningBeforeMs?: number;
  /** Callback quando timeout ocorrer */
  onTimeout?: () => void;
  /** Habilitar/desabilitar timeout */
  enabled?: boolean;
}

/**
 * Hook para timeout de sessão por inatividade
 */
export function useSessionTimeout({
  timeoutMs = 30 * 60 * 1000,      // 30 minutos
  warningBeforeMs = 5 * 60 * 1000, // 5 minutos
  onTimeout,
  enabled = true,
}: UseSessionTimeoutOptions = {}) {
  const navigate = useNavigate();
  const timerRef = useRef<NodeJS.Timeout | null>(null);
  const warningTimerRef = useRef<NodeJS.Timeout | null>(null);
  const lastActivityRef = useRef<number>(Date.now())