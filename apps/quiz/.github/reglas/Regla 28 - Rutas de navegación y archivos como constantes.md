← [Volver al inicio](../p.md)




# Regla 28 - Rutas de navegación y archivos como constantes

Todas las rutas de navegación y archivos deben estar definidas exclusivamente en l10n, nunca como strings literales en el código.

---

### DEBE
- Definir rutas de navegación y archivos exclusivamente en l10n.
- Usar esas constantes en vez de strings literales para rutas y paths.

### NO DEBE
- Usar strings literales para rutas de navegación o archivos.

### Ejemplos
- Cumple: `Navigator.pushNamed(context, AppLocalizations.of(context).homeRoute)`, `AppLocalizations.of(context).dataDirectory`
- No cumple: `Navigator.pushNamed(context, '/home')`, `'/Users/john/app/data.json'`

### Verificación
- **Método recomendado:** Expresión regular/línea de comando
- **Expresión regular:**
  - /['"][^']+/ (para rutas)
- **Línea de comando:**
  - grep -En "Navigator.pushNamed\(.*['\"][^']+['\"]" lib/*.dart
- **Notas:**
  - Revisar que las rutas y paths estén definidos como constantes.

---
