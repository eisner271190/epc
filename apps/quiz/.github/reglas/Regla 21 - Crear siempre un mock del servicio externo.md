← [Volver al inicio](../p.md)

# Regla 21 - Crear siempre un mock del servicio externo

Por cada servicio real debe existir un mock (archivo *_service_mock.dart o clase Mock*Service) junto al servicio real.

---

### DEBE
- Crear un mock para cada servicio externo.
- Ubicar el mock junto al servicio real.

### NO DEBE
- Omitir el mock de servicios externos.

### Ejemplos
- Cumple: `class MockAuthService implements IAuthService {}`
- No cumple: no existe mock para AuthService

### Verificación
- **Método recomendado:** Manual/expresión regular
- **Expresión regular:**
  - Mock[A-Za-z]+Service
- **Línea de comando:**
  - grep -En "Mock[A-Za-z]+Service" lib/*_service_mock.dart
- **Notas:**
  - Revisar que cada servicio tenga su mock correspondiente.

---
