← [Volver al inicio](../p.md)

# Regla 36 - Principio de Inversión de Dependencias (DIP)

---

## DEBE
- Los módulos de alto nivel NO DEBEN importar módulos de bajo nivel directamente.
- Ambos deben depender de abstracciones (interfaces).
- Las clases de dominio NO DEBEN importar clases de infraestructura.
- Usar inyección de dependencias en constructores.

## NO DEBE
- Instanciar dependencias concretas dentro de clases.
- Depender de implementaciones concretas.
- Mezclar lógica de negocio con detalles de infraestructura.

## Ejemplo
```dart
// Cumple DIP
class MyService {
  final IUserRepository _repo;
  MyService(this._repo);
}
// No cumple DIP
class MyService {
  final UserRepository _repo = UserRepository();
}
```

## Verificación
- Buscar imports y dependencias concretas en clases de negocio.
- Revisar tipos de campos y parámetros.

## Migración
1. Refactorizar dependencias a interfaces.
2. Usar inyección de dependencias.

---

[dip.md](../dip.md)
