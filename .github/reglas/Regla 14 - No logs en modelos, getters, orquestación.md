← [Volver al inicio](../p.md)

# Regla 14 - No logs en modelos, getters/setters simples ni orquestación

No se deben poner logs en modelos (Freezed), getters/setters simples ni métodos de orquestación.

---

### DEBE
- Loggear solo en métodos de lógica de negocio.

### NO DEBE
- Loggear en modelos (`@freezed`), getters/setters simples, métodos de orquestación.

### Ejemplos
- Cumple: log en método de lógica.
- No cumple: log en modelo, getter/setter simple, orquestador.

### Verificación
- **Método recomendado:** Expresión regular/manual
- **Expresión regular:**
  - @freezed.*\n[\s\S]*Logger
- **Línea de comando:**
  - grep -En "@freezed.*\n[\s\S]*Logger" lib/*.dart
- **Notas:**
  - Revisar manualmente orquestadores y getters/setters.

---
