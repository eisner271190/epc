← [Volver al inicio](../p.md)

# Regla 19 - Usar siempre interfaces para servicios externos

Toda integración con servicios externos debe tener una interfaz abstracta implementada por la clase concreta.

---

### DEBE
- Definir una interfaz (abstract class) para cada servicio externo.
- La implementación concreta debe usar `implements`.

### NO DEBE
- Usar clases concretas directamente sin interfaz.

### Ejemplos
- Cumple: `class AuthService implements IAuthService {}`
- No cumple: `class AuthService {}` sin interfaz

### Verificación
- **Método recomendado:** Expresión regular/manual
- **Expresión regular:**
  - implements I[A-Za-z]+Service
- **Línea de comando:**
  - grep -En "implements I[A-Za-z]+Service" lib/*_service.dart
- **Notas:**
  - Revisar que cada servicio tenga su interfaz y la implemente.

---
