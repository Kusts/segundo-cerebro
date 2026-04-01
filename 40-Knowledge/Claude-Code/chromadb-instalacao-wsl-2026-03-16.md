---
tags:
  - chromadb
  - wsl
  - ubuntu
  - instalação
  - 2026-03-16
  - hermes
created: 2026-03-16T21:15:00
---

# Instalação do ChromaDB no WSL2 Ubuntu - 2026-03-16

## 📋 Resumo

Instalação do ChromaDB no WSL2 Ubuntu para uso com Hermes.

---

## ✅ Status

**Status:** ✅ **CONCLUÍDO**

**Data:** 2026-03-16 21:15

**Versão instalada:** ChromaDB 1.5.5

---

## 🔧 Processo de Instalação

### 1. Verificar Python

```bash
python3 --version
# Python 3.12.3
```

### 2. Instalar pip e dependências

```bash
echo '1234' | sudo -S apt-get update
echo '1234' | sudo -S apt-get install -y python3-pip python3-dev build-essential libssl-dev libffi-dev
```

### 3. Instalar ChromaDB

```bash
echo '1234' | sudo -S pip3 install chromadb --break-system-packages --ignore-installed
```

---

## 📦 Pacotes Instalados

| Pacote | Versão |
|--------|--------|
| chromadb | 1.5.5 |
| numpy | 2.4.3 |
| pydantic | 2.12.5 |
| onnxruntime | 1.24.3 |
| opentelemetry-api | 1.40.0 |
| grpcio | 1.78.0 |
| uvicorn | 0.42.0 |
| typer | 0.24.1 |
| rich | 14.3.3 |
| tokenizers | 0.22.2 |

---

## 🧪 Verificação

```bash
python3 -c 'import chromadb; print(f"ChromaDB version: {chromadb.__version__}")'
# ChromaDB version: 1.5.5
```

---

## 🔗 Uso com Hermes

O ChromaDB agora está disponível no WSL2 Ubuntu para uso com Hermes.

### Exemplo de uso:

```python
import chromadb

# Criar cliente persistente
client = chromadb.PersistentClient(path="/path/to/db")

# Criar coleção
collection = client.create_collection(name="my_collection")

# Adicionar documentos
collection.add(
    documents=["documento 1", "documento 2"],
    ids=["id1", "id2"]
)

# Buscar
results = collection.query(query_texts=["query"])
```

---

## 📝 Notas

- Instalação feita com `--break-system-packages` e `--ignore-installed` para evitar conflitos com pacotes do sistema
- Recomendado usar ambiente virtual para projetos futuros
- ChromaDB 1.5.5 é a versão mais recente estável

---

## 🔗 Links

- [Documentação oficial](https://docs.trychroma.com/)
- [GitHub](https://github.com/chroma-core/chroma)
- [PyPI](https://pypi.org/project/chromadb/)

---

*Nota criada durante sessão de instalação do ChromaDB*
