---
created: "2026-03-12T16:31:25.970000"
updated: "2026-03-18T13:38:45.032060"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# Claude Code - Guia Completo (Fontes do NotebookLM)

> Fonte: NotebookLM - 27 fontes consolidadas
> Data: 2026-03-12

---

## Resumo Executivo

O Claude Code é um "harnês agêntico" que transforma modelos de linguagem em desenvolvedores autônomos capazes de manipular sistemas de arquivos e terminais reais. Sua eficácia depende da higiene do contexto, sendo vital resetar a memória entre tarefas não relacionadas para manter a precisão.

---

## 1. Comandos de Barra (Slash Commands)

Dentro de uma sessão ativa do Claude, você utiliza a barra `/` para acessar funções de controle:

### Comandos Essenciais:

| Comando | Função |
|---------|--------|
| `/help` | Abre a lista completa de comandos e atalhos disponíveis |
| `/clear` | Limpa o histórico da conversa atual. Vital para economizar tokens |
| `/init` | Analisa o projeto e cria o arquivo CLAUDE.md |
| `/context` | Exibe quantos tokens estão sendo usados e o que ocupa memória |
| `/compact` | Resume a conversa atual para liberar espaço |
| `/model` | Troca entre modelos (Sonnet, Opus) durante a sessão |

---

## 2. Comandos de Inicialização (CLI)

Você também pode dar ordens ao Claude antes de entrar no modo de chat:

```bash
# Inicia o Claude executando uma ordem específica
claude "corrija o erro de compilação"

# Consulta rápida sem manter sessão aberta
claude -p "pergunta"

# Cria um commit automático no Git
claude commit
```

---

## 3. Modos de Permissão (Shift + Tab)

O controle de autonomia que você alterna pressionando **Shift + Tab**:

### Modos:

| Modo | Descrição |
|------|-----------|
| **Plan Mode** | O Claude apenas analisa e propõe plano, sem alterar arquivos |
| **Ask Mode (Padrão)** | O agente pede autorização para cada arquivo/comando |
| **Full Mode** | Execução automática total ("piloto automático") |

### Quando usar cada um:
- **Plan Mode**: Quando está começando um projeto ou lidando com bug complexo
- **Ask Mode**: Ambientes de produção onde precisa validar cada alteração
- **Full Mode (Vibe Coding)**: Para prototipar ideias rapidamente

### Boas Práticas - "Human in the Loop":
1. Explore primeiro, code depois
2. Use Plan Mode para validar o raciocínio
3. Interrompa com **Esc** se necessário

---

## 4. Gerenciamento de Contexto

A janela de contexto tem um limite de tokens. Quando enche:

### Problemas:
- Degradação de Performance - a IA pode "esquecer" instruções
- Custo mais alto - consome mais créditos

### Comandos de Manutenção:

```bash
/context    # Mostra quanto da memória está ocupada
/clear      # Limpa o histórico completamente
/compact    # Resume a conversa preservando o essencial
```

### Estratégias de Higiene:
1. **Resetar entre tarefas**: Use `/clear` ao mudar de tarefa
2. **Subagentes**: Para tarefas que exigem ler muitos arquivos
3. **CLAUDE.md**: Para regras cruciais que persistem entre sessões

---

## 5. O Arquivo CLAUDE.md (Memória Persistente)

O CLAUDE.md é um arquivo markdown especial que o Claude lê no início de cada sessão.

### Como criar:
```bash
/claude /init
```

### O que incluir:
✅ Comandos de build/teste
✅ Regras de estilo específicas (ex: "use sempre Tailwind")
✅ Nomenclaturas de branches
✅ Decisões arquitetônicas

### O que NÃO incluir:
❌ Explicações longas
❌ Tutoriais
❌ O que o Claude consegue inferir sozinho

### Exemplo de Estrutura:
```markdown
# Estilo de Código
- Use módulos ES (import/export), não CommonJS
- Prefira componentes funcionais em React

# Workflow
- Sempre rode `npm run lint` após alterações
- Para testes, prefira rodar testes individuais
```

### Dica Avançada:
- Use `@caminho/do/arquivo` para importar outros arquivos
- Tenha um CLAUDE.md global em `~/.claude/CLAUDE.md`

---

## 6. Referenciação com @ e #

### O símbolo @ (Arquivos)
Para ser mais preciso e econômico:

```bash
@index.html        # Foca atenção no arquivo específico
@auth.ts           # Referencia arquivo específico
```

**Vantagens:**
- Velocidade - retorna mais rápido
- Economia de Tokens
- Precisão - evita confusão com arquivos de mesmo nome

### O símbolo # (Contexto)
Para "fixar" algo na memória de trabalho:

```bash
[[regra-importante]]   # Faz a IA lembrar de algo específico
```

---

## 7. Instalação no Windows

### Pré-requisitos:
1. **Git** - Baixar do site oficial
2. **Node.js** - Versão LTS recomendada

### Métodos de Instalação:

```powershell
# PowerShell (Recomendado)
irm https://claude.ai/install.ps1 | iex

# Windows CMD
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd

# WinGet
winget install Anthropic.ClaudeCode

# npm
npm install -g @anthropic/claude-code
```

### Verificar Instalação:
```bash
claude -v
```

### Primeira Execução:
1. Navegue até o diretório do projeto
2. Digite `claude`
3. Escolha tema visual
4. Faça login (conta Claude.ai ou API)

---

## 8. MCP (Model Context Protocol)

O Protocolo de Contexto de Modelo permite conectar