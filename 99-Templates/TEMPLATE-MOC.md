---
tags: [moc, {{domain}}]
created: {{date}}
modified: {{date}}
type: moc
description: Mapa de Conhecimento {{domain}}
---

# {{domain}} MOC

> **Domínio:** {{domain}}
> **Criado:** {{date}}
> **Status:** 🟢 Ativo

---

## 🎯 Visão Geral

{{overview}}

---

## 📚 Conteúdo Principal

### Notas em Destaque

```dataview
TABLE WITHOUT ID
file.link AS "Nota",
file.mtime AS "Atualizado"
FROM "{{folder}}"
WHERE file.extension = "md"
SORT file.mtime DESC
LIMIT 10
```

---

## 🗂️ Estrutura

```
{{domain}}/
├── {{subfolder-1}}/
├── {{subfolder-2}}/
└── {{subfolder-3}}/
```

---

## 📋 Notas Relacionadas

| Nota | Descrição | Status |
|------|-----------|--------|
| [[{{note-1}}]] | {{desc-1}} | 🟢 |
| [[{{note-2}}]] | {{desc-2}} | 🟡 |

---

## 🛠️ Recursos

| Tool | Uso | Docs |
|------|-----|------|
| {{tool-1}} | {{use-1}} | [[{{docs-1}}]] |

---

## 📊 Métricas

```dataview
TABLE WITHOUT ID
length(rows) AS "Notas"
FROM "{{folder}}"
WHERE file.extension = "md"
```

---

## ✅ Progresso

- [x] MOC criado
- [ ] Conteúdo adicionado
- [ ] Revisado

---

## 🔗 Links

- [[00-MOC]] - Mapa raiz
- [[{{related-moc}}]]

---

> Mantido por Hermes
