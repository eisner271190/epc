← [Volver al inicio](../p.md)

# Regla 01 - Convenciones de nomenclatura

Todas las entidades deben seguir las convenciones de nombres del lenguaje.

---

### DEBE
- Clases: PascalCase
- Variables/funciones: camelCase
- Archivos: snake_case.dart
- Constantes: camelCase (Dart) o UPPER_SNAKE_CASE (tradicional)

### NO DEBE
- No seguir las convenciones de nombres.

### Ejemplos
- Cumple: `class UserRepository {}`
- No cumple: `class user_repository {}`

### Verificación
- **Método recomendado:** Línea de comando (dart analyze)
- **Expresión regular:**
  - class [a-z] (para clases mal nombradas)
- **Línea de comando:**
  - dart analyze
- **Notas:**
  - dart analyze detecta la mayoría de violaciones de nomenclatura automáticamente.

---
