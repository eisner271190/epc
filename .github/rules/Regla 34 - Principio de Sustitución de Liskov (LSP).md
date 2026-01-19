← [Volver al inicio](../p.md)

# Regla 34 - Principio de Sustitución de Liskov (LSP)

---


## DEBE
- Los objetos de una subclase deben poder reemplazar objetos de la superclase sin romper la aplicación.
- Si override un método, debe aceptar todos los valores que la base acepta.

## NO DEBE
- Las subclases NO DEBEN lanzar excepciones nuevas no declaradas en la base.
- Las subclases NO DEBEN requerir validaciones adicionales no requeridas por la base.
- Las subclases NO DEBEN retornar null si la base nunca retorna null.
- Hacer subclases más restrictivas que la base.
- Violar el contrato definido por la base.
- Cambiar el comportamiento esperado de la base.

## Ejemplo
```dart
// Cumple LSP
class Animal { void speak() {} }
class Dog extends Animal { void speak() {} }
// No cumple LSP
class Cat extends Animal { void speak() { throw Exception(); } }
```

## Verificación
- Tests pasan con cualquier implementación de la interfaz/base.
- Revisar validaciones y excepciones en overrides.

## Migración
1. Revisar subclases y sus contratos.
2. Refactorizar para cumplir el contrato de la base.

---

[lsp.md](../lsp.md)
