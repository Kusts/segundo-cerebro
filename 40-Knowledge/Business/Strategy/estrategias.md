---
created: "2026-03-07T16:07:50.798767"
updated: "2026-03-18T13:38:42.814906"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 💡 Estratégias de Desenvolvimento

## Resolução de Problemas

### Debugging Sistemático
1. **Reproduzir** - Crie caso de teste
2. **Isolar** - Reduza o problema
3. **Hipotetizar** - Trace a causa raiz
4. **Testar** - Valide a hipótese
5. **Corrigir** - Implemente a solução
6. **Verificar** - Confirme que funcionou
7. **Documentar** - Registre a solução

### Debugging de Erros
```
1. Ler o stack trace completo
2. Identificar o erro real (não sintoma)
3. Buscar o ponto exato do problema
4. Verificar variáveis e estados
5. Testar hipóteses
6. Corrigir a causa raiz
```

## Performance

### Otimização Prematura
- **NÃO** otimize antes de medir
- Use profiler para identificar gargalos
- 80/20: 20% do código causa 80% dos problemas

### Estratégias
- **Cache** - Memorize resultados
- **Lazy Load** - Carregue sob demanda
- **Batch** - Agrupe operações
- **Index** - Banco de dados
- **CDN** - Assets estáticos
- **Compress** - Reduza tamanho

### Métricas Core Web Vitals
- **LCP** - Largest Contentful Paint (< 2.5s)
- **FID** - First Input Delay (< 100ms)
- **CLS** - Cumulative Layout Shift (< 0.1)

## Segurança

### OWASP Top 10
1. Broken Access Control
2. Cryptographic Failures
3. Injection
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable Components
7. Auth Failures
8. Data Integrity Failures
9. Logging Failures
10. SSRF

### Boas Práticas
- Validate input
- Escape output
- Use parameterized queries
- HTTPS everywhere
- Hash passwords
- Least privilege
- Keep dependencies updated

## Refatoração

### Quando Refatorar
- Código duplicado
- Funções grandes
- Nomes ruins
- Acoplamento forte
- Testes difíceis
- Performance ruim

### Técnicas
- Extract Method
- Rename Variable
- Move Method
- Introduce Parameter Object
- Replace Conditional with Polymorphism

### Ordem
1. Make changes under test
2. One thing at a time
3. Small commits
4. Run tests after each change

## Decisões de Arquitetura

### Critérios de Escolha
| Critério | Pergunta |
|----------|----------|
| Complexidade | Quanto tempo para aprender? |
| Comunidade | Suporte disponível? |
| Performance | Atende requisitos? |
| Integração | Funciona com o stack? |
| Custo | Licença e manutenção? |

### Trade-offs Comuns
- **Simples vs Flexível**
- **Acoplado vs Testável**
- **Pronto vs Customizável**
- **Server vs Serverless**

## Problem Solving Patterns

### Padrões Comuns
1. **Two Pointers** - Busca em arrays ordenados
2. **Sliding Window** - Subarrays
3. **Hash Map** - Busca O(1)
4. **Stack** - Aninhamento
5. **BFS/DFS** - Grafos
6. **Binary Search** - Busca rápida
7. **Dynamic Programming** - Otimização


---

*Enriquecido automaticamente pelo sistema de auto-documentação*