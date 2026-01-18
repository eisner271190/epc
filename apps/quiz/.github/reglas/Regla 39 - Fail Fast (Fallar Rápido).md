← [Volver al inicio](../p.md)

# Regla 39 - Fail Fast (Fallar Rápido)

---

## DEBE
- Detectar y reportar errores lo antes posible.
- Validar parámetros al inicio de la función usando Validator.
- Lanzar excepciones específicas, no genéricas.
- NO retornar null, usar Optional/Result types.
- Validar configuración al inicio de la app.
- NO swallow exceptions sin logging.

## NO DEBE
- Validar tarde en la ejecución.
- Usar Exception genérico.
- Retornar null sin justificación.
- Ignorar errores en bloques catch.

## Ejemplo
```dart
// Cumple Fail Fast
void saveUser(String email) {
  Validator.notEmpty(email);
  // ...
}
// No cumple Fail Fast
void saveUser(String email) {
  // ...
  if (email.isEmpty) throw Exception('Error');
}
```

## Verificación
- Validaciones en las primeras líneas.
- Usar Validator y excepciones específicas.
- Revisar bloques catch y tipos de retorno.

## Migración
1. Refactorizar validaciones al inicio de funciones.
2. Usar Validator y excepciones específicas.
3. Validar configuración global en main().

---

[fail-fast.md](../fail-fast.md)
