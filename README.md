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

La suite contiene 17 verificaciones automatizadas. Las capturas están recortadas para mostrar claramente la terminal y se presentan una debajo de otra.

### Ronda 1: Preparación del proyecto

#### 🔴 Fase roja

![Ronda 1 fase roja](docs/capturas/ronda-01-rojo.png)

#### 🟢 Fase verde

![Ronda 1 fase verde](docs/capturas/ronda-01-verde.png)

#### 🔵 Refactor

![Ronda 1 refactor](docs/capturas/ronda-01-refactor.png)

---

### Ronda 2: Reloj y mascota

#### 🔴 Fase roja

![Ronda 2 fase roja](docs/capturas/ronda-02-rojo.png)

#### 🟢 Fase verde

![Ronda 2 fase verde](docs/capturas/ronda-02-verde.png)

#### 🔵 Refactor

![Ronda 2 refactor](docs/capturas/ronda-02-refactor.png)

---

### Ronda 3: Categorías, canales y mensajes

#### 🔴 Fase roja

![Ronda 3 fase roja](docs/capturas/ronda-03-rojo.png)

#### 🟢 Fase verde

![Ronda 3 fase verde](docs/capturas/ronda-03-verde.png)

#### 🔵 Refactor

![Ronda 3 refactor](docs/capturas/ronda-03-refactor.png)

---

### Ronda 4: Política de horario silencioso

#### 🔴 Fase roja

![Ronda 4 fase roja](docs/capturas/ronda-04-rojo.png)

#### 🟢 Fase verde

![Ronda 4 fase verde](docs/capturas/ronda-04-verde.png)

#### 🔵 Refactor

![Ronda 4 refactor](docs/capturas/ronda-04-refactor.png)

---

### Ronda 5: Payload seguro

#### 🔴 Fase roja

![Ronda 5 fase roja](docs/capturas/ronda-05-rojo.png)

#### 🟢 Fase verde

![Ronda 5 fase verde](docs/capturas/ronda-05-verde.png)

#### 🔵 Refactor

![Ronda 5 refactor](docs/capturas/ronda-05-refactor.png)

---

### Ronda 6: Planificador

#### 🔴 Fase roja

![Ronda 6 fase roja](docs/capturas/ronda-06-rojo.png)

#### 🟢 Fase verde

![Ronda 6 fase verde](docs/capturas/ronda-06-verde.png)

#### 🔵 Refactor

![Ronda 6 refactor](docs/capturas/ronda-06-refactor.png)

---

### Ronda 7: Puerto y dobles de prueba

#### 🔴 Fase roja

![Ronda 7 fase roja](docs/capturas/ronda-07-rojo.png)

#### 🟢 Fase verde

![Ronda 7 fase verde](docs/capturas/ronda-07-verde.png)

#### 🔵 Refactor

![Ronda 7 refactor](docs/capturas/ronda-07-refactor.png)

---

### Ronda 8: Permiso responsable

#### 🔴 Fase roja

![Ronda 8 fase roja](docs/capturas/ronda-08-rojo.png)

#### 🟢 Fase verde

![Ronda 8 fase verde](docs/capturas/ronda-08-verde.png)

#### 🔵 Refactor

![Ronda 8 refactor](docs/capturas/ronda-08-refactor.png)

---

### Ronda 9: Servicio y sincronización

#### 🔴 Fase roja

![Ronda 9 fase roja](docs/capturas/ronda-09-rojo.png)

#### 🟢 Fase verde

![Ronda 9 fase verde](docs/capturas/ronda-09-verde.png)

#### 🔵 Refactor

![Ronda 9 refactor](docs/capturas/ronda-09-refactor.png)

---

### Ronda 10: Adaptador Android real

#### 🔴 Fase roja

![Ronda 10 fase roja](docs/capturas/ronda-10-rojo.png)

#### 🟢 Fase verde

![Ronda 10 fase verde](docs/capturas/ronda-10-verde.png)

#### 🔵 Refactor

![Ronda 10 refactor](docs/capturas/ronda-10-refactor.png)

---

### Ronda 11: ViewModel y pantallas

#### 🔴 Fase roja

![Ronda 11 fase roja](docs/capturas/ronda-11-rojo.png)

#### 🟢 Fase verde

![Ronda 11 fase verde](docs/capturas/ronda-11-verde.png)

#### 🔵 Refactor

![Ronda 11 refactor](docs/capturas/ronda-11-refactor.png)

---

### Ronda 12: Ejecución en Android

#### 🔴 Fase roja

![Ronda 12 fase roja](docs/capturas/ronda-12-rojo.png)

#### 🟢 Fase verde

![Ronda 12 fase verde](docs/capturas/ronda-12-verde.png)

#### 🔵 Refactor

![Ronda 12 refactor](docs/capturas/ronda-12-refactor.png)

---

### Ronda 13: Diseño extensible para push remoto

#### 🔴 Fase roja

![Ronda 13 fase roja](docs/capturas/ronda-13-rojo.png)

#### 🟢 Fase verde

![Ronda 13 fase verde](docs/capturas/ronda-13-verde.png)

#### 🔵 Refactor

![Ronda 13 refactor](docs/capturas/ronda-13-refactor.png)

---

## APK

```powershell
flutter build apk --debug
```

Salida: `build/app/outputs/flutter-apk/app-debug.apk`.

