---
created: "2026-03-07T16:08:09.616211"
updated: "2026-03-18T13:38:42.166752"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🔧 Comandos e Referências

## Claude Code

### Comandos do Sistema
- `/session-start` - Iniciar sessão
- `/session-status` - Ver status
- `/session-complete` - Completar sessão
- `/session-resume` - Retomar sessão
- `/brain-search` - Buscar no cérebro
- `/brain-ask` - Perguntar ao cérebro
- `/brain-stats` - Estatísticas

### BMAD Commands
```
/bmad-create-product-brief  - Product brief
/bmad-create-prd           - Criar PRD
/bmad-validate-prd         - Validar PRD
/bmad-create-architecture  - Arquitetura
/bmad-create-ux-design     - UX Design
/bmad-create-epics-stories - Épicos e histórias
/bmad-sprint-planning      - Sprint planning
/bmad-dev-story            - Implementar história
/bmad-code-review          - Code review
/bmad-party-mode           - Multi-agent
/bmad-brainstorming        - Brainstorming
/bmad-help                 - Ajuda
```

## Git

### Básicos
```bash
git init                  # Iniciar repo
git clone <url>          # Clonar
git add .                # Adicionar tudo
git commit -m "msg"      # Commit
git push                 # Enviar
git pull                 # Baixar
```

### Branch
```bash
git checkout -b <branch> # Criar e mudar
git checkout <branch>   # Mudar
git branch -d <branch>  # Deletar
git merge <branch>      # Mesclar
git rebase <branch>     # Rebase
```

### History
```bash
git log --oneline       # Histórico curto
git diff                # Mudanças
git status              # Status
git stash               # Guardar mudanças
```

## Docker

### Comandos
```bash
docker build -t <name> .           # Build
docker run -p 8080:80 <name>       # Run
docker ps                          # Containers
docker exec -it <id> bash          # Acessar
docker logs -f <id>                # Logs
docker-compose up -d               # Compose
docker-compose down                # Parar
```

## NPM/Node

```bash
npm init -y                # Iniciar
npm install <package>      # Instalar
npm install -D <package>   # Dev dependency
npm run <script>           # Script
npm test                   # Testar
npm run dev                # Dev
npm run build              # Build
```

## Python

```bash
python -m venv venv         # Virtual env
source venv/bin/activate   # Ativar (Linux)
venv\Scripts\activate      # Ativar (Windows)
pip install -r requirements.txt
python -m pytest tests/    # Testar
```

## VS Code

### Atalhos Úteis
- `Ctrl+Shift+P` - Command Palette
- `Ctrl+P` - Quick Open
- `Ctrl+Shift+F` - Find in Files
- `Ctrl+` - Terminal
- `F5` - Debug
- `Ctrl+Shift+D` - Deploy

### Extensões Essenciais
- GitLens
- Prettier
- ESLint
- Docker
- Python
- TypeScript


---

*Enriquecido automaticamente pelo sistema de auto-documentação*