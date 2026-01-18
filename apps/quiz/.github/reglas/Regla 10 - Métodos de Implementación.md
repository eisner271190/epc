← [Volver al inicio](../p.md)

# Regla 10 - Métodos de Implementación

Un método de implementación contiene lógica de negocio o técnica, pero no debe coordinar el flujo completo ni llamar múltiples servicios sin razón clara.

---

### DEBE
- Contener lógica de negocio o técnica (if/else, validaciones, cálculos, transformaciones).

### NO DEBE
- Conocer el flujo completo.
- Llamar múltiples servicios sin una razón clara.

### Ejemplos
- Cumple:
  ```dart
  Order applyDiscountIfNeeded(Order order) {
    if (order.total > 1000) {
      return order.applyDiscount(0.1);
    }
    return order;
  }
  ```
- No cumple:
  ```dart
  void processPayment(Order order) {
    if (order.total > 1000) {
      applyDiscount(order);
    }
    paymentService.charge(order);
    emailService.sendConfirmation(order);
  }
  ```

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - La verificación automática es limitada; se recomienda revisión manual complementaria.

---
