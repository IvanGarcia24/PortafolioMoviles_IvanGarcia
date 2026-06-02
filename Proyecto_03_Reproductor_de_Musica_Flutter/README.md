# 🎵 Mini Reproductor de Música en Flutter

<div align="center">

### Proyecto 3 — Reproductor Multimedia con Programación Reactiva

Aplicación móvil desarrollada con Flutter que permite reproducir archivos de audio locales mediante una interfaz moderna e interactiva.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge\&logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge\&logo=dart\&logoColor=white)
![Just Audio](https://img.shields.io/badge/just_audio-Audio_Player-orange?style=for-the-badge)
![RxDart](https://img.shields.io/badge/RxDart-Reactive_Programming-purple?style=for-the-badge)

<br>

⭐ Reproducción multimedia local
🎧 Barra de progreso sincronizada en tiempo real
⚡ Programación reactiva mediante Streams
📱 Interfaz desarrollada completamente en Flutter

</div>

---

## 📌 1. Nombre del Proyecto

**Mini Reproductor de Música en Flutter**

Aplicación móvil desarrollada para simular el funcionamiento básico de un reproductor de música, incorporando controles multimedia, visualización de portada y seguimiento dinámico del progreso de reproducción.

---

## 🎯 2. Objetivo del Proyecto

Desarrollar una aplicación móvil utilizando Flutter y Dart que permita reproducir archivos de audio locales mediante una interfaz intuitiva y dinámica.

El proyecto tiene como propósito implementar conceptos fundamentales del desarrollo móvil moderno, incluyendo programación reactiva, gestión de estado y sincronización de componentes visuales con procesos ejecutados en segundo plano.

---

## 🛠️ 3. Problema que Resuelve

Uno de los desafíos más comunes en aplicaciones multimedia es mantener sincronizada la interfaz gráfica con el estado real del reproductor de audio.

Este proyecto resuelve dicho problema mediante el uso de Streams que permiten actualizar automáticamente:

* La posición actual de reproducción.
* La duración total de la canción.
* La barra de progreso.
* El estado de reproducción (Play/Pause).

De esta manera, la aplicación permanece fluida y responsiva sin bloquear la experiencia del usuario.

---

## 💻 4. Tecnologías Utilizadas

| Tecnología               | Uso                                            |
| ------------------------ | ---------------------------------------------- |
| Flutter                  | Desarrollo de la interfaz móvil                |
| Dart                     | Lógica de programación                         |
| just_audio               | Reproducción y control de audio                |
| RxDart                   | Programación reactiva y combinación de Streams |
| Cupertino Icons          | Iconografía multimedia                         |
| Android Studio / VS Code | Desarrollo y pruebas                           |

---

## 🧠 5. Conceptos Aplicados

### 📌 Gestión de Estado

Uso de StatefulWidget para actualizar dinámicamente la interfaz en función de las acciones realizadas por el usuario.

### 📌 Programación Reactiva

Implementación de Streams para recibir actualizaciones constantes sobre la reproducción del audio.

### 📌 StreamBuilder

Reconstrucción automática de componentes específicos de la interfaz cuando cambia la información recibida por un Stream.

### 📌 Manejo de Assets

Configuración y utilización de recursos locales mediante el archivo `pubspec.yaml`.

### 📌 Reproducción Multimedia

Control de reproducción, pausa y desplazamiento dentro de una pista de audio utilizando el paquete `just_audio`.

### 📌 Arquitectura Modular

Separación del código en diferentes archivos para mejorar la organización, mantenimiento y escalabilidad del proyecto.

---

## ✨ Funcionalidades Implementadas

* ✅ Reproducción de archivos MP3 locales.
* ✅ Botón de reproducción y pausa.
* ✅ Barra de progreso dinámica.
* ✅ Visualización del tiempo actual y duración total.
* ✅ Actualización automática en tiempo real.
* ✅ Carátula del álbum.
* ✅ Interfaz responsiva.

---

## 📂 Estructura General del Proyecto

```text
lib/
│
├── main.dart
├── music_player_screen.dart
├── seek_bar.dart
└── position_data.dart
```

---

## 📸 6. Capturas de Pantalla

### Pantalla Inicial

<div align="center">
<img src="capturas/app_inicio.png" width="280">
</div>

<p align="center">
Interfaz inicial del reproductor antes de iniciar la reproducción.
</p>

---

### Reproducción en Curso

<div align="center">
<img src="capturas/app_reproduciendo.png" width="280">
</div>

<p align="center">
Estado de la aplicación mientras se reproduce el archivo de audio.
</p>

---

### Comparativa General

<div align="center">

| Pantalla Inicial                                | Reproducción Activa                                    |
| ----------------------------------------------- | ------------------------------------------------------ |
| <img src="capturas/app_inicio.png" width="250"> | <img src="capturas/app_reproduciendo.png" width="250"> |

</div>

---

## 🚀 7. Instrucciones de Ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/IvanGarcia24/PortafolioMoviles_IvanGarcia.git
```

### 2. Acceder al proyecto

```bash
cd Proyecto_03_Reproductor_de_Musica_Flutter/codigo/reproductor musical
```

### 3. Instalar dependencias

```bash
flutter pub get
```

### 4. Ejecutar la aplicación

```bash
flutter run
```

### 5. Verificar Assets

Asegurarse de que los archivos de audio e imágenes estén registrados correctamente dentro del archivo:

```yaml
pubspec.yaml
```

---

## 📊 Resumen del Proyecto

| Característica        | Valor      |
| --------------------- | ---------- |
| Plataforma            | Android    |
| Framework             | Flutter    |
| Lenguaje              | Dart       |
| Tipo de Aplicación    | Multimedia |
| Audio                 | Local      |
| Programación Reactiva | Sí         |
| Arquitectura          | Modular    |
| Estado                | Finalizado |

---

## 💭 8. Reflexión Personal

### ¿Qué aprendí?

Durante el desarrollo de este proyecto aprendí a integrar reproducción multimedia dentro de una aplicación Flutter utilizando paquetes externos. También reforcé mis conocimientos sobre programación reactiva mediante Streams y comprendí cómo mantener sincronizada la interfaz gráfica con procesos que se ejecutan continuamente en segundo plano.

Además, aprendí a organizar mejor el código mediante una estructura modular, facilitando su mantenimiento y reutilización.

---

### ¿Qué fue difícil?

La parte más compleja fue comprender cómo funcionan los Streams y cómo combinar múltiples fuentes de información para actualizar correctamente la barra de progreso y los tiempos de reproducción.

También representó un reto sincronizar los componentes visuales con el estado real del reproductor de audio sin afectar el rendimiento de la aplicación.

---

### ¿Qué mejoraría?

Como mejoras futuras implementaría funcionalidades adicionales como:

* Lista de reproducción.
* Control de volumen.
* Reproducción en segundo plano.
* Notificaciones multimedia.
* Selección dinámica de canciones.
* Diseño visual más moderno y personalizable.

Estas características permitirían transformar el proyecto en un reproductor de música más completo y cercano a aplicaciones reales del mercado.

---

<div align="center">

### 🎵 Proyecto desarrollado con Flutter y Dart

**Portafolio de Desarrollo Móvil**

</div>
