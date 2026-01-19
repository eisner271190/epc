← [Volver al inicio](../p.md)

# Regla 30 - Centralización y tipado de rutas de navegación

Esta regla integra y extiende los lineamientos de [routes.md](../routes.md) y complementa [Regla 28 - Rutas de navegación y archivos como constantes](Regla%2028%20-%20Rutas%20de%20navegaci%C3%B3n%20y%20archivos%20como%20constantes.md).

---

## DEBE
- Centralizar todas las rutas de navegación en una sola clase final (preferido) o enumeración, ubicada en `lib/core/routes.dart`.
- Usar constantes tipadas para todas las rutas (`static const String` o `enum`).
- Documentar cada ruta con su propósito y parámetros esperados.
- Centralizar los parámetros de rutas en una clase dedicada (`RouteParams`).
- Usar siempre las constantes en navegación y definición de rutas.

## NO DEBE
- Usar strings literales en navegación (`Navigator.pushNamed(context, '/home')`).
- Duplicar definiciones de rutas en múltiples archivos.
- Usar rutas inconsistentes (mezclar `/home`, `home`, `/Home`).
- Hardcodear parámetros de rutas.

## Ejemplos
### Cumple
```dart
// lib/core/routes.dart
abstract final class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  // ...
}
Navigator.pushNamed(context, AppRoutes.home);

// lib/core/route_params.dart
abstract final class RouteParams {
  static const String userId = 'userId';
}
Navigator.pushNamed(context, AppRoutes.profile, arguments: {RouteParams.userId: '123'});
```

### No cumple
```dart
Navigator.pushNamed(context, '/home'); // ❌
Navigator.pushNamed(context, '/Profile'); // ❌
Navigator.pushNamed(context, '/seting'); // typo ❌
Navigator.pushNamed(context, AppRoutes.profile, arguments: {'userid': '123'}); // typo ❌
```

## Verificación
- **Checklist:**
  - [ ] Todas las rutas están centralizadas en AppRoutes
  - [ ] 0 strings literales en navegación
  - [ ] Parámetros centralizados en RouteParams
- **Comandos:**
  - `grep -r "pushNamed.*['"]/" lib/`
  - `grep -r "pushReplacementNamed.*['"]/" lib/`
  - `grep -r "static const String.*=" lib/core/routes.dart`

## Excepciones
- Ninguna. Todas las rutas y parámetros deben estar centralizados sin excepción.

## Beneficios
- Refactoring seguro y rápido.
- Autocompletado y detección de errores por el IDE.
- Consistencia y documentación centralizada.
- Prevención de errores de typo y duplicidad.

## Migración
1. Crear/actualizar `lib/core/routes.dart` con clase AppRoutes.
2. Listar todas las rutas existentes y definirlas como constantes.
3. Reemplazar cada string literal en navegación por la constante correspondiente.
4. Centralizar parámetros en RouteParams.
5. Verificar compilación y pruebas.

---

[Regla 28 - Rutas de navegación y archivos como constantes](Regla%2028%20-%20Rutas%20de%20navegaci%C3%B3n%20y%20archivos%20como%20constantes.md) | [routes.md](../routes.md)
