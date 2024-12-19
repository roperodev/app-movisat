App Movisat

Una aplicación básica de Flutter con las siguientes características:

- Mapa interactivo: Utiliza Flutter Map para mostrar un mapa y permite agregar y eliminar marcadores.
- Persistencia local: Almacena y carga marcadores dinámicamente utilizando SQLite.
- Manejo de estado: Implementación de Provider para gestionar el estado de la aplicación.
- Pruebas unitarias: Verifica las operaciones clave de la aplicación.

📋 Requisitos

Asegúrate de tener instalados los siguientes programas y herramientas antes de empezar:

- Flutter SDK (versión estable)
- Android Studio o Visual Studio Code (como entorno de desarrollo)
- Emulador de Android/iOS o un dispositivo físico conectado

🚀 Instalación y Configuración

Clona este repositorio:

git clone https://github.com/roperodev/app-movisat.git
cd app-movisat

Instala las dependencias:

flutter pub get

Configura SQLite (opcional):
SQLite no necesita configuraciones adicionales. Solo asegúrate de que las dependencias necesarias estén incluidas en pubspec.yaml.

Ejecuta la aplicación:


flutter run

🗺️ Características

Mapa Interactivo:

- Muestra un mapa utilizando el paquete flutter_map.

Permite:

- Agregar marcadores: Toca en cualquier parte del mapa para agregar un marcador.
- Eliminar marcadores: Mantén presionado un marcador para eliminarlo.

Persistencia Local:

- Los marcadores se almacenan en SQLite para asegurar la persistencia entre sesiones.
- Al iniciar la aplicación, los marcadores se cargan automáticamente desde la base de datos.

Manejo de Estado:

- La app utiliza Provider para actualizar dinámicamente el mapa cada vez que se realiza una operación (agregar o eliminar marcadores).

Pruebas Unitarias:

- Las pruebas unitarias verifican:
- La adición y eliminación de marcadores.
- La carga de datos desde SQLite.

Para ejecutar las pruebas:

flutter test

🔧 Dependencias Principales

flutter_map: Para mostrar el mapa interactivo.

sqflite: Para manejar la persistencia local con SQLite.

provider: Para el manejo del estado.

latlong2: Para trabajar con coordenadas geográficas.

🤍 Estructura del Proyecto

La estructura principal de la app es la siguiente:

lib/
├── main.dart                # Entrada principal de la app
├── map/
│   ├── map_provider.dart    # Lógica de manejo de estado con Provider
│   ├── map_screen.dart      # Interfaz de usuario para el mapa
├── database/
│   └── database_helper.dart # Clase para interactuar con SQLite
test/
├── map_provider_test.dart   # Pruebas unitarias para MapProvider

📞 Contacto

Correo electrónico: josemariaroperohinojosa@gmail.com
GitHub: roperodev