← [Volver al inicio](../p.md)

 
# Regla 15 - No loggear valores sensibles (se deben enmascarar)

Nunca se deben loggear contraseñas, tokens, API keys ni datos personales sensibles. Si es necesario loggear, se deben enmascarar (ejemplo: mostrar solo los últimos 4 caracteres).

---

### DEBE
- Excluir valores sensibles de los logs o enmascararlos si es necesario.

### NO DEBE
- Loggear passwords, tokens, API keys, datos personales sin enmascarar.

### Ejemplos
- Cumple: log sin datos sensibles o con datos enmascarados (ejemplo: `Logger.info('Token: ****1234')`)
- No cumple: `Logger.info('Login with password: $password')`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - password|token|api[_-]?key|card|tarjeta
- **Línea de comando:**
  - grep -Ein "password|token|api[_-]?key|card|tarjeta" lib/*.dart
- **Notas:**
  - Revisar que los datos loggeados no sean sensibles.

---
