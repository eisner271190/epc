← [Volver al inicio](../p.md)

# Regla 37 - KISS - Keep It Simple, Stupid

---

## DEBE
- La solución más simple que funciona es la mejor.
- Complejidad ciclomática ≤ 5 por función.
- Código legible sin necesidad de comentarios.

## NO DEBE
- Usar expresiones complejas anidadas.

## Ejemplo
```dart
// Cumple KISS
bool isAdult(int age) => age >= 18;
// No cumple KISS
bool canVote(int age, bool isCitizen) { if (age >= 18 && isCitizen) { ... } }
```

## Verificación
- Contar puntos de decisión por función.
- Revisar expresiones complejas.

## Migración
1. Refactorizar funciones complejas en pasos simples.
2. Usar nombres descriptivos y funciones pequeñas.

---

[kiss.md](../kiss.md)
