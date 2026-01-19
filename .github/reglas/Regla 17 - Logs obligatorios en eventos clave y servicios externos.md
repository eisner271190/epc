← [Volver al inicio](../p.md)

# Regla 17 - Logs obligatorios en eventos clave y servicios externos

Se deben agregar logs al menos en: inicio de operación importante, fin exitoso, errores/excepciones, llamadas a servicios externos y transformaciones relevantes de datos. Los logs deben estar en inglés.

---

### DEBE
- Loggear inicio y fin de operaciones importantes.
- Loggear errores y excepciones.
- Loggear llamadas a servicios externos (API, Firebase, DB).
- Loggear transformaciones relevantes de datos.
- Todos los logs deben estar en inglés.

### NO DEBE
- Omitir logs en estos eventos clave.
- Loggear en español u otros idiomas.

### Ejemplos
- Cumple: log en inicio, fin, error, llamada externa, transformación.
- No cumple: no loggear en estos puntos, log en español.

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Revisar que todos los eventos clave estén loggeados y en inglés.

---
