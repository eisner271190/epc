← [Volver al inicio](../p.md)

# Regla 13 - Logs encapsulados en métodos privados

Todos los llamados a Logger deben estar encapsulados en métodos privados (_log*), nunca llamados directamente desde métodos públicos.

---

### DEBE
- Encapsular cada log en un método privado.

### NO DEBE
- Llamar a Logger directamente fuera de métodos _log*.

### Ejemplos
- Cumple: `_logLoginSuccessful(userId)`
- No cumple: `Logger.info('Login successful', data: {'userId': userId})` en método público

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - Logger\.(info|error|debug)\s*\(
- **Línea de comando:**
  - grep -En "Logger\.(info|error|debug)\s*\(" lib/*.dart
- **Notas:**
  - Revisar que las llamadas directas solo estén en métodos _log*.

---
