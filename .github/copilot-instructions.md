
← [Volver al inicio](../p.md)

# Regla 01 - Convenciones de nomenclatura

Todas las entidades deben seguir las convenciones de nombres del lenguaje.

---

### DEBE
- Clases: PascalCase
- Variables/funciones: camelCase
- Archivos: snake_case.dart
- Constantes: camelCase (Dart) o UPPER_SNAKE_CASE (tradicional)

### NO DEBE
- No seguir las convenciones de nombres.

### Ejemplos
- Cumple: `class UserRepository {}`
- No cumple: `class user_repository {}`

### Verificación
- **Método recomendado:** Línea de comando (dart analyze)
- **Expresión regular:**
  - class [a-z] (para clases mal nombradas)
- **Línea de comando:**
  - dart analyze
- **Notas:**
  - dart analyze detecta la mayoría de violaciones de nomenclatura automáticamente.

---


← [Volver al inicio](../p.md)

# Regla 02 - Clases ≤ 100 líneas

Las clases no deben tener más de 100 líneas.

---

### DEBE
- Cada clase debe ocupar como máximo 100 líneas de código.

### NO DEBE
- Ninguna clase debe superar las 100 líneas.

### Ejemplos
- Cumple: archivo con clase de 100 líneas o menos.
- No cumple: archivo con clase de 101 líneas o más.

### Verificación
- **Método recomendado:** Línea de comando
- **Expresión regular:**
  - ^.*$ (para contar líneas)
- **Línea de comando:**
  - wc -l archivo.dart
- **Notas:**
  - El comando cuenta líneas de archivo, útil para automatización.

---


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


← [Volver al inicio](../p.md)

# Regla 04 - Máximo 2 parámetros por función

Las funciones deben recibir como máximo 2 parámetros.

---

### DEBE
- Cada función debe tener hasta 2 parámetros.

### NO DEBE
- Ninguna función debe tener más de 2 parámetros.

### Ejemplos
- Cumple: `void foo(int a, int b)`
- No cumple: `void foo(int a, int b, int c)`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - \([^)]+,[^)]+,[^)]+\)
- **Línea de comando:**
  - grep -En "\([^)]+,[^)]+,[^)]+\)" lib/*.dart
- **Notas:**
  - La regex detecta funciones con 3 o más parámetros.

---


← [Volver al inicio](../p.md)

# Regla 05 - Anidamiento máximo 1 nivel

Evitar anidamientos profundos, máximo 1 nivel de indentación.

---

### DEBE
- El código debe tener como máximo 1 nivel de anidamiento.

### NO DEBE
- No debe haber bloques anidados más allá de 1 nivel.

### Ejemplos
- Cumple: función con un solo if o for anidado.
- No cumple: función con if dentro de otro if.

### Verificación
- **Método recomendado:** Manual/regex
- **Expresión regular:**
  - if.*\{[^}]*if
- **Línea de comando:**
  - grep -En "if.*\{[^}]*if" lib/*.dart
- **Notas:**
  - La verificación automática es limitada; se recomienda revisión manual complementaria.

---


← [Volver al inicio](../p.md)

# Regla 06 - Una clase por archivo

Cada archivo debe contener una sola clase pública.

---

### DEBE
- Un archivo debe tener solo una declaración de clase pública.

### NO DEBE
- No debe haber múltiples clases públicas en el mismo archivo.

### Ejemplos
- Cumple: archivo con una sola clase pública.
- No cumple: archivo con dos o más clases públicas.

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - ^class [A-Z][a-zA-Z0-9_]*
- **Línea de comando:**
  - grep -En "^class [A-Z][a-zA-Z0-9_]*" lib/*.dart
- **Notas:**
  - Contar ocurrencias por archivo; si hay más de una, no cumple.

---


← [Volver al inicio](../p.md)

# Regla 07 - Sin comentarios innecesarios

El código debe ser autoexplicativo y no debe tener comentarios innecesarios.

---

### DEBE
- Usar comentarios solo para documentación pública (`///`).

### NO DEBE
- No debe haber comentarios `//` salvo imports o doc comments.

### Ejemplos
- Cumple: código sin comentarios o solo con doc comments.
- No cumple: código con comentarios redundantes.

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - ^\s*//(?!/)
- **Línea de comando:**
  - grep -En "^\s*//(?!/)" lib/*.dart
- **Notas:**
  - La regex detecta comentarios que no son documentación pública.

---


← [Volver al inicio](../p.md)

# Regla 08 - Sin hardcoding

No debe haber valores sensibles o configuraciones hardcodeadas en el código fuente.

---

### DEBE
- Usar variables de entorno o archivos de configuración.

### NO DEBE
- Hardcodear claves, tokens, URLs, etc.

### Ejemplos
- Cumple: `final apiKey = AppConfig.apiKey;`
- No cumple: `final apiKey = '12345-abcde';`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - (['"][A-Za-z0-9]{6,}['"])
- **Línea de comando:**
  - grep -En "['\"][A-Za-z0-9]{6,}['\"]" lib/*.dart
- **Notas:**
  - Se recomienda revisión manual para casos complejos.

---


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


← [Volver al inicio](../p.md)

# Regla 12 - Logs en inglés, descriptivos y específicos

Todos los mensajes de log deben estar en inglés, ser claros y específicos, y evitar mensajes genéricos.

---

### DEBE
- Mensajes de log en inglés.
- Mensajes claros, específicos y descriptivos.

### NO DEBE
- Mensajes genéricos como "error", "failed", "something went wrong".
- Mensajes en español u otros idiomas.

### Ejemplos
- Cumple: `Logger.info('User created successfully')`
- No cumple: `Logger.info('Usuario creado')`, `Logger.error('error')`

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Se debe interpretar el mensaje para asegurar que sea claro, específico y en inglés. La verificación automática es limitada.

---


← [Volver al inicio](../p.md)

# Regla 13 - Logs encapsulados en métodos privados

Todos los llamados a Logger deben estar encapsulados en métodos privados (_log*), nunca llamados directamente desde métodos públicos.

---

### DEBE
- Encapsular cada log en un método privado.

### NO DEBE
- Llamar a Logger directamente fuera de métodos _log*.

### Ejemplos
- Cumple: `_logLoginSuccessful(userId)`
- No cumple: `Logger.info('Login successful', data: {'userId': userId})` en método público

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - Logger\.(info|error|debug)\s*\(
- **Línea de comando:**
  - grep -En "Logger\.(info|error|debug)\s*\(" lib/*.dart
- **Notas:**
  - Revisar que las llamadas directas solo estén en métodos _log*.

---


← [Volver al inicio](../p.md)

# Regla 14 - No logs en modelos, getters/setters simples ni orquestación

No se deben poner logs en modelos (Freezed), getters/setters simples ni métodos de orquestación.

---

### DEBE
- Loggear solo en métodos de lógica de negocio.

### NO DEBE
- Loggear en modelos (`@freezed`), getters/setters simples, métodos de orquestación.

### Ejemplos
- Cumple: log en método de lógica.
- No cumple: log en modelo, getter/setter simple, orquestador.

### Verificación
- **Método recomendado:** Expresión regular/manual
- **Expresión regular:**
  - @freezed.*\n[\s\S]*Logger
- **Línea de comando:**
  - grep -En "@freezed.*\n[\s\S]*Logger" lib/*.dart
- **Notas:**
  - Revisar manualmente orquestadores y getters/setters.

---


← [Volver al inicio](../p.md)

 
# Regla 15 - No loggear valores sensibles (se deben enmascarar)

Nunca se deben loggear contraseñas, tokens, API keys ni datos personales sensibles. Si es necesario loggear, se deben enmascarar (ejemplo: mostrar solo los últimos 4 caracteres).

---

### DEBE
- Excluir valores sensibles de los logs o enmascararlos si es necesario.

### NO DEBE
- Loggear passwords, tokens, API keys, datos personales sin enmascarar.

### Ejemplos
- Cumple: log sin datos sensibles o con datos enmascarados (ejemplo: `Logger.info('Token: ****1234')`)
- No cumple: `Logger.info('Login with password: $password')`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - password|token|api[_-]?key|card|tarjeta
- **Línea de comando:**
  - grep -Ein "password|token|api[_-]?key|card|tarjeta" lib/*.dart
- **Notas:**
  - Revisar que los datos loggeados no sean sensibles.

---


← [Volver al inicio](../p.md)

# Regla 16 - Usar Logger centralizado y niveles correctos

Se debe usar la clase Logger centralizada y los niveles de log correctos (info, debug, error).

---

### DEBE
- Usar Logger.info, Logger.debug, Logger.error.
- Usar debugPrint solo dentro de Logger.

### NO DEBE
- Usar debugPrint fuera de Logger.
- Usar Logger sin nivel adecuado.
- Incluir stacktrace en logs de info/debug (solo en error).

### Ejemplos
- Cumple: `Logger.error('Failed', error: e, stackTrace: stack)`
- No cumple: `debugPrint('error')` fuera de Logger

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - debugPrint\s*\(
- **Línea de comando:**
  - grep -En "debugPrint\s*\(" lib/*.dart
- **Notas:**
  - Revisar que debugPrint solo esté en Logger y que los niveles sean correctos.

---


← [Volver al inicio](../p.md)

# Regla 17 - Logs obligatorios en eventos clave y servicios externos

Se deben agregar logs al menos en: inicio de operación importante, fin exitoso, errores/excepciones, llamadas a servicios externos y transformaciones relevantes de datos. Los logs deben estar en inglés.

---

### DEBE
- Loggear inicio y fin de operaciones importantes.
- Loggear errores y excepciones.
- Loggear llamadas a servicios externos (API, Firebase, DB).
- Loggear transformaciones relevantes de datos.
- Todos los logs deben estar en inglés.

### NO DEBE
- Omitir logs en estos eventos clave.
- Loggear en español u otros idiomas.

### Ejemplos
- Cumple: log en inicio, fin, error, llamada externa, transformación.
- No cumple: no loggear en estos puntos, log en español.

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Revisar que todos los eventos clave estén loggeados y en inglés.

---


← [Volver al inicio](../p.md)

# Regla 18 - Estructura del mensaje de log: formato JSON

El mensaje de log debe tener estructura JSON o key-value pairs, nunca construirse a mano como string plano.

---

### DEBE
- Usar formato JSON o key-value pairs para los datos del log.
- Usar helper centralizado (Logger.info, Logger.error, Logger.debug).

### NO DEBE
- Construir el mensaje de log a mano como string plano.

### Ejemplos
- Cumple: `Logger.info('User created', data: {'id': userId, 'email': email})`
- No cumple: `Logger.info('User created: id=' + userId + ', email=' + email)`

### Verificación
- **Método recomendado:** Manual/inspección visual
- **Notas:**
  - Revisar que los datos del log estén estructurados y no concatenados manualmente.

---


← [Volver al inicio](../p.md)

# Regla 19 - Usar siempre interfaces para servicios externos

Toda integración con servicios externos debe tener una interfaz abstracta implementada por la clase concreta.

---

### DEBE
- Definir una interfaz (abstract class) para cada servicio externo.
- La implementación concreta debe usar `implements`.

### NO DEBE
- Usar clases concretas directamente sin interfaz.

### Ejemplos
- Cumple: `class AuthService implements IAuthService {}`
- No cumple: `class AuthService {}` sin interfaz

### Verificación
- **Método recomendado:** Expresión regular/manual
- **Expresión regular:**
  - implements I[A-Za-z]+Service
- **Línea de comando:**
  - grep -En "implements I[A-Za-z]+Service" lib/*_service.dart
- **Notas:**
  - Revisar que cada servicio tenga su interfaz y la implemente.

---


← [Volver al inicio](../p.md)

# Regla 20 - Todo consumo de API REST debe usar IHttpClient

Todas las llamadas a APIs REST deben realizarse a través de la interfaz IHttpClient, nunca directamente con Dio, http u otras librerías.

---

### DEBE
- Usar IHttpClient para todas las llamadas a APIs REST.
- IHttpClient debe manejar excepciones de red, timeout y parsing.

### NO DEBE
- Usar Dio, http, etc. directamente en servicios.

### Ejemplos
- Cumple: `final response = await _httpClient.post(...)`
- No cumple: `final response = await _dio.post(...)`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - _dio\.|http\.
- **Línea de comando:**
  - grep -En "_dio\.|http\." lib/*_service.dart
- **Notas:**
  - Revisar que solo se use IHttpClient en servicios.

---


← [Volver al inicio](../p.md)

# Regla 21 - Crear siempre un mock del servicio externo

Por cada servicio real debe existir un mock (archivo *_service_mock.dart o clase Mock*Service) junto al servicio real.

---

### DEBE
- Crear un mock para cada servicio externo.
- Ubicar el mock junto al servicio real.

### NO DEBE
- Omitir el mock de servicios externos.

### Ejemplos
- Cumple: `class MockAuthService implements IAuthService {}`
- No cumple: no existe mock para AuthService

### Verificación
- **Método recomendado:** Manual/expresión regular
- **Expresión regular:**
  - Mock[A-Za-z]+Service
- **Línea de comando:**
  - grep -En "Mock[A-Za-z]+Service" lib/*_service_mock.dart
- **Notas:**
  - Revisar que cada servicio tenga su mock correspondiente.

---


← [Volver al inicio](../p.md)

# Regla 22 - Variables de entorno en todos los archivos .env

Toda variable de entorno utilizada en servicios debe estar presente en todos los archivos .env (.env, .env.example, .env.development, .env.production).

---

### DEBE
- Incluir todas las variables de entorno necesarias en todos los archivos .env.

### NO DEBE
- Omitir variables en algún archivo .env.

### Ejemplos
- Cumple: variable API_BASE_URL presente en todos los .env
- No cumple: variable solo en uno o dos .env

### Verificación
- **Método recomendado:** Línea de comando
- **Línea de comando:**
  - grep "API_BASE_URL" .env*
- **Notas:**
  - Revisar que todas las variables estén en todos los archivos .env.

---


← [Volver al inicio](../p.md)

# Regla 23 - No instanciar clases concretas directamente en servicios externos

No se debe instanciar clases concretas de servicios externos directamente, siempre usar inyección de dependencias o ServiceLocator.

---

### DEBE
- Usar ServiceLocator o inyección de dependencias para instanciar servicios.

### NO DEBE
- Instanciar clases concretas con `new` o constructores directos.

### Ejemplos
- Cumple: `final service = ServiceLocator.get<IApiService>()`
- No cumple: `final service = ApiService()`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - new [A-Za-z]+Service|[A-Za-z]+Service\(
- **Línea de comando:**
  - grep -En "new [A-Za-z]+Service|[A-Za-z]+Service\(" lib/*_service.dart
- **Notas:**
  - Revisar que no se instancien clases concretas directamente.

---


← [Volver al inicio](../p.md)

# Regla 24 - No ignorar excepciones en servicios externos

No se deben ignorar excepciones (swallow exceptions) en servicios externos; siempre se debe loggear y/o relanzar la excepción.

---

### DEBE
- Loggear y/o relanzar excepciones capturadas.

### NO DEBE
- Usar bloques catch vacíos o sin logging.

### Ejemplos
- Cumple: `catch (e) { logger.error(e); rethrow; }`
- No cumple: `catch (e) {}`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - catch \(e\) \{\s*\}
- **Línea de comando:**
  - grep -En "catch \(e\) \{\s*\}" lib/*_service.dart
- **Notas:**
  - Revisar que todas las excepciones sean loggeadas o relanzadas.

---


← [Volver al inicio](../p.md)

# Regla 25 - No usar tipos genéricos para errores en servicios externos

No se deben lanzar excepciones genéricas (Exception), siempre usar tipos específicos (ApiException, NetworkException, etc.).

---

### DEBE
- Lanzar excepciones específicas para cada tipo de error.

### NO DEBE
- Lanzar `Exception()` genérico.

### Ejemplos
- Cumple: `throw ApiException('Invalid credentials')`
- No cumple: `throw Exception('Error')`

### Verificación
- **Método recomendado:** Expresión regular
- **Expresión regular:**
  - throw Exception\(
- **Línea de comando:**
  - grep -En "throw Exception\(" lib/*_service.dart
- **Notas:**
  - Revisar que se usen excepciones específicas.

---


← [Volver al inicio](../p.md)


# Regla 26 - Usar constantes para valores fijos y mágicos

Un valor mágico es cualquier número, string o literal usado directamente en el código cuyo significado no es evidente y que puede cambiar en el futuro (por ejemplo: 18, 120, 16, 'home', '/api/v1').

Ejemplo de valor mágico:
```dart
if (age > 18) // 18 es un valor mágico
```

Cada feature debe tener su propia clase de constantes llamada {Feature}Constants (por ejemplo: UserConstants, QuizConstants). Si una constante se utiliza en más de un feature, debe estar en core/constants.dart.

---

### DEBE
- Definir valores fijos y mágicos como constantes en la clase {Feature}Constants correspondiente.
- Si la constante es compartida, definirla en core/constants.dart.
- Usar constantes en vez de literales en el código.

### NO DEBE
- Usar números mágicos o strings literales repetidos directamente en el código.

### Ejemplos
- Cumple: `UserConstants.minimumAge`, `QuizConstants.maxQuestions`, `core/constants.dart: maxUsernameLength`
- No cumple: `if (age > 18)`, `SizedBox(height: 16)`, `Navigator.pushNamed(context, '/home')`

### Verificación
- **Método recomendado:** Expresión regular/línea de comando
- **Expresión regular:**
  - [^a-zA-Z_][0-9]{2,}[^a-zA-Z_]
- **Línea de comando:**
  - grep -rE "[^a-zA-Z_][0-9]{2,}[^a-zA-Z_]" lib/
- **Notas:**
  - Revisar que los valores estén definidos como constantes y no como literales.

---


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


← [Volver al inicio](../p.md)

# Regla 29 - Gestión y acceso seguro de variables de entorno

Esta regla integra y extiende los lineamientos de [env.md](../env.md), [Regla 08 - Sin hardcoding](Regla%2008%20-%20Sin%20hardcoding.md) y [Regla 22 - Variables de entorno en todos los archivos .env](Regla%2022%20-%20Variables%20de%20entorno%20en%20todos%20los%20archivos%20.env.md).

---

## DEBE
- Usar variables de entorno para toda configuración sensible, URLs, API keys, secrets, etc.
- Acceder a variables de entorno exclusivamente mediante `EnvHelper.getEnv()`.
- Centralizar la configuración de cada feature en su propia clase `{Feature}Config`.
- Validar la existencia de variables requeridas al inicio de cada feature.
- Incluir todas las variables en todos los archivos `.env`, `.env.example`, `.env.development`, `.env.production`.

## NO DEBE
- Usar `dotenv.env` directamente fuera de `EnvHelper`.
- Hardcodear valores sensibles, URLs, claves, tokens, etc. en el código fuente.
- Omitir variables en algún archivo `.env`.
- Usar métodos alternativos como `getOptional` o `getRequired`.

## Ejemplos
### Cumple
```dart
// shared/helper/env_helper.dart
abstract final class EnvHelper {
  static String getEnv(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) throw Exception('Falta $key');
    return value;
  }
}

// features/api/config/api_config.dart
abstract final class ApiConfig {
  static String get baseUrl => EnvHelper.getEnv('API_BASE_URL');
  static String get apiKey => EnvHelper.getEnv('API_KEY');
  static void validate() {
    EnvHelper.getEnv('API_BASE_URL');
    EnvHelper.getEnv('API_KEY');
  }
}
```

### No cumple
```dart
final apiKey = dotenv.env['API_KEY']; // ❌
final apiKey = '12345-abcde'; // ❌
```

## Verificación
- **Checklist:**
  - [ ] Variables presentes en todos los archivos .env
  - [ ] 0 usos de `dotenv.env` fuera de EnvHelper
  - [ ] Todas las configuraciones acceden por `{Feature}Config`
- **Comandos:**
  - `grep -r "dotenv.env\[" lib/ --exclude="env_helper.dart"`
  - `grep "API_BASE_URL" .env*`

## Excepciones
- Constantes técnicas (nombres de archivos internos, claves de JSON, etc.) pueden ir como literales si no cambian entre entornos.
- Textos de debug/logs pueden ser literales.

## Beneficios
- Seguridad y trazabilidad de configuración.
- Facilidad para cambiar entre entornos.
- Evita errores por variables faltantes.
- Facilita onboarding y mantenimiento.

## Migración
1. Crear/actualizar `EnvHelper`.
2. Crear clase `{Feature}Config` por feature.
3. Mover todos los accesos directos a variables de entorno a `{Feature}Config`.
4. Validar variables requeridas al inicio.
5. Verificar que todas las variables estén en todos los archivos `.env*`.

---

[Regla 08 - Sin hardcoding](Regla%2008%20-%20Sin%20hardcoding.md) | [Regla 22 - Variables de entorno en todos los archivos .env](Regla%2022%20-%20Variables%20de%20entorno%20en%20todos%20los%20archivos%20.env.md) | [env.md](../env.md)


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


← [Volver al inicio](../p.md)

# Regla 32 - Principio de Responsabilidad Única (SRP)

---


## DEBE
- Cada clase, función o módulo debe tener UNA Y SOLO UNA razón para cambiar.
- Si una clase tiene múltiples responsabilidades, extraer en clases separadas.

## NO DEBE
- Una clase no debe tener más de 3 métodos públicos (excluyendo constructores/getters/setters sin lógica).
- Una función no debe tener más de 10 instrucciones ejecutables.
- Una función no debe modificar estado y retornar valor simultáneamente.
- Usar nombres de clase genéricos o que indiquen múltiples responsabilidades (Manager, Handler, Helper, Utils, Common, AND).

## Ejemplo
```dart
// Cumple SRP
class UserRepository {
  User getUser(int id) { /* ... */ }
  void saveUser(User user) { /* ... */ }
}
// No cumple SRP
class UserManager { // hace muchas cosas }
```

## Verificación
- Pregunta: "¿Por qué cambiaría esta clase?" debe tener una sola respuesta.
- Contar métodos públicos y líneas por función.
- Buscar nombres prohibidos.

## Migración
1. Identificar clases con múltiples responsabilidades.
2. Dividir en clases/ficheros separados.
3. Refactorizar funciones largas o con doble propósito.

---

[srp.md](../srp.md)


← [Volver al inicio](../p.md)

# Regla 33 - Principio de Abierto/Cerrado (OCP)

---

## DEBE
- Las entidades deben estar abiertas para extensión pero cerradas para modificación.
- Usar interfaces/clases abstractas para definir contratos.
- Usar inyección de dependencias en lugar de instanciación directa.
- Usar patrones de diseño para extensibilidad (Strategy, Factory, Template Method).

## NO DEBE
- Modificar clases existentes para agregar funcionalidad.
- Usar switches o if-else largos para elegir comportamiento.
- Depender de clases concretas.

## Ejemplo
```dart
// Cumple OCP
abstract class PaymentMethod { void pay(); }
class Paypal implements PaymentMethod { void pay() { /* ... */ } }
class Stripe implements PaymentMethod { void pay() { /* ... */ } }
// No cumple OCP
class PaymentService { void pay(String type) { if (type == 'paypal') ... } }
```

## Verificación
- Nueva funcionalidad = nueva clase, no editar clase existente.
- Buscar dependencias de clases concretas y switches largos.

## Migración
1. Refactorizar dependencias a interfaces.
2. Extraer lógica extensible a nuevas clases.
3. Implementar patrones de diseño si aplica.

---

[ocp.md](../ocp.md)


← [Volver al inicio](../p.md)

# Regla 34 - Principio de Sustitución de Liskov (LSP)

---


## DEBE
- Los objetos de una subclase deben poder reemplazar objetos de la superclase sin romper la aplicación.
- Si override un método, debe aceptar todos los valores que la base acepta.

## NO DEBE
- Las subclases NO DEBEN lanzar excepciones nuevas no declaradas en la base.
- Las subclases NO DEBEN requerir validaciones adicionales no requeridas por la base.
- Las subclases NO DEBEN retornar null si la base nunca retorna null.
- Hacer subclases más restrictivas que la base.
- Violar el contrato definido por la base.
- Cambiar el comportamiento esperado de la base.

## Ejemplo
```dart
// Cumple LSP
class Animal { void speak() {} }
class Dog extends Animal { void speak() {} }
// No cumple LSP
class Cat extends Animal { void speak() { throw Exception(); } }
```

## Verificación
- Tests pasan con cualquier implementación de la interfaz/base.
- Revisar validaciones y excepciones en overrides.

## Migración
1. Revisar subclases y sus contratos.
2. Refactorizar para cumplir el contrato de la base.

---

[lsp.md](../lsp.md)


← [Volver al inicio](../p.md)

# Regla 35 - Principio de Segregación de Interfaces (ISP)

---

## DEBE
- Ningún cliente debe ser forzado a depender de métodos que no usa.
- Una interfaz NO DEBE tener más de 5 métodos.
- Preferir múltiples interfaces específicas sobre una interfaz general.
- Crear interfaces basadas en las necesidades del cliente.

## NO DEBE
- Crear interfaces "God" (monolíticas).
- Dejar métodos sin implementar.
- Forzar implementaciones a tener métodos innecesarios.

## Ejemplo
```dart
// Cumple ISP
abstract class Reader { void read(); }
abstract class Writer { void write(); }
// No cumple ISP
abstract class GodService { void read(); void write(); void validate(); void delete(); }
```

## Verificación
- Buscar interfaces con > 5 métodos.
- Buscar métodos vacíos o con UnimplementedError.

## Migración
1. Dividir interfaces grandes en específicas.
2. Eliminar métodos innecesarios.

---

[isp.md](../isp.md)


← [Volver al inicio](../p.md)

# Regla 36 - Principio de Inversión de Dependencias (DIP)

---

## DEBE
- Los módulos de alto nivel NO DEBEN importar módulos de bajo nivel directamente.
- Ambos deben depender de abstracciones (interfaces).
- Las clases de dominio NO DEBEN importar clases de infraestructura.
- Usar inyección de dependencias en constructores.

## NO DEBE
- Instanciar dependencias concretas dentro de clases.
- Depender de implementaciones concretas.
- Mezclar lógica de negocio con detalles de infraestructura.

## Ejemplo
```dart
// Cumple DIP
class MyService {
  final IUserRepository _repo;
  MyService(this._repo);
}
// No cumple DIP
class MyService {
  final UserRepository _repo = UserRepository();
}
```

## Verificación
- Buscar imports y dependencias concretas en clases de negocio.
- Revisar tipos de campos y parámetros.

## Migración
1. Refactorizar dependencias a interfaces.
2. Usar inyección de dependencias.

---

[dip.md](../dip.md)


← [Volver al inicio](../p.md)

# Regla 37 - KISS - Keep It Simple, Stupid

---

## DEBE
- La solución más simple que funciona es la mejor.
- Complejidad ciclomática ≤ 5 por función.
- Código legible sin necesidad de comentarios.

## NO DEBE
- Usar expresiones complejas anidadas.

## Ejemplo
```dart
// Cumple KISS
bool isAdult(int age) => age >= 18;
// No cumple KISS
bool canVote(int age, bool isCitizen) { if (age >= 18 && isCitizen) { ... } }
```

## Verificación
- Contar puntos de decisión por función.
- Revisar expresiones complejas.

## Migración
1. Refactorizar funciones complejas en pasos simples.
2. Usar nombres descriptivos y funciones pequeñas.

---

[kiss.md](../kiss.md)


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


