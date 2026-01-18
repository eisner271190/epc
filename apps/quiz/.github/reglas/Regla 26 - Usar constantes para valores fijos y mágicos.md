← [Volver al inicio](../p.md)


# Regla 26 - Usar constantes para valores fijos y mágicos

Un valor mágico es cualquier número, string o literal usado directamente en el código cuyo significado no es evidente y que puede cambiar en el futuro (por ejemplo: 18, 120, 16, 'home', '/api/v1').

Ejemplo de valor mágico:
```dart
if (age > 18) // 18 es un valor mágico
```

Cada feature debe tener su propia clase de constantes llamada {Feature}Constants (por ejemplo: UserConstants, QuizConstants). Si una constante se utiliza en más de un feature, debe estar en core/constants.dart.

---

### DEBE
- Definir valores fijos y mágicos como constantes en la clase {Feature}Constants correspondiente.
- Si la constante es compartida, definirla en core/constants.dart.
- Usar constantes en vez de literales en el código.

### NO DEBE
- Usar números mágicos o strings literales repetidos directamente en el código.

### Ejemplos
- Cumple: `UserConstants.minimumAge`, `QuizConstants.maxQuestions`, `core/constants.dart: maxUsernameLength`
- No cumple: `if (age > 18)`, `SizedBox(height: 16)`, `Navigator.pushNamed(context, '/home')`

### Verificación
- **Método recomendado:** Expresión regular/línea de comando
- **Expresión regular:**
  - [^a-zA-Z_][0-9]{2,}[^a-zA-Z_]
- **Línea de comando:**
  - grep -rE "[^a-zA-Z_][0-9]{2,}[^a-zA-Z_]" lib/
- **Notas:**
  - Revisar que los valores estén definidos como constantes y no como literales.

---
