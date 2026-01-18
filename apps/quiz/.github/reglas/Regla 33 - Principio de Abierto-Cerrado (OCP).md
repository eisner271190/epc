← [Volver al inicio](../p.md)

# Regla 33 - Principio de Abierto/Cerrado (OCP)

---

## DEBE
- Las entidades deben estar abiertas para extensión pero cerradas para modificación.
- Usar interfaces/clases abstractas para definir contratos.
- Usar inyección de dependencias en lugar de instanciación directa.
- Usar patrones de diseño para extensibilidad (Strategy, Factory, Template Method).

## NO DEBE
- Modificar clases existentes para agregar funcionalidad.
- Usar switches o if-else largos para elegir comportamiento.
- Depender de clases concretas.

## Ejemplo
```dart
// Cumple OCP
abstract class PaymentMethod { void pay(); }
class Paypal implements PaymentMethod { void pay() { /* ... */ } }
class Stripe implements PaymentMethod { void pay() { /* ... */ } }
// No cumple OCP
class PaymentService { void pay(String type) { if (type == 'paypal') ... } }
```

## Verificación
- Nueva funcionalidad = nueva clase, no editar clase existente.
- Buscar dependencias de clases concretas y switches largos.

## Migración
1. Refactorizar dependencias a interfaces.
2. Extraer lógica extensible a nuevas clases.
3. Implementar patrones de diseño si aplica.

---

[ocp.md](../ocp.md)
