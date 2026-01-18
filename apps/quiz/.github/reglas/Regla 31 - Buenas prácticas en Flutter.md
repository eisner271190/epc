← [Volver al inicio](../p.md)

# Regla 31 - Buenas prácticas en Flutter

Esta regla integra y extiende los lineamientos de [flutter.md](../flutter.md) y complementa reglas de organización, hardcoding y arquitectura.

---

## DEBE
- Usar `const` en widgets inmutables siempre que sea posible.
- Manejar el estado de forma explícita y consistente (Provider, Riverpod, Bloc, Cubit, etc.).
- Preferir `StatelessWidget` sobre `StatefulWidget` salvo que haya estado interno.
- Validar `context.mounted` después de cualquier `await` antes de usar `BuildContext`.
- Manejar explícitamente los estados de carga, vacío y error en widgets async.
- Centralizar estilos y colores usando `ThemeData` y evitar valores hardcodeados.
- Organizar el proyecto por feature/dominio, no por tipo de archivo.
- Los widgets solo pueden renderizar UI, llamar métodos de providers/blocs, navegar y realizar validación visual simple.

## NO DEBE
- Incluir lógica de negocio, cálculos, validaciones complejas, llamadas directas a APIs/DB en widgets.
- Usar `BuildContext` después de `await` sin validar `mounted`.
- Hardcodear colores, tamaños, espaciados en widgets.
- Crear widgets gigantes (> 100 líneas).

## Ejemplos
### Cumple
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract final class CounterConstants {
  static const double spacing = 16;
  static const int incrementDelayMs = 300;
}

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  Future<void> incrementAsync() async {
    await Future.delayed(const Duration(milliseconds: CounterConstants.incrementDelayMs));
    _count++;
    notifyListeners();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>().count;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.counterLabel(counter), // Texto internacionalizado
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: CounterConstants.spacing),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
          ),
          onPressed: () async {
            await context.read<CounterProvider>().incrementAsync();
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.incrementedMsg)), // Texto internacionalizado
            );
          },
          child: Text(l10n.incrementButton), // Texto internacionalizado
        ),
      ],
    );
  }
}
```

### No cumple
```dart
class PriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final basePrice = product.price; // ❌ Lógica de negocio
    // ...
    return Text('Total: ...');
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2196F3), // ❌ Hardcoded
      child: Text('Button'),
    );
  }
}
```

## Verificación
- **Checklist por widget:**
  - [ ] Usa `const` donde es posible
  - [ ] < 100 líneas
  - [ ] No contiene lógica de negocio
  - [ ] No contiene llamadas directas a API/DB
  - [ ] Si usa `await` + `context` → valida `mounted`
  - [ ] Colores y estilos vienen de Theme
  - [ ] FutureBuilder/StreamBuilder manejan todos los estados
- **Checklist por proyecto:**
  - [ ] Patrón de estado definido
  - [ ] Organización por feature
  - [ ] Theme centralizado
  - [ ] Ratio StatelessWidget > 70%
- **Comandos:**
  - `grep -r "Color(0x" lib/`
  - `grep -A3 "await" lib/ | grep "context." | grep -v "mounted"`
  - `find lib/ -name "*.dart" -exec wc -l {} \; | sort -rn`

## Excepciones
- Textos de debug/logs pueden ser literales.
- Widgets de infraestructura (ej: ErrorWidget, LoadingWidget) pueden exceder 100 líneas si están bien documentados y justificados.

## Beneficios
- Mejor rendimiento y mantenibilidad.
- Código más seguro y fácil de refactorizar.
- Consistencia visual y arquitectónica.
- Prevención de errores comunes en Flutter.

## Migración
1. Revisar todos los widgets y aplicar checklist.
2. Refactorizar widgets que excedan 100 líneas o contengan lógica de negocio.
3. Centralizar estilos y colores en ThemeData.
4. Definir y documentar el patrón de estado del proyecto.

---

[flutter.md](../flutter.md)
