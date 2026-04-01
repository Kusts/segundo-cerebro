---
created: "2026-03-07T16:06:34.270768"
updated: "2026-03-18T13:38:40.978673"
tags: [hermes, auto-doc, knowledge]
type: knowledge
---
# 🏗️ Arquitetura de Software

## Princípios Fundamentais

### SOLID
- **S**ingle Responsibility Principle - Uma classe, uma responsabilidade
- **O**pen/Closed Principle - Aberto para extensão, fechado para modificação
- **L**iskov Substitution Principle - Subclasses devem substituir a classe base
- **I**nterface Segregation Principle - Interfaces específicas são melhores que interfaces genéricas
- **D**ependency Inversion Principle - Dependa de abstrações, não de implementações

### Clean Code
- Nomes significativos
- Funções pequenas (máx 20-30 linhas)
- Comentários quando necessário
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)

## Padrões de Projeto

### Criacionais
| Padrão | Descrição | Quando Usar |
|--------|-----------|-------------|
| Singleton | Uma única instância | Conexões de banco, configs |
| Factory | Cria objetos | Quando a criação é complexa |
| Builder | Constrói objetos passo a passo | Objetos com muitos parâmetros |
| Prototype | Clona objetos | Cópias de objetos complexos |

### Estruturais
| Padrão | Descrição | Quando Usar |
|--------|-----------|-------------|
| Adapter | Converte interfaces | Integração com sistemas legados |
| Bridge | Separa abstração de implementação | Quando ambos podem variar |
| Composite | Árvore de objetos | UI, sistemas de arquivos |
| Decorator | Adiciona comportamento dinamicamente | Stack de funcionalidades |
| Facade | Interface simplificada | APIs complexas |

### Comportamentais
| Padrão | Descrição | Quando Usar |
|--------|-----------|-------------|
| Observer | Pub/Sub | Notificações, eventos |
| Strategy | Troca algoritmo em runtime | Múltiplas formas de fazer algo |
| Command | Encapsula ação | Undo/redo, filas |
| State | Máquina de estados | Fluxos de trabalho |
| Chain of Responsibility | Cadeia de handlers | Middlewares, filtros |

## Arquiteturas

### Monolith
**Prós**: Simples, debug fácil, deploy único
**Contras**: Escalabilidade limitada, tight coupling

### Microservices
**Prós**: Escalável, independente, tecnologia diversa
**Contras**: Complexidade, distribuição, rede

### Event-Driven
**Prós**: Baixo acoplamento, escalável, assíncrono
**Contras**: Complexidade, eventual consistency

### Layered ( onions)
**Prós**: Separação clara, testável
**Contras**: Pode ser verboso

### Hexagonal (Ports & Adapters)
**Prós**: Altamente testável, flexível
**Contras**: Curva de aprendizado

## Decisões Técnicas Comuns

### Quando usar Microservices
- Equipes grandes (20+ devs)
- Escalabilidade independente necessária
- Múltiplas tecnologias
- Serviços reutilizáveis

### Quando usar Monolith
- Equipes pequenas
- MVP/Protótipos
- Baixa complexidade
- Deploy simples

### Quando usar Event-Driven
- Processos assíncronos
- Múltiplos consumidores
- Audit trail necessário
- Tempo real

## Referências
- [[agentes-python-asset-factory]]
- [[frameworks-e-diretivas-claude-code]]
- [[workflows-bmad-metodologia-completa]]


---

*Enriquecido automaticamente pelo sistema de auto-documentação*