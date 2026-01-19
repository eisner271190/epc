← [Volver al inicio](../p.md)

# Regla 22 - Variables de entorno en todos los archivos .env

Toda variable de entorno utilizada en servicios debe estar presente en todos los archivos .env (.env, .env.example, .env.development, .env.production).

---

### DEBE
- Incluir todas las variables de entorno necesarias en todos los archivos .env.

### NO DEBE
- Omitir variables en algún archivo .env.

### Ejemplos
- Cumple: variable API_BASE_URL presente en todos los .env
- No cumple: variable solo en uno o dos .env

### Verificación
- **Método recomendado:** Línea de comando
- **Línea de comando:**
  - grep "API_BASE_URL" .env*
- **Notas:**
  - Revisar que todas las variables estén en todos los archivos .env.

---
