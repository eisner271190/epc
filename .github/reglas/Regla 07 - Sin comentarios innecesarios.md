← [Volver al inicio](../p.md)

# Regla 07 - Sin comentarios innecesarios

El código debe ser autoexplicativo y no debe tener comentarios innecesarios.

---

### DEBE
- Usar comentarios solo para documentación pública (`///`).

### NO DEBE
- No debe haber comentarios `//` salvo imports o doc comments.

### Ejemplos
- Cumple: código sin comentarios o solo con doc comments.
- No cumple: código con comentarios redundantes.

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - ^\s*//(?!/)
- **Línea de comando:**
  - grep -En "^\s*//(?!/)" lib/*.dart
- **Notas:**
  - La regex detecta comentarios que no son documentación pública.

---
