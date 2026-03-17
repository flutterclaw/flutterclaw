# Plan: Paridad WhatsApp en FlutterClaw (Baileys/OpenClaw)

## Resumen
Implementar paridad funcional con Baileys/OpenClaw usando la implementación Signal actual (sin librerías GPL), priorizando envío a contactos nuevos y luego completar grupos, media y acciones. El objetivo es habilitar envío/recepción fiable, manteniendo compatibilidad con el flujo de pairing y login ya alineado con Baileys.

## Cambios clave (por prioridad)

1. **Crypto/firmas sin GPL (bloqueante)**
   - Retirar `libsignal_protocol_dart` del árbol de dependencias.
   - Implementar firma/verificación Curve25519 compatible con Signal usando una librería permisiva o código interno MIT/PD.
   - Actualizar `noise_crypto.dart`, `auth_state.dart`, `pair_success.dart`, `x3dh.dart` para usar la nueva implementación.
   - Agregar tests con vectores conocidos de sign/verify.

2. **Sesiones 1:1 y envío a contactos nuevos (prioridad #1)**
   - Implementar fetch de prekey bundle desde `iq xmlns=encrypt type=get` y parse a `PreKeyBundle`.
   - Agregar `ensureSession(jid)` en el flujo de envío: si no existe sesión, pedir bundle e inicializarla.
   - Invalidar sesión ante `decrypt-error` repetido (re-fetch bundle).
   - Asegurar `registrationId` correcto en upload de prekeys y en mensajes prekey.
   - Cache mínimo de sesiones para evitar fetch por mensaje.

3. **Receipts y presencia (estabilidad post-login)**
   - En inbound, enviar `receipt` de delivery (y `participant` para grupos).
   - Mantener `retry` receipts para decrypt-error.
   - En login success: `passive:active`, `presence available`, `unified_session` y persistencia de `lid`.

4. **LID/PN mapping y routing de JIDs**
   - Persistir mapping `lid ↔ pn` en `auth_state`.
   - Resolver destinatarios (preferir LID cuando esté disponible).
   - Migrar/duplicar sesión si cambia a LID.

5. **Grupos con sender keys**
   - Reemplazar sender-key actual por una implementación compatible con Signal.
   - Implementar envío de `sender-key distribution` cuando no existe sender key en el grupo.
   - En inbound, procesar `sender-key distribution` y decrypt de `skmsg`.

6. **Media (upload/download)**
   - Integrar `media_upload` en `message_send` para imágenes/documentos/audio.
   - Completar parsing de media inbound y descarga on-demand.
   - Respetar límites de tamaño configurables.

7. **Acciones (reacciones/polls)**
   - Implementar formato de mensajes de reacción/poll.
   - En inbound, extraer y mapear a eventos del channel.

## Cambios en APIs / tipos públicos
- `AuthenticationCreds`: agregar/usar mapping LID/PN persistente y counters de prekeys.
- `WASocket`: exponer `ensureSession` (o helper) usado por `message_send`.
- `WhatsAppClient`/ChannelAdapter: actualizar flujo inbound para receipts, media y acciones.

## Plan de pruebas
1. **Manual**: Pairing + reinicio limpio + login estable (sin 500).
2. **Manual**: Enviar a contacto nuevo (sin sesión previa).
3. **Manual**: Recibir y responder en grupo; verificar que mensajes entran y salen.
4. **Manual**: Media inbound/outbound (imagen + documento).
5. **Unit**: parse de prekey bundle; init de sesión; firma/verify Curve25519; receipts con/sin participant.
6. **Unit**: LID/PN mapping y selección de JID en envío.

## Supuestos
- No se pueden usar librerías GPL: la firma Curve25519 debe ser permissive.
- Objetivo: paridad funcional con Baileys/OpenClaw, no UI.
- Se acepta entregar en fases, priorizando **enviar a contactos nuevos** antes de grupos y media.
