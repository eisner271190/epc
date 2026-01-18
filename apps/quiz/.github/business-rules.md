Crea una aplicación en Flutter que sea un generador de quizzes con las siguientes características:

1. Pantalla inicial (configuración del quiz):
   - Componente adecuado para escribir un tema.
   - Botón "Empezar".
   - Componente adecuado (Como los chat de chatgpt) para ver todos los temas consultados.
   - Botón con icono Configuración.
   - Botón con icono Modo Claro/Oscuro.

2. Pantalla Configuración del quiz:
   - Componente adecuado para seleccionar número de preguntas (por defecto 5, mínimo 5, máximo 50).
   - Componente adecuado para seleccionar cantidad de opciones de respuesta (por defecto 4, mínimo 2, máximo 5).
   - Componente adecuado para seleccionar idioma (por defecto Español).
   - Componente adecuado para configurar tiempo por pregunta (por defecto sin límite, mínimo 10 segundos, máximo 500 segundos).

3. Manejo de temas:
   - Guardar automáticamente los temas consultados.
   - Posibilidad de eliminar un tema previo de la lista.
   - No permitir temas duplicados.

4. Pantalla de preguntas:
   - Mostrar una sola pregunta a la vez.
   - Componente adecuado para Opciones de respuesta.
   - Al seleccionar una opción, avanzar automáticamente a la siguiente pregunta.
   - Barra de progreso visible (ejemplo: “Pregunta 3 de 10”).
   - Animaciones de transición entre preguntas.
   - Opción de modificar la respuesta de cada pregunta antes de finalizar.
   - Temporizador visible si se configuró tiempo.

5. Pantalla de resultados:
   - Mostrar cuántas respuestas fueron correctas e incorrectas.
   - Calcular y mostrar el porcentaje de acierto.
   - Mostrar la explicación de cada respuesta incorrecta.
   - Componente adecuado para "Repetir quiz", "Volver al inicio".

6. Generación de preguntas:
   - Las preguntas deben generarse dinámicamente usando IA (ejemplo: llamada a API).
   - Input esperado: tema, idioma, número de preguntas, número de opciones, tiempo.
   - Output esperado: lista de preguntas con sus opciones, respuesta correcta y explicación.

7. Interfaz:
   - Modo claro/oscuro seleccionable.
   - Diseño minimalista y responsivo.
   - Animaciones suaves en transiciones entre pantallas.
   - Contraste WCAG AA o AAA para todo el texto
   - Lectura cómoda en sesiones prolongadas
   - Jerarquía visual clara entre títulos, contenido y acciones
   - Consistencia visual entre modo claro y modo oscuro
   - Blanco Suave
   - Minimal White

8. Codificación
   - Clean Code
   - No hardcode
   - API Key en variable de entorno
   - Archivo .env
   - Url como variables de entorno
   - Prompt como variable de entorno
   - Mensajes de texto en un archivo
   - Cada clase en un archivo
   

Genera el código completo en Flutter siguiendo esta estructura.