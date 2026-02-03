# EPC - Quiz Generator

Un monorepo Flutter modular para una aplicación de generación de quizzes impulsada por IA.

## 📋 Descripción

EPC es un proyecto Flutter organizado como monorepo que proporciona una aplicación de generación de quizzes con integración de inteligencia artificial. El proyecto está estructurado en múltiples paquetes reutilizables que facilitan el mantenimiento y escalabilidad.

## 🏗️ Arquitectura

Este proyecto utiliza **Melos** para gestionar el monorepo y sigue principios de arquitectura limpia con separación de responsabilidades.

### Estructura del Proyecto

```
epc/
├── apps/
│   └── quiz/              # Aplicación principal de Quiz Generator
├── packages/
│   ├── core/             # Lógica compartida y utilidades
│   ├── ai/               # Integraciones y estrategias de IA
│   └── monetization/     # Módulo de monetización (ads, compras)
└── melos.yaml            # Configuración del workspace
```

## 📦 Paquetes

### **quiz_generator** (apps/quiz)
Aplicación principal Flutter que implementa:
- Generación de quizzes con IA
- Internacionalización (i18n) en múltiples idiomas
- Temas personalizables (Material Design 3, ChatGPT style)
- Autenticación y almacenamiento seguro
- Deep linking y manejo de URLs

**Versión:** 1.0.1+3

### **core** (packages/core)
Paquete compartido que contiene:
- Lógica y utilidades comunes
- Configuración de variables de entorno
- Utilidades de serialización (Freezed, JSON)

**Versión:** 0.0.1

### **ai** (packages/ai)
Módulo especializado en:
- Integraciones con servicios de IA
- Estrategias y patrones para generación de contenido

**Versión:** 0.0.1

### **monetization** (packages/monetization)
Gestión de monetización:
- Google Mobile Ads
- Compras in-app (RevenueCat)
- Gestión de suscripciones

**Versión:** 1.0.0+1

## 🚀 Inicio Rápido

### Requisitos Previos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) ^3.9.2
- [Dart SDK](https://dart.dev/get-dart) ^3.10.7
- [Melos](https://melos.invertase.dev/) ^7.3.0

### Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/eisner271190/epc.git
   cd epc
   ```

2. **Instalar Melos globalmente:**
   ```bash
   dart pub global activate melos
   ```

3. **Bootstrap del workspace:**
   ```bash
   melos bootstrap
   ```
   Esto instalará todas las dependencias en todos los paquetes y aplicaciones.

### Configuración de Variables de Entorno

El proyecto utiliza archivos `.env` para gestionar configuraciones:

1. **Para la aplicación Quiz:**
   - Crear archivo `apps/quiz/assets/.env.mock` (entorno mock)
   - Crear archivo `apps/quiz/assets/.env.dev` (entorno desarrollo)

2. **Para monetización:**
   - Crear archivo `packages/monetization/assets/.env`

Ejemplo de variables necesarias:
```env
# APIs de IA
API_KEY=tu_api_key
API_URL=https://api.ejemplo.com

# Configuración de monetización
REVENUE_CAT_API_KEY=tu_revenue_cat_key
ADMOB_APP_ID=tu_admob_id
```

## 🛠️ Comandos Disponibles

### Comandos con Melos

**Ejecutar la aplicación en Chrome:**
```bash
melos run:quiz:chrome
```

**Ejecutar la aplicación en dispositivo móvil:**
```bash
melos run:quiz:mobile
```

### Comandos Generales

**Listar todos los paquetes:**
```bash
melos list
```

**Ejecutar tests en todos los paquetes:**
```bash
melos run test
```

**Limpiar todos los paquetes:**
```bash
melos clean
```

**Obtener dependencias en todos los paquetes:**
```bash
melos bootstrap
```

## 🔧 Desarrollo

### Estructura de Features

La aplicación quiz sigue una arquitectura basada en features:
```
apps/quiz/lib/
├── features/          # Funcionalidades modulares
├── core/             # Configuración y servicios base
├── config/           # Temas y configuraciones UI
├── l10n/             # Archivos de internacionalización
├── providers/        # State management (Provider)
├── shared/           # Widgets y utilidades compartidas
└── main.dart         # Entry point
```

### Internacionalización

El proyecto soporta múltiples idiomas:
- Español (es)
- Inglés (en)

Los archivos de traducción se encuentran en `apps/quiz/lib/l10n/`.

### Temas

La aplicación incluye múltiples estrategias de tema:
- **Material Design 3** (light/dark)
- **ChatGPT Style** (light/dark)

## 🧪 Testing

```bash
# Ejecutar tests en un paquete específico
cd packages/core
flutter test

# Ejecutar tests en la aplicación
cd apps/quiz
flutter test
```

## 📱 Ejecutar la Aplicación

### Web (Chrome)
```bash
cd apps/quiz
flutter run -d chrome --debug --web-port=5000
```

### Android/iOS
```bash
cd apps/quiz
flutter run
```

## 🤝 Contribución

1. Fork del proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit de tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📝 Tareas Pendientes

Ver [todo.md](./todo.md) para la lista de tareas pendientes.

## 📄 Licencia

Este proyecto es privado y no está publicado en pub.dev.

## 👥 Autor

**Eisner** - [eisner271190](https://github.com/eisner271190)

## 🔗 Enlaces Útiles

- [Documentación de Flutter](https://flutter.dev/docs)
- [Documentación de Melos](https://melos.invertase.dev/)
- [Provider State Management](https://pub.dev/packages/provider)
- [Freezed Code Generation](https://pub.dev/packages/freezed)
