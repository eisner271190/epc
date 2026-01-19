← [Volver al inicio](../p.md)

# Regla 09 - Métodos de Orquestación

Un método de orquestación solo coordina el flujo, llama a otros métodos o servicios y no contiene lógica de negocio.

---

### DEBE
- Coordinar el flujo de ejecución.
- Llamar a otros métodos o servicios.
- Manejar errores y loggear inicio/fin del flujo.

### NO DEBE
- Contener if/else con reglas de negocio, cálculos, validaciones de dominio o transformaciones complejas de datos.

### Ejemplos
- Cumple:
  ```dart
  void processPayment(Order order) {
    final discountedOrder = applyDiscountIfNeeded(order);
    paymentService.charge(discountedOrder);
    emailService.sendConfirmation(discountedOrder);
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
