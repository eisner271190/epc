← [Volver al inicio](../p.md)

# Regla 04 - Máximo 2 parámetros por función

Las funciones deben recibir como máximo 2 parámetros.

---

### DEBE
- Cada función debe tener hasta 2 parámetros.

### NO DEBE
- Ninguna función debe tener más de 2 parámetros.

### Ejemplos
- Cumple: `void foo(int a, int b)`
- No cumple: `void foo(int a, int b, int c)`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - \([^)]+,[^)]+,[^)]+\)
- **Línea de comando:**
  - grep -En "\([^)]+,[^)]+,[^)]+\)" lib/*.dart
- **Notas:**
  - La regex detecta funciones con 3 o más parámetros.

---
