← [Volver al inicio](../p.md)

# Regla 38 - DRY - Don't Repeat Yourself

---

## DEBE
- No duplicar lógica, datos o configuración.
- Si el mismo código aparece más de 2 veces → extraer a función/clase.
- Strings literales repetidos → mover a constantes.
- Lógica condicional repetida → extraer a función.
- Configuración duplicada entre archivos .env → centralizar.

## NO DEBE
- Copiar y pegar código.
- Repetir la misma validación.

## Ejemplo
```dart
// Cumple DRY
String formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';
// No cumple DRY
String formatDate1(DateTime d) => '${d.day}/${d.month}/${d.year}';
String formatDate2(DateTime d) => '${d.day}/${d.month}/${d.year}';
```

## Verificación
- Buscar código duplicado con herramientas.
- Grep por strings duplicados.

## Migración
1. Extraer funciones/clases para lógica repetida.
2. Centralizar configuración y constantes.

---

[dry.md](../dry.md)
