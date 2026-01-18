← [Volver al inicio](../p.md)


# Regla 27 - Textos de UI deben estar en i18n

Todos los textos visibles en la UI deben estar internacionalizados usando exclusivamente AppLocalizations.

---

### DEBE
- Usar AppLocalizations para todos los textos de UI.

### NO DEBE
- Hardcodear textos en widgets (ejemplo: `Text('Welcome')`).

### Ejemplos
- Cumple: `Text(AppLocalizations.of(context).welcome)`
- No cumple: `Text('Bienvenido')`, `Text('Welcome')`, `Text(AppStrings.welcome)`

### Verificación
- **Método recomendado:** Expresión regular/línea de comando
- **Expresión regular:**
  - Text\(['"][^']+['"]\)
- **Línea de comando:**
  - grep -En "Text\(['\"][^']+['\"]\)" lib/*.dart
- **Notas:**
  - Revisar que todos los textos estén internacionalizados.

---
