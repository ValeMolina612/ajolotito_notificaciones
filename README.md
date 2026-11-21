# Ajolotito Notificaciones

Aplicación Flutter desarrollada con TDD. Controla el hambre de una mascota virtual y programa avisos locales responsables, con horario silencioso, categorías configurables y permisos solicitados en contexto.

## Funciones

- Ajolotito con nivel de hambre y estado de ánimo.
- Alimentación persistente con `SharedPreferences`.
- Avisos locales nativos en Android, sin API ni servidor.
- Horario tranquilo de 22:00 a 08:00 y máximo dos avisos diarios.
- Permiso explicado antes del diálogo del sistema.
- Categorías configurables y payload validado.

## Ejecutar

```powershell
flutter pub get
flutter test
flutter emulators --launch medium_phone
flutter run -d emulator-5554
```

No se necesita llave de API. En Android 13 o superior acepta el permiso cuando la app lo solicite.

## Pruebas y fases TDD

La suite contiene 17 verificaciones automatizadas. Cada ronda documenta rojo, verde y refactor con capturas reales de Visual Studio Code y la cuenta `ValeMolina612 (GitHub)`.

### Ronda 1: Preparación del proyecto

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 1 rojo](docs/capturas/ronda-01-rojo.png) | ![Ronda 1 verde](docs/capturas/ronda-01-verde.png) | ![Ronda 1 refactor](docs/capturas/ronda-01-refactor.png) |

### Ronda 2: Reloj y mascota

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 2 rojo](docs/capturas/ronda-02-rojo.png) | ![Ronda 2 verde](docs/capturas/ronda-02-verde.png) | ![Ronda 2 refactor](docs/capturas/ronda-02-refactor.png) |

### Ronda 3: Categorías, canales y mensajes

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 3 rojo](docs/capturas/ronda-03-rojo.png) | ![Ronda 3 verde](docs/capturas/ronda-03-verde.png) | ![Ronda 3 refactor](docs/capturas/ronda-03-refactor.png) |

### Ronda 4: Política de horario silencioso

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 4 rojo](docs/capturas/ronda-04-rojo.png) | ![Ronda 4 verde](docs/capturas/ronda-04-verde.png) | ![Ronda 4 refactor](docs/capturas/ronda-04-refactor.png) |

### Ronda 5: Payload seguro

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 5 rojo](docs/capturas/ronda-05-rojo.png) | ![Ronda 5 verde](docs/capturas/ronda-05-verde.png) | ![Ronda 5 refactor](docs/capturas/ronda-05-refactor.png) |

### Ronda 6: Planificador

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 6 rojo](docs/capturas/ronda-06-rojo.png) | ![Ronda 6 verde](docs/capturas/ronda-06-verde.png) | ![Ronda 6 refactor](docs/capturas/ronda-06-refactor.png) |

### Ronda 7: Puerto y dobles de prueba

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 7 rojo](docs/capturas/ronda-07-rojo.png) | ![Ronda 7 verde](docs/capturas/ronda-07-verde.png) | ![Ronda 7 refactor](docs/capturas/ronda-07-refactor.png) |

### Ronda 8: Permiso responsable

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 8 rojo](docs/capturas/ronda-08-rojo.png) | ![Ronda 8 verde](docs/capturas/ronda-08-verde.png) | ![Ronda 8 refactor](docs/capturas/ronda-08-refactor.png) |

### Ronda 9: Servicio y sincronización

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 9 rojo](docs/capturas/ronda-09-rojo.png) | ![Ronda 9 verde](docs/capturas/ronda-09-verde.png) | ![Ronda 9 refactor](docs/capturas/ronda-09-refactor.png) |

### Ronda 10: Adaptador Android real

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 10 rojo](docs/capturas/ronda-10-rojo.png) | ![Ronda 10 verde](docs/capturas/ronda-10-verde.png) | ![Ronda 10 refactor](docs/capturas/ronda-10-refactor.png) |

### Ronda 11: ViewModel y pantallas

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 11 rojo](docs/capturas/ronda-11-rojo.png) | ![Ronda 11 verde](docs/capturas/ronda-11-verde.png) | ![Ronda 11 refactor](docs/capturas/ronda-11-refactor.png) |

### Ronda 12: Ejecución en Android

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 12 rojo](docs/capturas/ronda-12-rojo.png) | ![Ronda 12 verde](docs/capturas/ronda-12-verde.png) | ![Ronda 12 refactor](docs/capturas/ronda-12-refactor.png) |

### Ronda 13: Diseño extensible para push remoto

| 🔴 Rojo | 🟢 Verde | 🔵 Refactor |
|---|---|---|
| ![Ronda 13 rojo](docs/capturas/ronda-13-rojo.png) | ![Ronda 13 verde](docs/capturas/ronda-13-verde.png) | ![Ronda 13 refactor](docs/capturas/ronda-13-refactor.png) |

## APK

```powershell
flutter build apk --debug
```

Salida: `build/app/outputs/flutter-apk/app-debug.apk`.

