# Scripts CLI para Obsidian

Coleção de scripts para gerenciar o vault do Obsidian via linha de comando.

## Scripts Disponíveis

### 📊 vault-stats.sh
Mostra estatísticas do vault.

```bash
./vault-stats.sh
```

Output:
- Total de notas
- Notas por pasta
- Notas modificadas hoje
- Total de links
- Tags únicas

---

### 🔍 broken-links.sh
Encontra links quebrados no vault.

```bash
./broken-links.sh
```

Verifica todos os links `[[...]]` e reporta quais estão quebrados.

---

### 📝 quick-note.sh
Cria nota rápida com template.

```bash
./quick-note.sh "Título da Nota" "tipo" "Resumo"
```

Tipos: `knowledge`, `project`, `reference`, `session`

Exemplo:
```bash
./quick-note.sh "Nova feature" "project" "Implementar login"
```

---

### 🔎 vault-search.sh
Busca avançada no vault.

```bash
./vault-search.sh "pattern" [pasta]
```

Exemplo:
```bash
./vault-search.sh "agência" 30-Auto-Doc
```

---

### 🏷️ search-by-tag.sh
Busca notas por tag.

```bash
./search-by-tag.sh "#knowledge"
```

---

## Como Usar

1. Abra o terminal no vault:
```bash
cd "C:\Users\walis\OneDrive\Desktop\Segundo_Cerebro"
```

2. Execute o script:
```bash
./99-Templates/scripts/vault-stats.sh
```

## Permissões

Os scripts já têm permissão de execução. Se necessário:
```bash
chmod +x *.sh
```

## Templates

Pasta `../` contém templates prontos:
- `TEMPLATE-Knowledge.md`
- `TEMPLATE-Session.md`
- `TEMPLATE-MOC.md`

Use com Templater plugin para criar notas automaticamente.

---

> Criado por Hermes - 2026-04-01
