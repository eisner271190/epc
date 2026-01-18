
# Instrucciones del Proyecto

## Proceso de automatización y cumplimiento de reglas

1. Leer las reglas en `.github/reglas`
2. Generar el archivo `CODE_REVIEW.md`
3. CODE_REVIEW.md debe tener un listado con las reglas que no se cumplen.
4. Iterar CODE_REVIEW.md y corregir una por una cada una de las reglas que no se cumplen.
5. Al finalizar, se debe volver al paso 1.
    - Si hay reglas que no se cumplen volver al paso 3.
    - Si no hay reglas incumplidas se finaliza.

---

**IMPORTANTE**: Se DEBEN verificar TODAS las reglas en .github/reglas.
Lista de reglas activas:

<!-- Este listado se genera automáticamente a partir de los archivos en .github/reglas -->

- [Regla 01 - Convenciones de nomenclatura](reglas/Regla%2001%20-%20Convenciones%20de%20nomenclatura.md)
- [Regla 02 - Clases ≤ 100 líneas](reglas/Regla%2002%20-%20Clases%20%E2%89%A4%20100%20l%C3%ADneas.md)
- [Regla 03 - Funciones ≤ 10 instrucciones](reglas/Regla%2003%20-%20Funciones%20%E2%89%A4%2010%20instrucciones.md)
- [Regla 04 - Máximo 2 parámetros por función](reglas/Regla%2004%20-%20M%C3%A1ximo%202%20par%C3%A1metros%20por%20funci%C3%B3n.md)
- [Regla 05 - Anidamiento máximo 1 nivel](reglas/Regla%2005%20-%20Anidamiento%20m%C3%A1ximo%201%20nivel.md)
- [Regla 06 - Una clase por archivo](reglas/Regla%2006%20-%20Una%20clase%20por%20archivo.md)
- [Regla 07 - Sin comentarios innecesarios](reglas/Regla%2007%20-%20Sin%20comentarios%20innecesarios.md)
- [Regla 08 - Sin hardcoding](reglas/Regla%2008%20-%20Sin%20hardcoding.md)
- [Regla 09 - Métodos de Orquestación](reglas/Regla%2009%20-%20M%C3%A9todos%20de%20Orquestaci%C3%B3n.md)
- [Regla 10 - Métodos de Implementación](reglas/Regla%2010%20-%20M%C3%A9todos%20de%20Implementaci%C3%B3n.md)
- [Regla 11 - Todo método de lógica debe tener logs](reglas/Regla%2011%20-%20Todo%20m%C3%A9todo%20de%20l%C3%B3gica%20debe%20tener%20logs.md)
- [Regla 12 - Logs en inglés, descriptivos y específicos](reglas/Regla%2012%20-%20Logs%20en%20ingl%C3%A9s%2C%20descriptivos%20y%20espec%C3%ADficos.md)
- [Regla 13 - Logs encapsulados en métodos privados](reglas/Regla%2013%20-%20Logs%20encapsulados%20en%20m%C3%A9todos%20privados.md)
- [Regla 14 - No logs en modelos, getters, orquestación](reglas/Regla%2014%20-%20No%20logs%20en%20modelos%2C%20getters%2C%20orquestaci%C3%B3n.md)
- [Regla 15 - No loggear valores sensibles](reglas/Regla%2015%20-%20No%20loggear%20valores%20sensibles.md)
- [Regla 16 - Usar Logger centralizado y niveles correctos](reglas/Regla%2016%20-%20Usar%20Logger%20centralizado%20y%20niveles%20correctos.md)
- [Regla 17 - Logs obligatorios en eventos clave y servicios externos](reglas/Regla%2017%20-%20Logs%20obligatorios%20en%20eventos%20clave%20y%20servicios%20externos.md)
- [Regla 18 - Estructura del mensaje de log formato JSON](reglas/Regla%2018%20-%20Estructura%20del%20mensaje%20de%20log%20formato%20JSON.md)
- [Regla 19 - Usar siempre interfaces para servicios externos](reglas/Regla%2019%20-%20Usar%20siempre%20interfaces%20para%20servicios%20externos.md)
- [Regla 20 - Todo consumo de API REST debe usar IHttpClient](reglas/Regla%2020%20-%20Todo%20consumo%20de%20API%20REST%20debe%20usar%20IHttpClient.md)
- [Regla 21 - Crear siempre un mock del servicio externo](reglas/Regla%2021%20-%20Crear%20siempre%20un%20mock%20del%20servicio%20externo.md)
- [Regla 22 - Variables de entorno en todos los archivos .env](reglas/Regla%2022%20-%20Variables%20de%20entorno%20en%20todos%20los%20archivos%20.env.md)
- [Regla 23 - No instanciar clases concretas directamente en servicios externos](reglas/Regla%2023%20-%20No%20instanciar%20clases%20concretas%20directamente%20en%20servicios%20externos.md)
- [Regla 24 - No ignorar excepciones en servicios externos](reglas/Regla%2024%20-%20No%20ignorar%20excepciones%20en%20servicios%20externos.md)
- [Regla 25 - No usar tipos genéricos para errores en servicios externos](reglas/Regla%2025%20-%20No%20usar%20tipos%20gen%C3%A9ricos%20para%20errores%20en%20servicios%20externos.md)
- [Regla 26 - Usar constantes para valores fijos y mágicos](reglas/Regla%2026%20-%20Usar%20constantes%20para%20valores%20fijos%20y%20m%C3%A1gicos.md)
- [Regla 27 - Textos de UI deben estar en i18n](reglas/Regla%2027%20-%20Textos%20de%20UI%20deben%20estar%20en%20i18n.md)
- [Regla 28 - Rutas de navegación y archivos como constantes](reglas/Regla%2028%20-%20Rutas%20de%20navegaci%C3%B3n%20y%20archivos%20como%20constantes.md)
- [Regla 29 - Gestión y acceso seguro de variables de entorno](reglas/Regla%2029%20-%20Gesti%C3%B3n%20y%20acceso%20seguro%20de%20variables%20de%20entorno.md)
- [Regla 30 - Centralización y tipado de rutas de navegación](reglas/Regla%2030%20-%20Centralizaci%C3%B3n%20y%20tipado%20de%20rutas%20de%20navegaci%C3%B3n.md)
- [Regla 31 - Buenas prácticas en Flutter](reglas/Regla%2031%20-%20Buenas%20pr%C3%A1cticas%20en%20Flutter.md)
- [Regla 32 - Principio de Responsabilidad Única (SRP)](reglas/Regla%2032%20-%20Principio%20de%20Responsabilidad%20%C3%9Anica%20%28SRP%29.md)
- [Regla 33 - Principio de Abierto-Cerrado (OCP)](reglas/Regla%2033%20-%20Principio%20de%20Abierto-Cerrado%20%28OCP%29.md)
- [Regla 34 - Principio de Sustitución de Liskov (LSP)](reglas/Regla%2034%20-%20Principio%20de%20Sustituci%C3%B3n%20de%20Liskov%20%28LSP%29.md)
- [Regla 35 - Principio de Segregación de Interfaces (ISP)](reglas/Regla%2035%20-%20Principio%20de%20Segregaci%C3%B3n%20de%20Interfaces%20%28ISP%29.md)
- [Regla 36 - Principio de Inversión de Dependencias (DIP)](reglas/Regla%2036%20-%20Principio%20de%20Inversi%C3%B3n%20de%20Dependencias%20%28DIP%29.md)
- [Regla 37 - KISS - Keep It Simple, Stupid](reglas/Regla%2037%20-%20KISS%20-%20Keep%20It%20Simple%2C%20Stupid.md)
- [Regla 38 - DRY - Don't Repeat Yourself](reglas/Regla%2038%20-%20DRY%20-%20Don%27t%20Repeat%20Yourself.md)
- [Regla 39 - Fail Fast (Fallar Rápido)](reglas/Regla%2039%20-%20Fail%20Fast%20%28Fallar%20R%C3%A1pido%29.md)