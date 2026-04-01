---
type: knowledge
id: sistema-de-sessões-session-man-ca765935
category: System
created: 2026-03-07
tags: [knowledge, System, auto-generated]
---

# 📚 Sistema de Sessões - Session Manager

# Sistema de Sessões - Session Manager

## Visão Geral

O **Session Manager** é um sistema de persistência automática que permite retomar trabalho interrompido sem perder contexto.

**Arquivo:** `.claude/execution/session_manager.py`
**Classe:** `SessionManager`

## Funcionalidades

### 1. Persistência Automática

Todas as sessões são salvas automaticamente em:
- `.claude/sessions/current.json` - Sessão atual
- `.claude/sessions/history/` - Histórico completo

### 2. Estrutura de Dados

```json
{
  "id": "20260307_143000",
  "task": "Descrição da tarefa principal",
  "context": {
    "branch": "feat/new-feature",
    "files": ["file1.ts", "file2.ts"]
  },
  "status": "in_progress",
  "started_at": "2026-03-07T14:30:00",
  "last_activity": "2026-03-07T15:45:00",
  "steps": [
    {
      "timestamp": "2026-03-07T14:35:00",
      "action": "Lendo arquivo",
      "details": "Lendo config.ts",
      "status": "completed"
    }
  ],
  "files_modified": [
    {
      "path": "src/app.ts",
      "operation": "modified",
      "timestamp": "2026-03-07T14:40:00"
    }
  ],
  "commands_run": [
    {
      "command": "npm test",
      "result": "Passing",
      "timestamp": "2026-03-07T14:45:00"
    }
  ],
  "notes": [
    {
      "content": "Lembrete: verificar compatibilidade",
      "timestamp": "2026-03-07T14:50:00"
    }
  ],
  "summary": "Resumo do realizado (ao completar)",
  "completed_at": "2026-03-07T16:00:00"
}
```

## Métodos Principais

### Inicialização

```python
SessionManager(
    workspace_root: Optional[str] = None,
    obsidian_vault: Optional[str] = None,
    auto_export_obsidian: bool = False
)
```

- `workspace_root`: Raiz do workspace (detecta automaticamente)
- `obsidian_vault`: Caminho para vault do Obsidian
- `auto_export_obsidian`: Exporta sessões completadas para o Obsidian

### Gestão de Sessão

#### `start_session(task, context)`

Inicia uma nova sessão.

```python
session_id = manager.start_session(
    task="Implementar autenticação OAuth",
    context={
        "branch": "feature/oauth",
        "ticket": "TICKET-123"
    }
)
# Retorna: "20260307_143000"
```

#### `add_step(action, details, status)`

Registra um passo executado.

```python
manager.add_step(
    action="Lendo arquivo",
    details="Lendo auth.ts para entender estrutura",
    status="completed"  # ou "failed", "in_progress"
)
```

#### `add_file(filepath, operation)`

Registra arquivo modificado.

```python
manager.add_file(
    filepath="src/auth/oauth.ts",
    operation="created"  # ou "modified", "deleted"
)
```

#### `add_command(command, result)`

Registra comando executado.

```python
manager.add_command(
    command="npm run test",
    result="All tests passing"
)
```

#### `add_note(note)`

Adiciona nota à sessão.

```python
manager.add_note(
    note="Lembrebrar de adicionar testes de integração"
)
```

#### `complete_session(summary)`

Marca sessão como completa.

```python
manager.complete_session(
    summary="OAuth implementado com testes passando"
)
```

#### `fail_session(error)`

Marca sessão como falha.

```python
manager.fail_session(
    error="Timeout na integração com API externa"
)
```

#### `resume_session(session_id)`

Retoma sessão anterior.

```python
# Retoma última sessão incompleta
session = manager.resume_session()

# Ou retoma sessão específica
session = manager.resume_session("20260307_143000")
```

### Consulta

#### `get_summary()`

Retorna resumo formatado da sessão atual.

```python
summary = manager.get_summary()
print(summary)
```

Saída:
```
📋 Sessão: 20260307_143000
🎯 Tarefa: Implementar autenticação OAuth
📊 Status: in_progress

🔄 Passos executados:
  1. ✅ Lendo arquivo: Lendo auth.ts para entender estrutura
  2. ✅ Criando componente: Componente OAuthButton criado

📁 Arquivos modificados:
  ➕ src/auth/oauth.ts
  ✏️ src/app.ts
```

#### `list_sessions(limit)`

Lista sessões recentes.

```python
sessions = manager.list_sessions(limit=10)
```

## Comandos CLI

```bash
# Iniciar sessão
python session_manager.py start "Tarefa principal"

# Adicionar passo
python session_manager.py step "Ação" "Detalhes" -s completed

# Registrar arquivo
python session_manager.py file path/to/file -o modified

# Adicionar nota
python session_manager.py note "Nota importante"

# Completar sessão
python session_manager.py complete -s "Resumo do realizado"

# Mostrar resumo
python session_manager.py summary

# Listar sessões
python session_manager.py list -n 10

# Retomar sessão
python session_manager.py resume -i 20260307_143000
```

## Comandos Claude Code

Sistema de comandos disponível via `/`:

### `/session-start`

Inicia uma nova sessão com persistência automática.

```markdown
/session-start Implementar feature X
```

### `/session-status`

Mostra o status atual da sessão.

### `/session-note`

Salva uma nota imp