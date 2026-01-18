← [Volver al inicio](../p.md)

# Regla 12 - Logs en inglés, descriptivos y específicos

Todos los mensajes de log deben estar en inglés, ser claros y específicos, y evitar mensajes genéricos.

---

### DEBE
- Mensajes de log en inglés.
- Mensajes claros, específicos y descriptivos.

### NO DEBE
- Mensajes genéricos como "error", "failed", "something went wrong".
- Mensajes en español u otros idiomas.

### Ejemplos
- Cumple: `Logger.info('User created successfully')`
- No cumple: `Logger.info('Usuario creado')`, `Logger.error('error')`

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Se debe interpretar el mensaje para asegurar que sea claro, específico y en inglés. La verificación automática es limitada.

---
