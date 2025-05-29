# README - Proyecto Flutter con API de Spotify

## Descripción

Este proyecto Flutter permite buscar artistas, álbumes y canciones usando la API pública de Spotify.
Utiliza el flujo **Client Credentials** para obtener un token de acceso que permite consultar la API sin necesidad de un usuario autenticado.

---

## Requisitos previos

* Tener Flutter instalado y configurado en tu máquina
  [Guía oficial para instalar Flutter](https://docs.flutter.dev/get-started/install)

* Tener una cuenta en [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications) para obtener tus credenciales

---

## Cómo ejecutar el proyecto

1. **Clonar el repositorio**

```bash
git clone https://github.com/tuusuario/tu-proyecto-flutter.git
cd tu-proyecto-flutter
```

2. **Instalar dependencias**

```bash
flutter pub get
```

3. **Configurar token de Spotify**

Para consumir la API de Spotify necesitas un **token de acceso válido** generado mediante las credenciales de cliente.

### Obtener `client_id` y `client_secret`

1. Entra a [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications)
2. Inicia sesión con tu cuenta Spotify o crea una si no tienes
3. Crea una nueva aplicación ("Create an App")
4. Copia el `Client ID` y `Client Secret` que te proporciona Spotify

### Generar token de acceso

Ejecuta este comando en tu terminal (reemplaza los valores con tus credenciales):

```bash
curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=TU_CLIENT_ID&client_secret=TU_CLIENT_SECRET"
```

Obtendrás una respuesta con un JSON que incluye:

```json
{
  "access_token": "TOKEN_GENERADO",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

Copia el valor de `"access_token"`.

---

4. **Actualizar el token en el proyecto**

Dentro de la carpeta `sources` (o donde esté el archivo que gestiona el token), busca el archivo:

```
source/spotify_remote_datasource.dart
```

Y actualiza la variable o constante que contiene el token:

```dart
const String spotifyAccessToken = "TOKEN_GENERADO";
```

> **Nota:** Este token expira en aproximadamente 1 hora, por lo que deberás repetir este proceso para obtener un token nuevo cuando caduque.

---

5. **Ejecutar la aplicación**

Con el token actualizado y dependencias instaladas, ejecuta:

```bash
flutter run
```

---

## Recomendaciones y notas

* **Seguridad:** Nunca subas tus credenciales (`client_id`, `client_secret` ni tokens) a repositorios públicos. Usa archivos de configuración local ignorados por git (ej. `.env`) para almacenarlos de forma segura.

* **Renovación automática:** Este proyecto no implementa la renovación automática del token. Considera implementar una lógica para refrescar el token cuando expire.

* **Consumo de API:** Todas las llamadas a la API de Spotify deben incluir el header:

```http
Authorization: Bearer TOKEN_GENERADO
```


