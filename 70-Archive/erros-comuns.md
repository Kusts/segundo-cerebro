---
created: "2026-03-07T16:09:57.854777"
updated: "2026-03-18T13:38:40.005020"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# ❌ Erros Comuns e Soluções

## Python

### `NameError: name 'X' is not defined`
**Causa**: Variável definida dentro de bloco (if, try, for) mas usada fora
**Solução**: Definir variável no escopo da função antes do bloco

```python
# Errado
def func():
    try:
        x = 1
    except:
        pass
    print(x)  # NameError!

# Correto
def func():
    x = None  # Definir antes
    try:
        x = 1
    except:
        pass
    print(x)  # OK
```

### `ModuleNotFoundError: No module named 'X'`
**Causa**: Módulo não instalado
**Solução**:
```bash
pip install modulo
# ou
pip install -r requirements.txt
```

### `IndentationError`
**Causa**: Mistura de tabs e espaços
**Solução**: Use apenas espaços (4) ou configure editor

### `TypeError: 'NoneType' object is not subscriptable`
**Causa**: Acessando algo que é None
**Solução**: Verificar se valor existe antes de acessar

### `json.JSONDecodeError`
**Causa**: String não é JSON válido
**Solução**: Use try/except ou validate JSON

## JavaScript/TypeScript

### `Cannot read property 'X' of undefined`
**Causa**: Acessando propriedade de undefined
**Solução**: Use optional chaining (`?.`)

### `Promise.pending`
**Causa**: Não await async function
**Solução**: Use `await` ou `.then()`

### `CORS Error`
**Causa**: Cross-Origin Request Blocked
**Solução**: Configure CORS no servidor

### `useEffect` loop infinito
**Causa**: Estado mudando em dependência
**Solução**: Use useMemo ou refatore dependências

## Git

### `.gitignore` não funcionando
**Causa**: Arquivo já está no repositório
**Solução**:
```bash
git rm --cached arquivo
git commit -m "Remove arquivo do tracking"
```

### Merge conflicts
**Solução**:
1. Abra o arquivo
2. Escolha qual versão manter
3. Marque como resolvido: `git add arquivo`
4. Commit: `git commit`

### Commit no branch errado
**Solução**:
```bash
git reset --soft HEAD~1
git checkout branch-correta
git commit
```

## Docker

### `Container already running`
**Solução**:
```bash
docker stop container_id
docker rm container_id
docker run ...
```

### `Port already allocated`
**Solução**: Mude a porta ou pare o container existente

### `Connection refused`
**Solução**: Verifique se o container está rodando e a porta está exposta

## API

### 401 Unauthorized
**Causa**: Token inválido ou ausente
**Solução**: Inclua token no header Authorization

### 403 Forbidden
**Causa**: Sem permissão
**Solução**: Verifique permissões do usuário/API key

### 404 Not Found
**Causa**: Endpoint incorreto
**Solução**: Verifique URL e parâmetros

### 500 Internal Server Error
**Causa**: Erro no servidor
**Solução**: Verifique logs do servidor

## Database

### `Connection refused`
**Causa**: Banco não está rodando ou porta errada
**Solução**: Verifique configuração e startup

### `Deadlock`
**Causa**: Transações competindo
**Solução**: Reordene operações ou use transações menores


---

*Enriquecido automaticamente pelo sistema de auto-documentação*