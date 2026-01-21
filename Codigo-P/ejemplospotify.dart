//instalar dependencias necesarias, con el comando flutter pub get en el terminal de Visual estudio code (abrir uno en la pestaña terminal->new terminal), por ejemplo:
//C:\Users\ASUS\Desktop\SemetresUSFQ\2024-20\Programación Avanzada Apps\Material\Ejercicios\3_DartAvanzado> flutter pub get

// 1. contar numero de canciones con popularidad mas de 80
// 2. contar numero de canciones totales ( todo lo que se llena en el stream) pages -> items 
// 3. Imprimir nombre de artistas ( ya hecho), genero,album, imagen 
// 4. Numero de paginas, Cambiar para que me de x cantidad de paginas con x cantidad de canciones 
// 5. DEBER: Quitar el stream y usar usar pages consultar directamente las paginas y recorrer las canciones

import 'dart:async'; //herramientas para trabajar con programación asincrónica 
import 'package:spotify/spotify.dart'; //Librería para interactuar con la API de Spotify, permite realizar búsquedas y manejar datos relacionados con música.

void main() {
  fetchAlbums();
  startTimer();
}

Timer? timer;
int seconds = 0;

void startTimer() {
  timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    print("Segundo: ${++seconds}");
  });
}

  void stopTimer() {
    timer?.cancel();
    print("Conteo finalizado a los $seconds segundos.");
  }

// 1. Autenticación con Spotify
// 2. Creación y manejo de un StreamController
// 3. Procesamiento y filtrado de resultados
// 4. Control de errores y cierre del stream

void fetchAlbums() async {
  // 1. Autenticación con Spotify
  var credentials = SpotifyApiCredentials(
    '2071f4e865814386a6cdc41d55f32d07', 'a2f7808a1eb043ce89c045b15dacde78'
  );
  var spotify = SpotifyApi(credentials); //Crea un objeto SpotifyApi para realizar búsquedas y recuperar datos
// 2. Creación y manejo de un StreamController
int PopularidadAltaCount = 0;
  int TotalCacnionesCount = 0;

    (song){ 
      if(song.name!.length<10){  //Si el nombre de la canción tiene menos de 10 caracteres, imprime el nombre y el artista.
        print('Song: '+song.name!+' by: '+song.artists!.first.name!);
      }
    };
// 4. Control de errores y cierre del stream
  try {
    // Realiza la búsqueda
    var pages = await spotify.search.get('love', types: [SearchType.track]).first(50); //Busca canciones que contengan la palabra "love". y obtiene los primeros 50 resultados

    for (var page in pages) {
      if (page.items != null) {
        for (var item in page.items!) {
          if (item is Track) {
            // 2. Contar número de canciones totales
            TotalCacnionesCount++;

            // 1. Contar canciones con popularidad > 80
            if (item.popularity != null && item.popularity! > 80) {
              PopularidadAltaCount++;
            }

            // 3. Imprimir Nombre, Artista, Género, Álbum e Imagen
            print('\n');
            print('Song: ${item.name}');
            print('Artista: ${item.artists?.first.name ?? "Desconocido"}');
            print('Album: ${item.album?.name ?? "N/A"}');
            print('Imagen url: ${item.album?.images?.first.url ?? "NO hay imagen"}');
            print('Popularidad: ${item.popularity}');
          }
        }
      }
    }

    // Resultados finales
    print('\n------- RESUMEN TOTAL FINAL ------');
    print('1. Canciones con popularidad > 80: $PopularidadAltaCount');
    print('2. Total de canciones procesadas: $TotalCacnionesCount');
    
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    stopTimer();
  }
}
