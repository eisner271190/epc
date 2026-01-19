← [Volver al inicio](../p.md)

# Regla 32 - Principio de Responsabilidad Única (SRP)

---


## DEBE
- Cada clase, función o módulo debe tener UNA Y SOLO UNA razón para cambiar.
- Si una clase tiene múltiples responsabilidades, extraer en clases separadas.

## NO DEBE
- Una clase no debe tener más de 3 métodos públicos (excluyendo constructores/getters/setters sin lógica).
- Una función no debe tener más de 10 instrucciones ejecutables.
- Una función no debe modificar estado y retornar valor simultáneamente.
- Usar nombres de clase genéricos o que indiquen múltiples responsabilidades (Manager, Handler, Helper, Utils, Common, AND).

## Ejemplo
```dart
// Cumple SRP
class UserRepository {
  User getUser(int id) { /* ... */ }
  void saveUser(User user) { /* ... */ }
}
// No cumple SRP
class UserManager { // hace muchas cosas }
```

## Verificación
- Pregunta: "¿Por qué cambiaría esta clase?" debe tener una sola respuesta.
- Contar métodos públicos y líneas por función.
- Buscar nombres prohibidos.

## Migración
1. Identificar clases con múltiples responsabilidades.
2. Dividir en clases/ficheros separados.
3. Refactorizar funciones largas o con doble propósito.

---

[srp.md](../srp.md)
