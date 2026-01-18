← [Volver al inicio](../p.md)

# Regla 20 - Todo consumo de API REST debe usar IHttpClient

Todas las llamadas a APIs REST deben realizarse a través de la interfaz IHttpClient, nunca directamente con Dio, http u otras librerías.

---

### DEBE
- Usar IHttpClient para todas las llamadas a APIs REST.
- IHttpClient debe manejar excepciones de red, timeout y parsing.

### NO DEBE
- Usar Dio, http, etc. directamente en servicios.

### Ejemplos
- Cumple: `final response = await _httpClient.post(...)`
- No cumple: `final response = await _dio.post(...)`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - _dio\.|http\.
- **Línea de comando:**
  - grep -En "_dio\.|http\." lib/*_service.dart
- **Notas:**
  - Revisar que solo se use IHttpClient en servicios.

---
