← [Volver al inicio](../p.md)

# Regla 08 - Sin hardcoding

No debe haber valores sensibles o configuraciones hardcodeadas en el código fuente.

---

### DEBE
- Usar variables de entorno o archivos de configuración.

### NO DEBE
- Hardcodear claves, tokens, URLs, etc.

### Ejemplos
- Cumple: `final apiKey = AppConfig.apiKey;`
- No cumple: `final apiKey = '12345-abcde';`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - (['"][A-Za-z0-9]{6,}['"])
- **Línea de comando:**
  - grep -En "['\"][A-Za-z0-9]{6,}['\"]" lib/*.dart
- **Notas:**
  - Se recomienda revisión manual para casos complejos.

---
