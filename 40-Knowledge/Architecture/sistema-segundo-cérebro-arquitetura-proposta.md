---
type: knowledge
category: architecture
created: 2026-03-17
tags:
  - architecture
  - pkm
  - segundo-cerebro
  - claude-code
  - knowledge
  - architecture
---

# 📚 Sistema Segundo Cérebro - Arquitetura Proposta


## Conteúdo

# Arquitetura Completa de Segundo Cérebro para Claude Code

## 1. Análise da Situação Atual

### Componentes Existentes
| Componente | Status | Funcionalidade |
|------------|--------|----------------|
| claude-mem | ✅ Ativo | Memória curto prazo, observações |
| session_manager.py | ⚠️ Parcial | Sessões locais, exportação manual |
| obsidian_brain.py | ✅ Funcional | CRUD Obsidian |
| brain_consultant.py | ⚠️ Bug | Consulta (erro stderr) |
| auto_brain_documenter.py | ✅ Corrigido | Documentação automática |
| Hooks SessionStart/Stop | ✅ Ativos | claude-mem integrado |

### Problemas Identificados
1. **Documentação manual** - Precisa pedir para documentar
2. **Consulta não automática** - pre_response_hook não integrado
3. **Erro stderr** - brain_consultant quebra no Windows
4. **Sessões não documentadas** - Trabalho perdido se não usar /session-complete
5. **Compactação de contexto** - Pode perder histórico importante

## 2. Solução Proposta: PKM Autônomo

### Princípios
- **Zero perda** - Tudo é documentado automaticamente
- **Consulta ativa** - Contexto carregado antes de responder
- **Categorização inteligente** - Erros, soluções, aprendizados separados
- **Busca semântica** - Encontra por contexto, não apenas palavras

### Arquitetura



## 3. Componentes a Implementar

### 3.1. Hook PreResponse Avançado


### 3.2. Hook PostToolUse com Categorização


### 3.3. Sistema de Zero Perda


## 4. Categorias de Documentação

| Categoria | Quando Criar | Onde Salvar |
|-----------|--------------|-------------|
| **Erro/BUG** | Exception, traceback |  |
| **Solução** | Problema resolvido |  |
| **Aprendizado** | Nova descoberta |  |
| **Decisão** | Escolha arquitetural |  |
| **Sessão** | /session-complete |  |
| **Projeto** | /project-create |  |

## 5. Integração com Compactação

A compactação do Claude Code NÃO deve afetar porque:
1. Documentação é externa (Obsidian)
2. Persistência local em 
3. claude-mem mantém observações independentes

## 6. Próximos Passos

1. ✅ Corrigir bugs (stderr)
2. ⏳ Criar hooks automáticos
3. ⏳ Implementar categorização
4. ⏳ Sistema de consulta ativa
5. ⏳ Interface de busca

## 7. Comandos Disponíveis

| Comando | Ação |
|---------|------|
|  | Busca conhecimento |
|  | Pergunta ao brain |
|  | Estatísticas |
|  | Captura rápida |
|  | Inicia sessão |
|  | Finaliza e documenta |


## 🔗 Relacionado

-
