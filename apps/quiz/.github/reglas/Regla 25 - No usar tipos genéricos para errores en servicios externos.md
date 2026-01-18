← [Volver al inicio](../p.md)

# Regla 25 - No usar tipos genéricos para errores en servicios externos

No se deben lanzar excepciones genéricas (Exception), siempre usar tipos específicos (ApiException, NetworkException, etc.).

---

### DEBE
- Lanzar excepciones específicas para cada tipo de error.

### NO DEBE
- Lanzar `Exception()` genérico.

### Ejemplos
- Cumple: `throw ApiException('Invalid credentials')`
- No cumple: `throw Exception('Error')`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - throw Exception\(
- **Línea de comando:**
  - grep -En "throw Exception\(" lib/*_service.dart
- **Notas:**
  - Revisar que se usen excepciones específicas.

---
