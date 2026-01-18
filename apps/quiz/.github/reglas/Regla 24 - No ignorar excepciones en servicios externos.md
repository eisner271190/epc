← [Volver al inicio](../p.md)

# Regla 24 - No ignorar excepciones en servicios externos

No se deben ignorar excepciones (swallow exceptions) en servicios externos; siempre se debe loggear y/o relanzar la excepción.

---

### DEBE
- Loggear y/o relanzar excepciones capturadas.

### NO DEBE
- Usar bloques catch vacíos o sin logging.

### Ejemplos
- Cumple: `catch (e) { logger.error(e); rethrow; }`
- No cumple: `catch (e) {}`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - catch \(e\) \{\s*\}
- **Línea de comando:**
  - grep -En "catch \(e\) \{\s*\}" lib/*_service.dart
- **Notas:**
  - Revisar que todas las excepciones sean loggeadas o relanzadas.

---
