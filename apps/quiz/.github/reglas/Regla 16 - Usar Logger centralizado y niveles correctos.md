← [Volver al inicio](../p.md)

# Regla 16 - Usar Logger centralizado y niveles correctos

Se debe usar la clase Logger centralizada y los niveles de log correctos (info, debug, error).

---

### DEBE
- Usar Logger.info, Logger.debug, Logger.error.
- Usar debugPrint solo dentro de Logger.

### NO DEBE
- Usar debugPrint fuera de Logger.
- Usar Logger sin nivel adecuado.
- Incluir stacktrace en logs de info/debug (solo en error).

### Ejemplos
- Cumple: `Logger.error('Failed', error: e, stackTrace: stack)`
- No cumple: `debugPrint('error')` fuera de Logger

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - debugPrint\s*\(
- **Línea de comando:**
  - grep -En "debugPrint\s*\(" lib/*.dart
- **Notas:**
  - Revisar que debugPrint solo esté en Logger y que los niveles sean correctos.

---
