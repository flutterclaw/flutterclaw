---
name: Chat persistente compartido
overview: Hacer que la sesion de chat con el agente sea persistente y compartida entre /agents/chat y /analytics/traffic mientras el usuario este logueado. Persistencia directa en PostgreSQL (common DB) desde platform-agents usando pg. Lectura desde site-platform via backend-platform-1. Sesion expira 1 hora despues de la ultima interaccion.
todos:
  - id: sql-script
    content: Crear script SQL con tablas agent_chat_sessions (FK a users, session_name) y agent_chat_messages, con campo last_interaction_at para expiracion de 1 hora
    status: pending
  - id: sequelize-models
    content: "backend-platform-1: Crear modelos Sequelize agent_chat_sessions.js y agent_chat_messages.js en models/common/"
    status: pending
  - id: register-models
    content: "backend-platform-1: Registrar los nuevos modelos en models/common/init-models.js con relaciones"
    status: pending
  - id: chat-api-routes
    content: "backend-platform-1: Crear routes/v3/cities/agent-chat.js con endpoints (POST ensure-session, GET messages)"
    status: pending
  - id: mount-routes
    content: "backend-platform-1: Montar la nueva ruta agent-chat en app.js"
    status: pending
  - id: pg-service
    content: "platform-agents: Agregar dependencia pg y crear src/shared/services/chat-db.ts con conexion directa a PostgreSQL common y funciones ensureSession/addMessage"
    status: pending
  - id: replace-firestore
    content: "platform-agents: En /run/platform (agents.ts), reemplazar Firestore por chat-db: ensure session, persist user msg, persist assistant msg directamente en PostgreSQL"
    status: pending
  - id: agent-chat-context
    content: "site-platform: Crear context/agent-chat-context.js con estado compartido y carga de historial desde backend-platform-1"
    status: pending
  - id: refactor-hook
    content: "site-platform: Refactorizar hooks/use-agent-chat.js para consumir del AgentChatContext"
    status: pending
  - id: add-provider-layout
    content: "site-platform: Agregar AgentChatProvider en app/layout.js dentro de AuthProvider"
    status: pending
  - id: update-agents-chat
    content: "site-platform: Actualizar app/agents/chat/page.js para usar el context compartido"
    status: pending
  - id: update-traffic-page
    content: "site-platform: Actualizar app/analytics/traffic/page.js para usar el context compartido"
    status: pending
isProject: false
---

# Chat persistente y compartido entre paginas

## Diagnostico actual

```mermaid
flowchart TB
  subgraph sitePlatform [site-platform - Estado actual]
    AgentsChat["agents/chat/page.js"]
    TrafficPage["analytics/traffic/page.js"]
    Hook1["useAgentChat() - instancia 1"]
    Hook2["useAgentChat() - instancia 2"]
    State1["useState messages A"]
    State2["useState messages B"]
  end

  subgraph platformAgents [platform-agents]
    RunEndpoint["POST /run/platform"]
    InMemory["InMemorySessionService (ADK)"]
    FirestoreWrite["Firestore write (audit)"]
  end

  AgentsChat --> Hook1 --> State1
  TrafficPage --> Hook2 --> State2
  Hook1 -->|"session_id con TIMESTAMP"| RunEndpoint
  Hook2 -->|"session_id con TIMESTAMP"| RunEndpoint
  RunEndpoint --> InMemory
  RunEndpoint --> FirestoreWrite
```



**Problemas:**

- Cada pagina crea su propia instancia de `useAgentChat` con `useState` local -- los mensajes no se comparten
- El `sessionId` incluye `Date.now()` que cambia en cada mount -- cada navegacion crea una sesion nueva
- No hay forma de leer mensajes previos
- Al navegar entre paginas los mensajes se pierden

## Arquitectura propuesta

```mermaid
flowchart TB
  subgraph sitePlatform [site-platform]
    Layout["app/layout.js"]
    Provider["AgentChatProvider (Context)"]
    AgentsChat2["agents/chat/page.js"]
    TrafficPage2["analytics/traffic/page.js"]
    AnyPage["cualquier pagina futura"]
  end

  subgraph platformAgents2 [platform-agents]
    RunEndpoint2["POST /run/platform"]
    InMemory2["InMemorySessionService (ADK)"]
    ChatDB["chat-db.ts (NUEVO) - pg directo"]
  end

  subgraph backendPlatform [backend-platform-1]
    ChatAPI["agent-chat routes (LECTURA)"]
  end

  subgraph postgres [PostgreSQL common DB]
    SessionsTable["agent_chat_sessions"]
    MessagesTable["agent_chat_messages"]
    UsersTable["users"]
  end

  Layout --> Provider
  Provider -->|"1. GET active session + messages"| ChatAPI
  ChatAPI -->|"SELECT"| postgres
  Provider -->|"2. POST prompt"| RunEndpoint2
  RunEndpoint2 -->|"INSERT directo"| ChatDB
  ChatDB -->|"pg client"| postgres
  RunEndpoint2 --> InMemory2
  SessionsTable -->|"FK user_id"| UsersTable
  AgentsChat2 -->|"consume context"| Provider
  TrafficPage2 -->|"consume context"| Provider
  AnyPage -->|"consume context"| Provider
```



**Responsabilidades claras:**

- **platform-agents**: escribe sesiones y mensajes **directo a PostgreSQL** via `pg` (sin HTTP intermediario)
- **backend-platform-1**: expone endpoints para que el frontend cargue el historial (`POST /ensure-session`, `GET /messages`)
- **site-platform**: lee historial via backend-platform-1. Envia mensajes via platform-agents

**Flujo de un mensaje:**

1. **Carga inicial (frontend):** `AgentChatContext` llama a backend-platform-1 `POST /ensure-session` para obtener sesion activa (o crear una si expiro), luego `GET /:sessionId/messages`
2. **Envio de mensaje:** frontend envia prompt a platform-agents `POST /run/platform`
3. **platform-agents** escribe directo a PostgreSQL:
  - a) `ensureSession()` -> SELECT/INSERT en `agent_chat_sessions`
  - b) `addMessage('user', ...)` -> INSERT en `agent_chat_messages`
  - c) Procesa con ADK
  - d) `addMessage('assistant', ...)` -> INSERT en `agent_chat_messages`
4. Retorna `{ response, session_id }` al frontend
5. Frontend actualiza el state compartido

---

## 1. Script SQL -- Tablas nuevas en PostgreSQL (common)

```sql
-- agent_chat_sessions: una sesion activa por usuario/ciudad/variante
-- FK a users(user_id). Expira 1h despues de last_interaction_at.
-- session_name: nombre legible generado al crear la sesion, ej: "17 de Marzo de 2026"
CREATE TABLE agent_chat_sessions (
    id                  SERIAL PRIMARY KEY,
    session_id          TEXT NOT NULL UNIQUE,
    user_id             TEXT NOT NULL REFERENCES users(user_id),
    city_id             INTEGER NOT NULL REFERENCES cities(city_id),
    variant_id          INTEGER NOT NULL,
    agent_id            TEXT NOT NULL DEFAULT 'transitAgent',
    session_name        TEXT NOT NULL,
    is_active           BOOLEAN NOT NULL DEFAULT TRUE,
    last_interaction_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_acs_user_active
    ON agent_chat_sessions (user_id, city_id, variant_id, is_active);

CREATE INDEX idx_acs_last_interaction
    ON agent_chat_sessions (is_active, last_interaction_at);

-- agent_chat_messages: mensajes de cada sesion
CREATE TABLE agent_chat_messages (
    id              SERIAL PRIMARY KEY,
    session_id      TEXT NOT NULL REFERENCES agent_chat_sessions(session_id) ON DELETE CASCADE,
    role            TEXT NOT NULL CHECK (role IN ('user', 'assistant')),
    content         TEXT NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_acm_session
    ON agent_chat_messages (session_id, created_at ASC);
```

**Expiracion:** La sesion se considera expirada si `last_interaction_at < NOW() - INTERVAL '1 hour'`.

---

## 2. backend-platform-1 -- Modelos Sequelize

Crear dos archivos en `models/common/` siguiendo el patron existente (`module.exports = function(sequelize, DataTypes)`):

- **Archivo nuevo:** `models/common/agent_chat_sessions.js`
  - Campos: `id`, `session_id` (UNIQUE), `user_id` (FK a users), `city_id` (FK a cities), `variant_id`, `agent_id`, `session_name`, `is_active`, `last_interaction_at`, `created_at`, `updated_at`
- **Archivo nuevo:** `models/common/agent_chat_messages.js`
  - Campos: `id`, `session_id` (FK a agent_chat_sessions.session_id), `role`, `content`, `created_at`

**Registrar en** `models/common/init-models.js`:

- Agregar require + instanciacion en `initModels()`
- Relaciones:
  - `agent_chat_sessions.hasMany(agent_chat_messages, { foreignKey: 'session_id', sourceKey: 'session_id' })`
  - `agent_chat_messages.belongsTo(agent_chat_sessions, { foreignKey: 'session_id', targetKey: 'session_id' })`
  - `users.hasMany(agent_chat_sessions, { foreignKey: 'user_id' })`
  - `cities.hasMany(agent_chat_sessions, { foreignKey: 'city_id' })`

---

## 3. backend-platform-1 -- Endpoints API

**Archivo nuevo:** `routes/v3/cities/agent-chat.js`

Patron: `module.exports = (db, dbCommon) => { router... return router }`.
Auth: Firebase Bearer token (middleware `authenticate` ya existente setea `req.user`).


| Metodo | Ruta                   | Descripcion                                                                                                                                                                                                                                                                     |
| ------ | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `POST` | `/ensure-session`      | Busca sesion activa para `user_id + city_id + variant_id` donde `is_active = true AND last_interaction_at > NOW() - 1h`. Si existe la retorna. Si no, marca cualquier sesion previa como `is_active = false` y crea una nueva con `session_name` legible. Retorna `{ session }` |
| `GET`  | `/:sessionId/messages` | Mensajes de una sesion ordenados por `created_at ASC`. Retorna `{ messages: [{ id, role, content, created_at }] }`                                                                                                                                                              |


**Nota:** `POST /:sessionId/messages` ya NO existe aqui -- platform-agents escribe directo a la DB.

`**user_id`** de `req.user.user_id`. `**variant_id`** del header `variant-id`. `**city_id`** de `req.params.city_id`.

**Generacion de `session_name`:**

```javascript
function generateSessionName() {
    const months = [
        'Enero','Febrero','Marzo','Abril','Mayo','Junio',
        'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'
    ];
    const now = new Date();
    return `${now.getDate()} de ${months[now.getMonth()]} de ${now.getFullYear()}`;
}
// -> "17 de Marzo de 2026"
```

**Montar en `app.js`:**

```javascript
app.use('/api/v3/cities/:city_id/agent-chat', require('./routes/v3/cities/agent-chat')(db, dbCommon));
```

---

## 4. platform-agents -- Conexion directa a PostgreSQL

### Dependencia

```bash
npm install pg
npm install --save-dev @types/pg
```

### Archivo nuevo: `src/shared/services/chat-db.ts`

Conexion directa a la base de datos **common** de PostgreSQL usando `pg.Pool`. La cadena de conexion se configura via variable de entorno `COMMON_DB_URL` (o `COMMON_DB_HOST`, `COMMON_DB_NAME`, etc. segun la convencion del proyecto).

**Funciones que expone:**

```typescript
// Busca sesion activa (no expirada). Si no existe o expiro, crea una nueva.
// Retorna el session_id activo (puede ser diferente al que tenia el cliente).
export async function ensureSession(
    userId: string,
    cityId: number,
    variantId: number,
    agentId: string
): Promise<{ session_id: string; is_new: boolean }>

// Inserta un mensaje y actualiza last_interaction_at en la sesion.
export async function addMessage(
    sessionId: string,
    role: 'user' | 'assistant',
    content: string
): Promise<void>
```

**Logica de `ensureSession`** (SQL directo con `pg`):

1. `SELECT session_id FROM agent_chat_sessions WHERE user_id=$1 AND city_id=$2 AND variant_id=$3 AND is_active=true AND last_interaction_at > NOW() - INTERVAL '1 hour'`
2. Si existe: retorna ese `session_id` con `is_new: false`
3. Si no: `UPDATE agent_chat_sessions SET is_active=false WHERE user_id=$1 AND city_id=$2 AND variant_id=$3 AND is_active=true` + `INSERT INTO agent_chat_sessions (session_id, user_id, city_id, variant_id, agent_id, session_name, ...) VALUES (...)` con `session_id = ${userId}_${cityId}_${variantId}_v${timestamp}` y `session_name` generado

**Logica de `addMessage`:**

1. `INSERT INTO agent_chat_messages (session_id, role, content) VALUES ($1, $2, $3)`
2. `UPDATE agent_chat_sessions SET last_interaction_at=NOW(), updated_at=NOW() WHERE session_id=$1`

### Variable de entorno nueva en platform-agents

```
COMMON_DB_URL=postgresql://user:password@host:5432/common_db
```

---

## 5. platform-agents -- Reemplazar Firestore en /run/platform

**Archivo:** `src/server/routes/agents.ts`

**ANTES (Firestore):**

```typescript
await ensureSessionDoc(agentId, session_id, {userId, cityId, variantId});
await appendMessage(agentId, session_id, 'user', prompt);
// ... agent processes ...
await appendMessage(agentId, session_id, 'assistant', finalResponseText);
```

**DESPUES (pg directo):**

```typescript
// 1. Ensure active session in PostgreSQL (handles 1h expiry)
const { session_id: activeSessionId } = await ensureSession(userId, cityId, variantId, agentId);

// 2. Persist user message directly to PostgreSQL
await addMessage(activeSessionId, 'user', prompt);

// 3. Run ADK with the active session_id
const events = runner.runAsync({
    userId,
    sessionId: activeSessionId,
    newMessage: { role: 'user', parts: [{ text: `<user_input>${prompt}</user_input>` }] },
});

// ... process events ...

// 4. Persist assistant response directly to PostgreSQL
await addMessage(activeSessionId, 'assistant', finalResponseText);

// 5. Return response WITH session_id so frontend stays in sync
res.json({
    success: true,
    response: finalResponseText,
    session_id: activeSessionId,
});
```

**Eliminar:** Todas las llamadas a `ensureSessionDoc()` y `appendMessage()` de `firestore-sessions.ts`. El archivo `firestore-sessions.ts` puede eliminarse si no se usa en otro lugar.

---

## 6. site-platform -- Crear AgentChatContext

**Archivo nuevo:** `context/agent-chat-context.js`

- Al inicializarse: llama a `POST /api/v3/cities/:cityId/agent-chat/ensure-session` luego `GET /:sessionId/messages`
- `sendMessage(text)`:
  1. Optimistic UI (agrega mensaje user al state)
  2. `POST` a platform-agents `/run/platform` con `{ prompt, session_id }`
  3. Lee `session_id` de la respuesta (por si expiro y cambio)
  4. Agrega respuesta del asistente al state

---

## 7. site-platform -- Refactorizar useAgentChat

**Archivo:** `hooks/use-agent-chat.js`

```javascript
export function useAgentChat() {
  const context = useContext(AgentChatContext);
  if (!context) throw new Error('useAgentChat must be used within AgentChatProvider');
  return context;
}
```

---

## 8. site-platform -- Agregar provider al layout

**Archivo:** `app/layout.js`

```jsx
<AuthProvider>
  <AgentChatProvider>
    {children}
  </AgentChatProvider>
</AuthProvider>
```

---

## 9. site-platform -- Actualizar paginas

`**app/agents/chat/page.js`:** usar `useAgentChat()` sin parametros. Mantener logica de `?message=`.

`**app/analytics/traffic/page.js`:** usar `useAgentChat()` sin parametros. Panel sidebar muestra los mismos mensajes.

---

## Limitacion conocida

El `InMemorySessionService` de ADK pierde el contexto del agente si el servidor de platform-agents se reinicia. Los mensajes seguiran visibles en la UI (cargados desde PostgreSQL), pero el agente no recordara la conversacion previa. Esto es pre-existente y fuera de alcance.