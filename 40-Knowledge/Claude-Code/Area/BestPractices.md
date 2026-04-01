---
type: reference
id: claude-code-best-practices
title: Melhores Praticas do Claude Code
category: guides
created: 2026-03-11
updated: 2026-03-11
tags: [claude-code, best-practices, guides]
---

# Melhores Praticas

Este documento contem as melhores praticas para uso do Claude Code.

## Principios Fundamentais

### 1. Times de Agentes (SEMPRE)
Para toda tarefa complexa, use o Task tool com agentes especializados.

### 2. Pensamento Passo a Passo
Para qualquer tarefa nao-trivial:
1. Analisar o problema
2. Dividir em etapas menores
3. Executar uma etapa por vez
4. Validar antes de continuar
5. Relatar progresso

### 3. Comunicacao Resumida
- Inicio: "Iniciando [tarefa]..."
- Progresso: "Etapa X/Y: [descricao breve]"
- Conclusao: "[Resultado em 1-2 linhas]"

### 4. Memoria Persistente
Sempre salvar solucoes em `memory/solutions.md`:
- Problema encontrado
- Solucao aplicada
- Tags para futura consulta

## Checklist de Qualidade

- [ ] Codigo compila/executa sem erros
- [ ] Testes existentes passam
- [ ] Novos testes para nova funcionalidade
- [ ] Segue padroes do projeto
- [ ] Sem vulnerabilidades de seguranca
- [ ] Performance aceitavel

## Veja Tambem

- [[./Commands|Comandos e Shortcuts]]
- [[./Skills|Skills Instaladas]]

---
*Ultima atualizacao: 2026-03-11*