← [Volver al inicio](../p.md)


# Regla 11 - Todo método de implementación debe tener logs

Todo método de implementación debe tener al menos un log relevante.

---

### DEBE
- Métodos de implementación (validaciones, cálculos, transformaciones, reglas de negocio) deben tener al menos 1 log.

### NO DEBE
- No loggear en métodos que no sean de implementación (modelos, DTOs, orquestación, getters/setters simples).

### Ejemplos
- Cumple: método de implementación con log.
- No cumple: método de implementación sin log.

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Revisar cada método de implementación.

---
