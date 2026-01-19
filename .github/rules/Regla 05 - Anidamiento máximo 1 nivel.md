← [Volver al inicio](../p.md)

# Regla 05 - Anidamiento máximo 1 nivel

Evitar anidamientos profundos, máximo 1 nivel de indentación.

---

### DEBE
- El código debe tener como máximo 1 nivel de anidamiento.

### NO DEBE
- No debe haber bloques anidados más allá de 1 nivel.

### Ejemplos
- Cumple: función con un solo if o for anidado.
- No cumple: función con if dentro de otro if.

### Verificación
- **Método recomendado:** Manual/regex
- **Expresión regular:**
  - if.*\{[^}]*if
- **Línea de comando:**
  - grep -En "if.*\{[^}]*if" lib/*.dart
- **Notas:**
  - La verificación automática es limitada; se recomienda revisión manual complementaria.

---
