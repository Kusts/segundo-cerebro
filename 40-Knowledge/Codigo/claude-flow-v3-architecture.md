# Claude Flow V3 - Arquitectura Tcnica Detalhada

> **Monorepo TypeScript** | Verso 3.0.0-alpha.1 | Modular AI Agent Coordination System
> Root: `/mnt/c/Users/walis/OneDrive/Desktop/claude_code/src/v3/`

---

## ndice

1. [Vista Geral da Arquitectura](#1-vista-geral-da-arquitectura)
2. [Os 10 ADRs (Architecture Decision Records)](#2-adrs)
3. [Relao entre Packages](#3-relao-entre-packages)
4. [Pores de Design](#4-pores-de-design)
5. [Performance Targets](#5-performance-targets)
6. [Sistema de Plugins e Discovery](#6-sistema-de-plugins-e-discovery)
7. [Memory System: AgentDB + HNSW](#7-memory-system-agentdb--hnsw)
8. [Swarm - 15-Agent Hierarchical Mesh](#8-swarm---15-agent-hierarchical-mesh)
9. [Hooks System](#9-hooks-system)
10. [Guidance Control Plane](#10-guidance-control-plane)
11. [MCP Server](#11-mcp-server)
12. [Segurana](#12-segurana)
13. [Configurao e Tipos Partilhados](#13-configurao-e-tipos-partilhados)
14. [Directorio Completo](#14-directorio-completo)

---

## 1. Vista Geral da Arquitectura

O Claude Flow V3 um **monorepo TypeScript** (pnpm workspaces) que implementa um sistema modular de coordenao de agentes AI. baseado em 10 ADRs (Architecture Decision Records) que guia todas as decises arquitecturais.

A arquitectura segue **Domain-Driven Design (DDD)** com **bounded contexts** separados, comunicando atravs de eventos e interfaces bem definidas.

```
@claude-flow/v3-monorepo (pnpm workspace root)
│
├── @claude-flow/                    # 18 packages modulars
│   ├── shared/         (v3.0.0-alpha.7)   # Base: types, events, interfaces, config
│   ├── security/       (v3.0.0-alpha.6)   # CVE fixes, bcrypt, Zod validation
│   ├── memory/         (v3.0.0-alpha.12)   # AgentDB + HNSW + HybridBackend
│   ├── swarm/          (v3.0.0-alpha.6)    # 15-agent coordination, consensus
│   ├── hooks/          (v3.0.0-alpha.7)   # 17 hooks + 12 background workers
│   ├── guidance/       (v3.0.0-alpha.1)   # Governance control plane
│   ├── plugins/        (v3.0.0-alpha.7)   # Unified Plugin SDK
│   ├── cli/                        # CLI commands
│   ├── integration/                 # agentic-flow bridge
│   ├── performance/                 # Flash Attention benchmarks
│   ├── neural/                      # SONA learning
│   ├── deployment/                  # CI/CD
│   ├── testing/                     # TDD London School
│   ├── providers/                   # LLM providers
│   ├── embeddings/                  # Embedding generation
│   ├── codex/                       # Codex integration
│   ├── aidefence/                    # AI defense
│   ├── browser/                     # Browser automation
│   ├── claims/                      # Claims management
│   └── sisr/                       # SISR module
│
├── mcp/                             # MCP Server implementation
│   ├── server.ts                    # Main server (792 linhas)
│   ├── tool-registry.ts             # Tool registration
│   ├── session-manager.ts          # Session handling
│   ├── connection-pool.ts          # Connection pooling
│   └── tools/                      # MCP tool definitions
│       ├── agent-tools.ts
│       ├── swarm-tools.ts
│       ├── memory-tools.ts
│       ├── hooks-tools.ts
│       ├── session-tools.ts
│       └── config-tools.ts
│
├── src/                             # V3 core source
│   ├── core/                       # Orchestrator, interfaces
│   ├── shared/                     # Legacy shared types
│   ├── events/                     # Event system
│   ├── coordination/               # Agent registry, task orchestrator
│   └── swarm.config.ts             # 15-agent configuration
│
├── __tests__/integration/          # Integration tests
├── docs/                           # Documentation
├── helpers/                        # Cross-platform helpers
└── scripts/                        # Utility scripts
```

---

## 2. ADRs (Architecture Decision Records)

| ADR | Deciso | Impacto |
|-----|--------|---------|
| **ADR-001** | Adoptar `agentic-flow` como foundation核心 | Integrao profunda com agentic-flow@alpha |
| **ADR-002** | Domain-Driven Design structure | 18 packages com bounded contexts separados |
| **ADR-003** | Single coordination engine (`UnifiedSwarmCoordinator`) | Unifica 4 sistemas de coordenao anteriores |
| **ADR-004** | Plugin-based architecture (microkernel) | Sistema de plugins com lifecycle management |
| **ADR-005** | MCP-first API design | Todos os mdulos expem interface MCP |
| **ADR-006** | Unified memory service (AgentDB) | Memory centralizado com HNSW |
| **ADR-007** | Event sourcing for state changes | EventStore com SQLite para audit trail |
| **ADR-008** | Vitest over Jest | 10x faster testing |
| **ADR-009** | Hybrid memory backend (SQLite + AgentDB) | Combina queries estruturadas com semantic search |
| **ADR-010** | Remove Deno support (Node.js 20+ only) | Foco em Node.js nativo |

---

## 3. Relao entre Packages

### 3.1 Hierarquia de Dependncias

```
shared (base - sem dependncias para packages)
  ├── security
  ├── memory
  ├── hooks
  ├── swarm
  ├── plugins
  ├── guidance
  ├── performance
  ├── cli
  ├── integration
  ├── neural
  └── deployment
```

### 3.2 Fluxo de Dados Tpico

```
User Input (CLI/MCP)
       │
       ▼
┌─────────────────┐
│  MCP Server     │  ◄── stdio / HTTP / WebSocket transports
│  (mcp/server.ts)│
└────────┬────────┘
         │ tool calls
         ▼
┌─────────────────┐
│  Swarm Coord.  │  ◄── 15-agent hierarchical mesh
│  (swarm/)      │     Queen-led + consensus protocols
└────────┬────────┘
         │ events
         ▼
┌─────────────────┐     ┌─────────────────┐
│  Hooks System  │     │  Memory System  │
│  (hooks/)      │     │  (memory/)     │
│  17 hooks +    │     │  HybridBackend  │
│  12 daemons    │     │  AgentDB + HNSW │
└────────┬────────┘     └────────┬────────┘
         │                       │
         ▼                       ▼
┌─────────────────┐     ┌─────────────────┐
│  Guidance       │     │  SQLite +       │
│  (guidance/)    │     │  Vector Store   │
│  Compile/Enforce │     │                 │
└────────┬────────┘     └─────────────────┘
         │
         ▼
┌─────────────────┐
│  Security       │
│  (security/)    │
│  CVE fixes +    │
│  Zod validation │
└─────────────────┘
```

### 3.3 Key Packages em Detalhe

#### @claude-flow/shared (v3.0.0-alpha.7)
O package base que todos os outros importam. Fornece:

- **Tipos partilhados**: AgentId, TaskId, SwarmConfig, EventType, etc.
- **Event Bus**: Pub/sub com IDs criptograficamente seguros
- **Event Store**: Persistncia SQLite com event sourcing (ADR-007)
- **Interfaces DDD**: IAgent, ITask, IMemory, ICoordinator
- **Configurao**: Schema validation com Zod, config loader
- **Orchestrator**: TaskManager, SessionManager, HealthMonitor, LifecycleManager

**Ficheiros principais**:
- `src/core/event-bus.ts` - EventBus com emit/emitAsync/subscribe
- `src/events/event-store.ts` - EventStore com SQLite (append-only log)
- `src/core/interfaces/*.ts` - Interfaces DDD para todos os domnios
- `src/core/orchestrator/*.ts` - Componentes do orquestrador

#### @claude-flow/memory (v3.0.0-alpha.12)
Sistema de memria unificado com foco em performance:

- **HybridBackend**: SQLite + AgentDB (ADR-009)
- **HNSW Index**: 150x-12,500x faster vector search
- **Cache Manager**: Camada de caching
- **DDD structure**: Domain entities, repositories, application services

**Ficheiros principais**:
- `src/hybrid-backend.ts` - Combina SQLite + AgentDB
- `src/agentdb-backend.ts` - Integrao AgentDB
- `src/hnsw-index.ts` - HNSW implementation prpria
- `src/sqlite-backend.ts` - Backend SQLite
- `src/cache-manager.ts` - Cache layer

#### @claude-flow/swarm (v3.0.0-alpha.6)
Coordenao de agentes com mltiplas topologias:

- **UnifiedSwarmCoordinator**: Motor nico de coordenao
- **Attention Coordinator**: Flash Attention + MoE routing
- **Consensus Protocols**: Raft, Byzantine, Gossip
- **Agent Pool**: Gesto de pool de agentes
- **Topology Manager**: Hierarchical-mesh, mesh, hierarchical, centralized

**Ficheiros principais**:
- `src/attention-coordinator.ts` - Flash Attention (1000 linhas)
- `src/consensus/raft.ts`, `byzantine.ts`, `gossip.ts`
- `src/coordination/agent-registry.ts`
- `src/coordination/task-orchestrator.ts`
- `src/domain/entities/agent.ts`, `task.ts`

#### @claude-flow/hooks (v3.0.0-alpha.7)
Sistema de hooks event-driven:

- **HookRegistry**: Registry central de hooks com prioridade
- **HookExecutor**: Execuo de hooks por evento
- **ReasoningBank**: Integrao com SONA learning
- **12 Background Workers**: Daemons para tarefas assncronas
- **17 Hook Types**: PreTask, PostTask, PreAgent, PostAgent, etc.

**Ficheiros principais**:
- `src/registry/index.ts` - HookRegistry
- `src/executor/index.ts` - HookExecutor
- `src/daemons/index.ts` - Background workers
- `src/reasoningbank/` - SONA integration

#### @claude-flow/guidance (v3.0.0-alpha.1)
Governance control plane para sesses Claude Code:

- **Compiler**: Parsing de CLAUDE.md em policy bundles
- **Retriever**: Recuperao de rules por contexto
- **Gates**: Policy enforcement points
- **Ledger**: Auditoria de conformidade
- **Optimizer**: Evoluo autidtima de rules
- **Memory Gate**: Ligao ao sistema de memria
- **WASM Kernel**: kernel WASM para performance

**Sub-mdulos** (27 exports nomeados):
- `compiler`, `retriever`, `gates`, `hooks`, `ledger`, `optimizer`
- `headless`, `persistence`, `gateway`, `manifest-validator`, `proof`
- `memory-gate`, `coherence`, `artifacts`, `capabilities`, `evolution`
- `conformance-kit`, `ruvbot-integration`, `trust`, `truth-anchors`
- `uncertainty`, `temporal`, `authority`, `adversarial`, `meta-governance`
- `continue-gate`, `wasm-kernel`, `generators`, `analyzer`

#### @claude-flow/plugins (v3.0.0-alpha.7)
SDK unificado para desenvolvimento de plugins:

- **PluginBuilder**: Fluent API para criao de plugins
- **PluginRegistry**: Lifecycle management e dependency resolution
- **Worker System**: Background task workers
- **Hook Integration**: Ligao ao sistema de hooks
- **Provider System**: LLM provider abstraction
- **Collection Manager**: Organizao de plugins

**Ficheiros principais**:
- `src/sdk/index.ts` - PluginBuilder (598 linhas)
- `src/registry/plugin-registry.ts` - PluginRegistry (604 linhas)
- `src/core/base-plugin.ts`, `plugin-interface.ts`
- `src/integrations/ruvector/` - Attention mechanisms

---

## 4. Pores de Design

### 4.1 Event Sourcing (ADR-007)

Implementado em `shared/src/events/event-store.ts` com SQLite:

```typescript
// Append-only event log
await eventStore.append(domainEvent);

// Query events por aggregate
const events = await eventStore.getEvents(aggregateId);

// Event replay para reconstruio de estado
for await (const event of eventStore.replay(fromVersion)) {
  // Reaplica evento
}

// Snapshots para performance
await eventStore.saveSnapshot({ aggregateId, version, state });
```

**Caractersticas**:
- Aggregates: `agent`, `task`, `memory`, `swarm`
- Versioning por aggregate
- Filtered queries (por tipo, timestamp, aggregate ID)
- Auto-persist interval (default: 5s)
- Snapshot threshold (default: 100 events)

### 4.2 Hooks System

O sistema de hooks segue um padro pub/sub com prioridade:

```typescript
// Registry
const registry = new HookRegistry();

// Register com prioridade (1 = highest)
registry.register(
  HookEvent.PreTask,
  async (ctx) => { /* logic */ },
  1, // priority
  { name: 'my-hook', enabled: true }
);

// Get hooks para evento (sorted by priority)
const hooks = registry.getForEvent(HookEvent.PreTask);

// Executor runs todos por ordem de prioridade
for (const hook of hooks) {
  await hook.handler(context);
}
```

**Tipos de Hook** (17 + 12 daemons):
- `PreTask`, `PostTask`, `PreAgent`, `PostAgent`
- `PreSwarm`, `PostSwarm`, `MemoryQuery`, `MemoryStore`
- `ToolExecution`, `Error`, `Shutdown`
- 12 Daemons: MCP tools, session, statusline, etc.

### 4.3 Swarm - Multi-Agent Coordination

#### Topologias Suportadas:

1. **hierarchical-mesh** (default): Queen-led hierarchy + mesh within layers
2. **mesh**: Full mesh (todos comunicam com todos)
3. **hierarchical**: Strict hierarchy, no cross-domain
4. **centralized**: Tudo passa pela Queen (agent-1)

#### 15 Agent Roles:

| Agent | Role | Domain | Layer |
|-------|------|--------|-------|
| agent-1 | Queen Coordinator | core | 0 (central) |
| agent-2 | Security Architect | security | 1 |
| agent-3 | Security Implementer | security | 1 |
| agent-4 | Security Tester | security | 1 |
| agent-5 | Core Architect | core | 1 |
| agent-6 | Core Implementer | core | 1 |
| agent-7 | Memory Specialist | core | 1 |
| agent-8 | Swarm Specialist | core | 1 |
| agent-9 | MCP Specialist | core | 1 |
| agent-10 | Integration Architect | integration | 1 |
| agent-11 | CLI/Hooks Developer | integration | 1 |
| agent-12 | Neural/Learning Dev | integration | 1 |
| agent-13 | TDD Test Engineer | quality | 2 |
| agent-14 | Performance Engineer | performance | 2 |
| agent-15 | Release Engineer | deployment | 2 |

#### Attention Coordinator:

Suporta 6 mecanismos de ateno (atenco coordinator):

```typescript
type AttentionType =
  | 'multi-head'    // Standard
  | 'flash'         // 2.49x-7.47x speedup, 75% memory reduction
  | 'linear'        // Long sequences
  | 'hyperbolic'    // Hierarchical data
  | 'moe'           // Mixture of Experts
  | 'graph-rope';   // Graph-aware positional embeddings
```

#### Consensus Protocols:

- **Raft**: Leader election + log replication
- **Byzantine**: Tolerncia a falhas bizantinas
- **Gossip**: Eventual consistency com epidemic spread

### 4.4 Plugin Architecture (Microkernel)

```
┌─────────────────────────────────────────────┐
│              Microkernel Core               │
│  (PluginRegistry + EventBus + Lifecycle)   │
├─────────────────────────────────────────────┤
│                                             │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐   │
│  │ Plugin  │  │ Plugin  │  │ Plugin  │   │
│  │    A    │  │    B    │  │    C    │   │
│  │         │  │         │  │         │   │
│  │ Workers │  │  Hooks  │  │  Tools  │   │
│  │  +Tools │  │ +Agents │  │ +Provider│   │
│  └─────────┘  └─────────┘  └─────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │       Extension Points (Hooks)       │   │
│  │  PreTask | PostTask | MemoryQuery   │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

**Plugin Discovery**:
```typescript
// Automatic discovery via @claude-flow/plugins
const registry = new PluginRegistry({
  coreVersion: '3.0.0',
  dataDir: './plugins',
  maxPlugins: 50,
  loadTimeout: 30000,
});

// Load from directory
await registry.loadPlugin('/path/to/plugin');

// Or use PluginBuilder
const plugin = new PluginBuilder('my-plugin', '1.0.0')
  .withDescription('My awesome plugin')
  .withMCPTools([...])
  .withHooks([...])
  .onInitialize(async (ctx) => { /* init */ })
  .build();

await registry.register(plugin);
```

---

## 5. Performance Targets

| Categoria | Mtrica | Target | Status |
|-----------|--------|--------|--------|
| **Search** | AgentDB HNSW | 150x-12,500x faster | Implementado |
| **Attention** | Flash Attention | 2.49x-7.47x speedup | Implementado |
| **Memory** | Reduction | 50-75% (Int8 quantization) | Implementado |
| **Code** | Total lines | <5,000 | Em progresso |
| **Startup** | Cold start | <500ms | Alcançado |
| **Learning** | SONA adaptation | <0.05ms | Implementado |
| **Event Bus** | 100k events | <50ms | ~6ms |
| **Map Lookup** | 100k gets | <20ms | ~16ms |
| **MCP Response** | Overhead | <100ms | Alcançado |
| **CLI Startup** | Cold start | <500ms | Alcançado |

### Tcnicas de Otimizao:

1. **HNSW Index** (`hnsw-index.ts`):
   - BinaryMinHeap/BinaryMaxHeap para O(log n) priority queue
   - Pre-normalized vectors para O(1) cosine similarity
   - Bounded max-heap para efficient top-k tracking

2. **Flash Attention** (`attention-coordinator.ts`):
   - Memory-efficient attention computation
   - 75% memory reduction vs naive implementation

3. **Int8 Quantization**:
   - Reduces memory footprint 50-75%
   - Trade-off: slight accuracy reduction

4. **Event Bus** (`event-bus.ts`):
   - Map-based O(1) handler lookup
   - Async dispatch com Promise.allSettled
   - Secure ID generation com crypto.randomBytes

5. **Map vs Array**:
   - 978x speedup usando Map para lookups vs Array.find

---

## 6. Sistema de Plugins e Discovery

### 6.1 Plugin Lifecycle

```
1. DISCOVER   → Find plugin in directory/registry
2. VALIDATE   → Schema validation + dependency check
3. LOAD       → Dynamic import + factory instantiation
4. INITIALIZE → onInitialize() callback
5. REGISTER   → Register hooks, tools, agents, workers
6. RUNNING    → Active + health monitoring
7. SHUTDOWN   → Graceful shutdown via onShutdown()
```

### 6.2 Extension Points

| Extension Point | Descrio | Handler Signature |
|-----------------|---------|-------------------|
| `PreTask` | Antes de executar task | `(ctx: TaskContext) => Promise<void>` |
| `PostTask` | Aps task completar | `(ctx: TaskContext) => Promise<void>` |
| `MemoryQuery` | Query memory | `(ctx: MemoryContext) => Promise<MemoryEntry[]>` |
| `ToolExecution` | Intercept tool call | `(ctx: ToolContext) => Promise<ToolResult>` |
| `AgentSpawn` | Quando agent criado | `(ctx: AgentContext) => Promise<void>` |
| `Error` | Error handler | `(ctx: ErrorContext) => Promise<void>` |

### 6.3 Plugin SDK (PluginBuilder)

```typescript
const myPlugin = new PluginBuilder('my-plugin', '1.0.0')
  .withDescription('My plugin')
  .withAuthor('Author Name')
  .withLicense('MIT')
  .withMCPTools([{
    name: 'my-tool',
    description: 'Does something',
    inputSchema: { type: 'object', properties: {} },
    handler: async (input) => ({ content: [{ type: 'text', text: 'Done' }] })
  }])
  .withHooks([{
    event: HookEvent.PreTask,
    handler: async (ctx) => { /* logic */ },
    priority: HookPriority.HIGH,
  }])
  .withWorkers([{
    type: 'background',
    handler: async () => { /* background work */ },
    interval: 5000,
  }])
  .onInitialize(async (ctx) => {
    // Initialize plugin resources
  })
  .onShutdown(async () => {
    // Cleanup
  })
  .build();
```

---

## 7. Memory System: AgentDB + HNSW

### 7.1 Architecture de 3 Camadas

```
┌─────────────────────────────────────────────────────┐
│              MemoryApplicationService               │
│  ( CQRS: Commands + Queries separation )            │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ┌──────────────────┐   ┌──────────────────────┐  │
│  │  CommandHandlers │   │    QueryHandlers     │  │
│  │  StoreMemory     │   │    SearchMemory       │  │
│  │  DeleteMemory    │   │    ListMemory         │  │
│  └────────┬─────────┘   └──────────┬───────────┘  │
│           │                         │              │
│           ▼                         ▼              │
│  ┌─────────────────────────────────────────────┐   │
│  │           HybridMemoryRepository             │   │
│  │  ┌─────────────┐    ┌─────────────────┐    │   │
│  │  │  SQLite     │    │    AgentDB      │    │   │
│  │  │  Backend    │    │    Backend      │    │   │
│  │  │             │    │                 │    │   │
│  │  │ Structured  │    │ Vector Search   │    │   │
│  │  │ Queries     │    │ HNSW Index       │    │   │
│  │  │ ACID Trans  │    │ Semantic Search │    │   │
│  │  └─────────────┘    └─────────────────┘    │   │
│  └─────────────────────────────────────────────┘   │
│                                                     │
│  ┌─────────────────────────────────────────────┐   │
│  │              CacheManager                    │   │
│  │  ( LRU cache + statistics )                 │   │
│  └─────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────┘
```

### 7.2 HybridBackend (ADR-009)

```typescript
const hybrid = new HybridBackend({
  sqlite: { dbPath: './memory.db' },
  agentdb: {
    dbPath: './agentdb.db',
    vectorDimension: 1536,
    hnswM: 16,
    hnswEfConstruction: 200,
    hnswEfSearch: 100,
  },
  routingStrategy: 'auto',  // auto | sqlite-first | agentdb-first
  dualWrite: true,          // Write to both backends
  semanticThreshold: 0.7,   // Threshold for hybrid queries
});
```

### 7.3 HNSW Index (150x-12,500x faster)

Implementao prpria em `hnsw-index.ts` com:

```typescript
class HNSWIndex {
  // BinaryMinHeap for O(log n) priority queue
  private nodes: Map<string, HNSWNode> = new Map();
  private entryPoint: string | null = null;
  
  // Performance optimizations:
  // - BinaryMinHeap/BinaryMaxHeap for O(log n) vs O(n log n)
  // - Pre-normalized vectors for O(1) cosine similarity
  // - Bounded max-heap for top-k tracking
  
  async addPoint(id: string, vector: Float32Array): Promise<void>
  async search(query: Float32Array, k: number, ef?: number): Promise<SearchResult[]>
  async removePoint(id: string): Promise<boolean>
  async rebuild(entries: Array<{id: string; vector: Float32Array}>): Promise<void>
}
```

**HNSW Parameters**:
- `M`: Max connections per node (default: 16)
- `efConstruction`: Search width during construction (default: 200)
- `efSearch`: Search width during query (default: 100)
- `metric`: 'cosine' | 'euclidean' | 'dot' (default: 'cosine')

### 7.4 AgentDB Backend

Integrao com `agentdb@3.0.0-alpha.10`:

```typescript
class AgentDBBackend implements IMemoryBackend {
  private agentdb: AgentDB;
  private entries: Map<string, MemoryEntry> = new Map();
  private numericToStringIdMap: Map<number, string> = new Map(); // O(1) reverse lookup
  
  async initialize(): Promise<void>
  async store(entry: MemoryEntry): Promise<void>
  async get(id: string): Promise<MemoryEntry | null>
  async search(embedding: Float32Array, options: SearchOptions): Promise<SearchResult[]>
  
  // Optional: Fallback to brute-force if AgentDB unavailable
  private bruteForceSearch(embedding: Float32Array, options: SearchOptions): SearchResult[]
}
```

### 7.5 Memory Types (DDD)

```typescript
// Domain entity
interface MemoryEntry {
  id: string;
  namespace: string;
  key: string;
  content: string;
  type: MemoryType;  // episodic | semantic | procedural | working | cache
  embedding?: Float32Array;
  tags: string[];
  accessLevel: 'public' | 'protected' | 'private';
  references: string[];
  metadata: Record<string, unknown>;
  createdAt: number;
  updatedAt: number;
  version: number;
  expiresAt?: number;
}

// Repository interface
interface IMemoryRepository {
  store(entry: MemoryEntry): Promise<void>;
  get(id: string): Promise<MemoryEntry | null>;
  search(query: MemoryQuery): Promise<MemoryEntry[]>;
  delete(id: string): Promise<boolean>;
}

// Query types
type MemoryQuery =
  | { type: 'semantic'; embedding: Float32Array; limit?: number }
  | { type: 'key'; namespace: string; key: string }
  | { type: 'tag'; tag: string; namespace?: string }
  | { type: 'range'; from: number; to: number; namespace?: string };
```

---

## 8. Swarm - 15-Agent Hierarchical Mesh

### 8.1 UnifiedSwarmCoordinator

```typescript
class UnifiedSwarmCoordinator {
  private config: SwarmConfig;
  private agentPool: AgentPool;
  private topology: TopologyManager;
  private consensus: ConsensusManager;
  private eventBus: IEventBus;
  
  async initialize(): Promise<void>
  async spawnAgent(options: AgentSpawnOptions): Promise<Agent>
  async assignTask(agentId: string, task: Task): Promise<TaskAssignment>
  async broadcastMessage(from: string, message: SwarmMessage): Promise<void>
  async reachConsensus(proposal: ConsensusRequest): Promise<ConsensusResponse>
}
```

### 8.2 Attention Coordinator

```typescript
class AttentionCoordinator {
  async coordinate(
    agentOutputs: AgentOutput[],
    task: Task,
    attentionType: AttentionType
  ): Promise<CoordinationResult> {
    // Routes task to appropriate attention mechanism
    // Returns consensus output + confidence
  }
  
  // Attention types
  async multiHead(query: Float32Array, keys: Float32Array[], values: Float32Array[]): Float32Array
  async flashAttention(query: Float32Array, key: Float32Array, value: Float32Array): Float32Array
  async mixtureOfExperts(task: Task, agents: SpecializedAgent[]): Promise<CoordinationResult>
  async hyperbolicEmbedding(agents: Agent[], topology: SwarmTopology): Promise<Float32Array[]>
  async graphRoPE(context: GraphContext): Promise<Float32Array>
}
```

### 8.3 Topology Manager

```typescript
const topologyConfigs: Record<TopologyType, TopologyConfig> = {
  'hierarchical-mesh': {
    centralNode: 'agent-1',  // Queen Coordinator
    layers: [
      ['agent-1'],  // Layer 0: Queen
      ['agent-2..12'],  // Layer 1: Workers
      ['agent-13..15'],  // Layer 2: Specialist
    ],
    meshConnections: [
      ['agent-2', 'agent-3', 'agent-4'],  // Security mesh
      ['agent-5', 'agent-6', 'agent-7', 'agent-8', 'agent-9'],  // Core mesh
      ['agent-10', 'agent-11', 'agent-12'],  // Integration mesh
    ]
  },
  // ... other topologies
};
```

---

## 9. Hooks System

### 9.1 Hook Registry

```typescript
class HookRegistry {
  private hooks: Map<string, HookEntry> = new Map();
  private hooksByEvent: Map<HookEvent, Set<string>> = new Map();
  
  register(
    event: HookEvent,
    handler: HookHandler,
    priority: HookPriority,
    options: HookRegistrationOptions = {}
  ): string;
  
  unregister(hookId: string): boolean;
  
  getForEvent(event: HookEvent, enabledOnly = true): HookEntry[];
  // Returns hooks sorted by priority (1 = highest)
  
  getStats(): HookRegistryStats;
}
```

### 9.2 Hook Types

```typescript
enum HookEvent {
  PreTask = 'pre:task',
  PostTask = 'post:task',
  PreAgentSpawn = 'pre:agent:spawn',
  PostAgentSpawn = 'post:agent:spawn',
  PreAgentTerminate = 'pre:agent:terminate',
  PostAgentTerminate = 'post:agent:terminate',
  PreMemoryQuery = 'pre:memory:query',
  PostMemoryQuery = 'post:memory:query',
  PreMemoryStore = 'pre:memory:store',
  PostMemoryStore = 'post:memory:store',
  PreToolExecution = 'pre:tool:execution',
  PostToolExecution = 'post:tool:execution',
  SwarmInitialized = 'swarm:initialized',
  SwarmShutdown = 'swarm:shutdown',
  Error = 'error',
}
```

### 9.3 Background Daemons

12 workers que executam continuamente:

```typescript
// Daemon types
type DaemonType = 
  | 'mcp-tools'      // MCP tool processing
  | 'session'        // Session management
  | 'statusline'     // Status line updates
  | 'memory-gc'      // Memory garbage collection
  | 'health-check'   // Health monitoring
  | 'event-sync'     // Event synchronization
  // ... more
```

---

## 10. Guidance Control Plane

### 10.1 Overview

O Guidance um sistema de governance que compila, recupera, impe e evolui regras para sesses Claude Code. Baseado em parsing de `CLAUDE.md`.

### 10.2 Compiler (ADR-005 compliance)

```typescript
// Parses CLAUDE.md into structured policy bundle
interface PolicyBundle {
  constitution: Constitution;     // First 30-60 lines (always loaded)
  shards: RuleShard[];            // Task-scoped rules
  manifest: RuleManifest;         // Machine-readable metadata
}

// Compiler extracts:
// - Rule IDs: [R001], RULE-001, etc.
// - Risk classes: (critical), [high-risk], etc.
// - Domain tags: @security, @testing, etc.
// - Tool classes: [edit], [bash], etc.
// - Intent tags: #bug-fix, #feature, etc.
```

### 10.3 Key Components

| Component | Ficheiro | Funo |
|-----------|----------|------|
| Compiler | `compiler.ts` | Parse CLAUDE.md → policy bundle |
| Retriever | `retriever.ts` | Get relevant rules by context |
| Gates | `gates.ts` | Policy enforcement points |
| Ledger | `ledger.ts` | Audit trail for compliance |
| Memory Gate | `memory-gate.ts` | Links to memory system |
| Trust | `trust.ts` | Trust scoring system |
| Adversarial | `adversarial.ts` | Defense against prompt injection |
| WASM Kernel | `wasm-kernel.ts` | Performance-critical logic in WASM |

---

## 11. MCP Server

### 11.1 Architecture

```typescript
class MCPServer implements IMCPServer {
  private toolRegistry: ToolRegistry;
  private sessionManager: SessionManager;
  private connectionPool: ConnectionPool;
  private transport: TransportManager;
  
  async start(): Promise<void>
  async stop(): Promise<void>
  
  // Transport support
  registerTool(tool: MCPTool): boolean
  registerTools(tools: MCPTool[]): { registered: number; failed: string[] }
}
```

### 11.2 Transport Layers

```typescript
// Multiple transport options
type TransportType = 'stdio' | 'http' | 'websocket' | 'in-process';

const config = {
  transport: 'stdio',  // Default
  host: 'localhost',
  port: 3000,
};
```

### 11.3 Tool Registry

```typescript
class ToolRegistry {
  private tools: Map<string, MCPTool> = new Map();
  
  registerTool(tool: MCPTool): boolean
  getTool(name: string): MCPTool | undefined
  listTools(): MCPTool[]
  
  // Pre-built tool sets
  registerAgentTools(agentManager: AgentManager): void
  registerSwarmTools(coordinator: SwarmCoordinator): void
  registerMemoryTools(memory: MemoryService): void
  registerHookTools(hooks: HookRegistry): void
}
```

---

## 12. Segurana

### 12.1 @claude-flow/security

Implementaes CVE remediation:

```typescript
// Password hashing
class PasswordHasher {
  async hash(password: string): Promise<string>
  async verify(password: string, hash: string): Promise<boolean>
}

// Input validation (Zod-based)
validateInput(schema: ZodSchema, data: unknown): ValidationResult

// Path security
sanitizePath(path: string): string  // Prevents traversal
secureRead(filePath: string): Promise<string>
secureWrite(filePath: string, content: string): Promise<void>

// Secure ID generation
generateSecureId(): string  // Uses crypto.randomBytes
```

### 12.2 Security Features

| Feature | Implementation |
|---------|---------------|
| CVE Remediation | All known CVEs addressed in dependencies |
| Input Validation | Zod schemas at all system boundaries |
| SQL Injection | Parameterized queries in EventStore |
| Path Traversal | Path sanitization in security module |
| Secure IDs | crypto.randomBytes for event/session IDs |
| bcrypt | Password hashing with configurable rounds |

---

## 13. Configurao e Tipos Partilhados

### 13.1 V3SwarmConfig

```typescript
interface V3SwarmConfig extends SwarmConfig {
  name: string;
  version: string;
  description: string;
  domains: DomainConfig[];    // security, core, integration, quality, performance, deployment
  phases: PhaseConfig[];      // phase-1-foundation → phase-4-release
  performance: PerformanceTargets;
  github: GitHubConfig;
  logging: LoggingConfig;
}

interface DomainConfig {
  domain: AgentDomain;
  agents: string[];
  priority: number;
  parallelExecution: boolean;
}

interface PhaseConfig {
  id: PhaseId;
  name: string;
  weeks: [number, number];
  activeDomains: AgentDomain[];
  prerequisites: PhaseId[];
}
```

### 13.2 Performance Targets Type

```typescript
const V3_PERFORMANCE_TARGETS: PerformanceTargets = {
  hnswSearchSpeedup: { min: 150, max: 12500 },
  flashAttentionSpeedup: { min: 2.49, max: 7.47 },
  memoryReduction: { min: 0.50, max: 0.75 },  // 50-75%
  maxCodeLines: 5000,
  maxStartupMs: 500,
  maxSonaLatencyMs: 0.05,
};
```

### 13.3 Legacy Shared Types

Preservados para backward compatibility:

```typescript
// Shared types (legacy)
export type {
  AgentId, AgentRole, AgentDomain, AgentStatus,
  TaskId, TaskType, TaskStatus, TaskPriority,
  PhaseId, TopologyType, SwarmConfig, SwarmState,
  EventType, SwarmEvent, MessageType
};

// Event factories
export function agentSpawnedEvent(agent: Agent): SwarmEvent
export function taskCreatedEvent(task: Task): SwarmEvent
export function swarmInitializedEvent(config: SwarmConfig): SwarmEvent
// ... more event factories
```

---

## 14. Directorio Completo

```
v3/
├── @claude-flow/
│   ├── shared/
│   │   └── src/
│   │       ├── core/
│   │       │   ├── config/        # Schema, validation, defaults, loader
│   │       │   ├── interfaces/    # DDD interfaces (agent, task, event, memory)
│   │       │   ├── orchestrator/  # TaskManager, SessionManager, HealthMonitor
│   │       │   └── event-bus.ts  # EventBus implementation
│   │       ├── events/
│   │       │   ├── event-store.ts # SQLite-backed event store
│   │       │   ├── domain-events.ts
│   │       │   └── projections.ts
│   │       ├── types/
│   │       └── index.ts
│   │
│   ├── memory/
│   │   └── src/
│   │       ├── hybrid-backend.ts     # SQLite + AgentDB
│   │       ├── agentdb-backend.ts    # AgentDB integration
│   │       ├── sqlite-backend.ts     # SQLite standalone
│   │       ├── hnsw-index.ts         # HNSW vector index (1013 linhas)
│   │       ├── cache-manager.ts      # LRU cache
│   │       ├── domain/               # DDD entities
│   │       ├── application/          # CQRS commands + queries
│   │       └── infrastructure/      # Repository implementations
│   │
│   ├── swarm/
│   │   └── src/
│   │       ├── attention-coordinator.ts  # Flash Attention (1000 linhas)
│   │       ├── agent-pool.ts
│   │       ├── consensus/           # Raft, Byzantine, Gossip
│   │       ├── coordination/        # AgentRegistry, TaskOrchestrator
│   │       ├── domain/              # Agent, Task entities
│   │       └── application/         # SwarmApplicationService
│   │
│   ├── hooks/
│   │   └── src/
│   │       ├── registry/            # HookRegistry
│   │       ├── executor/           # HookExecutor
│   │       ├── daemons/            # 12 background workers
│   │       ├── reasoningbank/      # SONA learning
│   │       ├── llm/                # LLM hooks
│   │       └── workers/            # Worker implementations
│   │
│   ├── guidance/
│   │   └── src/
│   │       ├── compiler.ts         # CLAUDE.md parser
│   │       ├── retriever.ts        # Rule retrieval
│   │       ├── gates.ts            # Policy enforcement
│   │       ├── ledger.ts           # Audit trail
│   │       ├── optimizer.ts         # Rule evolution
│   │       ├── memory-gate.ts       # Memory integration
│   │       ├── wasm-kernel.ts      # WASM acceleration
│   │       └── [20+ more submodules]
│   │
│   ├── plugins/
│   │   └── src/
│   │       ├── sdk/                # PluginBuilder
│   │       ├── registry/           # PluginRegistry
│   │       ├── core/               # BasePlugin, PluginInterface
│   │       ├── hooks/              # Hook integration
│   │       ├── workers/            # Worker system
│   │       ├── providers/          # LLM providers
│   │       ├── collections/         # Plugin collections
│   │       └── integrations/
│   │           ├── agentic-flow.ts
│   │           └── ruvector/       # Attention mechanisms
│   │
│   ├── security/
│   │   └── src/
│   │       ├── password-hasher.ts
│   │       ├── input-validation.ts
│   │       └── path-security.ts
│   │
│   ├── cli/                        # CLI commands
│   ├── integration/                 # agentic-flow bridge
│   ├── performance/                 # Benchmarking framework
│   ├── neural/                      # SONA learning
│   ├── deployment/                  # CI/CD
│   ├── testing/                     # TDD framework
│   ├── providers/                   # LLM providers
│   ├── embeddings/                  # Embedding generation
│   ├── codex/                       # Codex integration
│   ├── aidefence/                   # AI defense
│   ├── browser/                     # Browser automation
│   ├── claims/                      # Claims management
│   └── sisr/                        # SISR module
│
├── mcp/
│   ├── server.ts                   # MCP server (792 linhas)
│   ├── tool-registry.ts            # Tool registration
│   ├── session-manager.ts          # Session management
│   ├── connection-pool.ts          # Connection pooling
│   ├── transport/                  # stdio, http, websocket
│   └── tools/                      # MCP tool definitions
│       ├── agent-tools.ts
│       ├── swarm-tools.ts
│       ├── memory-tools.ts
│       ├── hooks-tools.ts
│       ├── session-tools.ts
│       └── config-tools.ts
│
├── src/
│   ├── core/                       # Orchestrator components
│   ├── shared/                     # Legacy shared types
│   ├── events/                     # Event system
│   ├── coordination/               # Swarm coordination
│   ├── index.ts                    # Main entry (590 linhas)
│   └── swarm.config.ts            # Swarm configuration (455 linhas)
│
├── __tests__/integration/
│   ├── memory-integration.test.ts
│   ├── swarm-integration.test.ts
│   ├── mcp-integration.test.ts
│   ├── plugin-integration.test.ts
│   └── workflow-integration.test.ts
│
├── docs/
├── helpers/
├── scripts/
├── index.ts
├── swarm.config.ts
├── vitest.config.ts
├── package.json
└── tsconfig.base.json
```

---

## Resumo

O Claude Flow V3 uma arquitetura **altamente modular** construda sobre:

1. **10 ADRs** que guiam todas as decises arquitecturais
2. **18 packages** organizados por bounded contexts (DDD)
3. **Event sourcing** completo com SQLite-backed EventStore
4. **HNSW vector search** para 150x-12,500x faster semantic search
5. **15-agent hierarchical mesh** swarm com mltiplas topologias
6. **Plugin microkernel** architecture com 17 hook types
7. **Guidance control plane** para governance de agentes
8. **MCP-first API** com mltiplos transports
9. **Performance targets agressivos** validados por benchmarks

O sistema privilegia **performance** (Flash Attention, Int8 quantization, O(1) Map lookups), **segurana** (CVE remediation, Zod validation, secure IDs) e **extensibilidade** (plugin system, hook system).
