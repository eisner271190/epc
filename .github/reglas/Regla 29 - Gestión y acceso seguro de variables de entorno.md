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
