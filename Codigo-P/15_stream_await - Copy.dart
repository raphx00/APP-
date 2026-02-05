void main() {
  
  emitNumber()
     .listen( (int value) {
        
       print( 'Stream value: $value' );
       
     }); 
}
Stream<int> emitNumber() async* {  // async* regresa un stream a diferencia que async regresa un future
  
  final valuesToEmit = [1,2,3,4,5];
  
  for( int i in valuesToEmit ) {
    await Future.delayed( const Duration(seconds: 2));
    yield i;   //yield es en vez de return dado que es como ceder este valor
  }
  
  
}


// import 'dart:async';
// import 'dart:io';

// /// Estado de red (heurístico).
// enum NetStatus { noInternet, internetViaWifi, internetViaOther }

// void main() {
//   // Ejemplo: escucha el estado cada 2 segundos.
//   final sub = networkStatusStream(period: const Duration(seconds: 2)).listen(
//     (s) => print('Status: ${_pretty(s)}'),
//     onError: (e, st) => print('Error: $e'),
//   //    onError: (Object e, StackTrace st) {
//   //   print('Error: $e');
//   //   print('StackTrace:\n$st');
//   // },

//   );

//   // (Opcional) cancelar suscripción luego de un tiempo.
//   // Future.delayed(const Duration(seconds: 20), () => sub.cancel());
// }

// /// Devuelve un Stream que informa el estado de red periódicamente.
// /// - Distingue entre "sin Internet", "con Internet vía Wi-Fi" e "Internet por otra interfaz".
// Stream<NetStatus> networkStatusStream({
//   Duration period = const Duration(seconds: 2),
// }) {
//   return Stream.periodic(period).asyncMap((_) => _currentStatus()).distinct();   //Stream<Future<NetStatus>> (futuros sin resolver), asyncMap “espera” cada futuro y lo aplana a Stream<NetStatus>.
// }    //distince: Crea un stream que solo emite cuando el valor cambia respecto al anterior.

// /// Calcula el estado actual.
// Future<NetStatus> _currentStatus() async {
//   final online = await _hasInternet();
//   if (!online) return NetStatus.noInternet;   //!online significa “no online”

//   // Heurística: ¿hay una interfaz con nombre típico de Wi-Fi activa?
//   final interfaces = await NetworkInterface.list(
//     includeLoopback: false,
//     includeLinkLocal: false,
//     type: InternetAddressType.any,
//   );

//   final hasWifi = interfaces.any((i) {
//     final n = i.name.toLowerCase();
//     // Ajusta estos patrones si tu SO usa nombres distintos.
//     return n.contains('wifi') ||
//         n.contains('wi-fi') ||
//         n.contains('wlan') ||
//         n.startsWith('wl') || // Linux: wlp2s0, wlan0...
//         n == 'en0';           // macOS típico para Wi-Fi
//   });

//   return hasWifi ? NetStatus.internetViaWifi : NetStatus.internetViaOther;
// }

// /// Chequeo simple de “hay Internet”: intenta conectar a DNS públicos.
// /// Usamos `const` solo para las cadenas y creamos `InternetAddress` dentro del loop.
// Future<bool> _hasInternet() async {
//   const candidateIps = ['1.1.1.1', '8.8.8.8']; // Cloudflare, Google

//   for (final ipStr in candidateIps) {
//     try {
//       final ip = InternetAddress(ipStr, type: InternetAddressType.IPv4); 
//       final socket =
//           await Socket.connect(ip, 53, timeout: const Duration(seconds: 2));  //socket TCP al puerto 53 (DNS)
//       socket.destroy();
//       return true;
//     } catch (_) {
//       // Intenta la siguiente IP.
//     }
//   }
//   return false;
// }

// /// Para mostrar el estado con texto legible.
// String _pretty(NetStatus s) {
//   switch (s) {
//     case NetStatus.noInternet:
//       return 'Sin Internet';
//     case NetStatus.internetViaWifi:
//       return 'Internet vía Wi-Fi';
//     case NetStatus.internetViaOther:
//       return 'Internet vía otra interfaz';
//   }
// }

