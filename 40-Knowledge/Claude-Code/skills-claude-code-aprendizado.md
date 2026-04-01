---
created: "2026-03-07T21:19:35.274000"
updated: "2026-03-18T13:38:45.149070"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Skills no Claude Code - Aprendizado

**Data:** 2026-03-07
**Tipo:** Conhecimento / Video
**Canal:** Made In LowCode
**Tags:** [[learning]] [[claude-code]] [[skills]] [[youtube]]

## Fonte

- **Vídeo:** "Skills no Claude Code"
- **Canal:** Made In LowCode (UC4Bixq7mJgRRkB2bKRLVr-w)
- **ID:** O1wgFqfu4lY
- **Idioma:** Português (legendas automáticas)

---

## O que são Skills?

**Skill = pasta com instruções** que transforma o Claude Code em especialista em uma tarefa específica.

### Estrutura
```
pasta_skill/
├── SKILL.md          # Documentação
├── instructions.md    # Instruções
└── scripts/         # Scripts opcionais
```

### Exemplos de Uso
- Criar conteúdo para YouTube/LinkedIn/Instagram
- Enviar mensagens via WhatsApp
- Análise de segurança
- Automação de tarefas

---

## Criando uma Skill

1. Criar pasta dentro de `skills/`
2. Adicionar `SKILL.md` com instruções
3. O Claude Code age como especialista naquela área

---

## Exemplo do Vídeo

O criador desenvolveu uma **skill de segurança** que:
- Faz varredura no código
- Detecta vulnerabilidades (SQL injection, rate limit, etc)
- Identifica brechas de segurança
- Recomenda correções

### Vulnerabilidades Encontradas
- Crítica: comparações de string em webhooks
- Média: sem rate limit (consumo excessivo de API)
- Baixa: logs verbosos no console

---

## Aviso de Segurança

⚠️ **Cuidado ao baixar skills de repositórios!**
- Podem conter código malicioso
- Sempre analise antes de usar
- O Claude Code pode executar scripts perigosos

---

## Onde Encontrar

- Repositório no GitHub com skills validadas
- Curso "Made In LowCode" ensina a criar skills profissionais

---

## Keywords

[[claude-code]] [[skills]] [[automation]] [[security]] [[made-in-lowcode]]



---

*Enriquecido automaticamente pelo sistema de auto-documentação*