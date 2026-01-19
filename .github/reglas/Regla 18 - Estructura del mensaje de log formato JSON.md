← [Volver al inicio](../p.md)

# Regla 18 - Estructura del mensaje de log: formato JSON

El mensaje de log debe tener estructura JSON o key-value pairs, nunca construirse a mano como string plano.

---

### DEBE
- Usar formato JSON o key-value pairs para los datos del log.
- Usar helper centralizado (Logger.info, Logger.error, Logger.debug).

### NO DEBE
- Construir el mensaje de log a mano como string plano.

### Ejemplos
- Cumple: `Logger.info('User created', data: {'id': userId, 'email': email})`
- No cumple: `Logger.info('User created: id=' + userId + ', email=' + email)`

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Revisar que los datos del log estén estructurados y no concatenados manualmente.

---
