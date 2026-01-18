← [Volver al inicio](../p.md)

# Regla 35 - Principio de Segregación de Interfaces (ISP)

---

## DEBE
- Ningún cliente debe ser forzado a depender de métodos que no usa.
- Una interfaz NO DEBE tener más de 5 métodos.
- Preferir múltiples interfaces específicas sobre una interfaz general.
- Crear interfaces basadas en las necesidades del cliente.

## NO DEBE
- Crear interfaces "God" (monolíticas).
- Dejar métodos sin implementar.
- Forzar implementaciones a tener métodos innecesarios.

## Ejemplo
```dart
// Cumple ISP
abstract class Reader { void read(); }
abstract class Writer { void write(); }
// No cumple ISP
abstract class GodService { void read(); void write(); void validate(); void delete(); }
```

## Verificación
- Buscar interfaces con > 5 métodos.
- Buscar métodos vacíos o con UnimplementedError.

## Migración
1. Dividir interfaces grandes en específicas.
2. Eliminar métodos innecesarios.

---

[isp.md](../isp.md)
