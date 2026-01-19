← [Volver al inicio](../p.md)

# Regla 03 - Funciones ≤ 10 instrucciones

Las funciones deben tener máximo 10 instrucciones ejecutables.

---

### DEBE
- Cada función debe tener hasta 10 instrucciones ejecutables.

### NO DEBE
- Ninguna función debe superar las 10 instrucciones ejecutables.

### Ejemplos
- Cumple: función con 10 instrucciones o menos.
- No cumple: función con 11 instrucciones o más.

### Verificación
- **Método recomendado:** Manual/herramienta de complejidad
- **Expresión regular:**
  - (opcional, para patrones simples)
- **Línea de comando:**
  - dart metrics check lib/
- **Notas:**
  - Se recomienda usar herramientas de análisis de complejidad o inspección manual.

---
