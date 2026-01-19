← [Volver al inicio](../p.md)

# Regla 02 - Clases ≤ 100 líneas

Las clases no deben tener más de 100 líneas.

---

### DEBE
- Cada clase debe ocupar como máximo 100 líneas de código.

### NO DEBE
- Ninguna clase debe superar las 100 líneas.

### Ejemplos
- Cumple: archivo con clase de 100 líneas o menos.
- No cumple: archivo con clase de 101 líneas o más.

### Verificación
- **Método recomendado:** Línea de comando
- **Expresión regular:**
  - ^.*$ (para contar líneas)
- **Línea de comando:**
  - wc -l archivo.dart
- **Notas:**
  - El comando cuenta líneas de archivo, útil para automatización.

---
