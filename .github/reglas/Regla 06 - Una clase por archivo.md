← [Volver al inicio](../p.md)

# Regla 06 - Una clase por archivo

Cada archivo debe contener una sola clase pública.

---

### DEBE
- Un archivo debe tener solo una declaración de clase pública.

### NO DEBE
- No debe haber múltiples clases públicas en el mismo archivo.

### Ejemplos
- Cumple: archivo con una sola clase pública.
- No cumple: archivo con dos o más clases públicas.

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - ^class [A-Z][a-zA-Z0-9_]*
- **Línea de comando:**
  - grep -En "^class [A-Z][a-zA-Z0-9_]*" lib/*.dart
- **Notas:**
  - Contar ocurrencias por archivo; si hay más de una, no cumple.

---
