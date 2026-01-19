← [Volver al inicio](../p.md)

# Regla 23 - No instanciar clases concretas directamente en servicios externos

No se debe instanciar clases concretas de servicios externos directamente, siempre usar inyección de dependencias o ServiceLocator.

---

### DEBE
- Usar ServiceLocator o inyección de dependencias para instanciar servicios.

### NO DEBE
- Instanciar clases concretas con `new` o constructores directos.

### Ejemplos
- Cumple: `final service = ServiceLocator.get<IApiService>()`
- No cumple: `final service = ApiService()`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - new [A-Za-z]+Service|[A-Za-z]+Service\(
- **Línea de comando:**
  - grep -En "new [A-Za-z]+Service|[A-Za-z]+Service\(" lib/*_service.dart
- **Notas:**
  - Revisar que no se instancien clases concretas directamente.

---
