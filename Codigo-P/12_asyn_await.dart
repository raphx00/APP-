void main() async {  //aqui async permite utilizar la palabra servada await
  
  print('Inicio del programa');
  
  try {
    
    final value = await httpGet('https://usfq.edu.ec');
    print( value );
    
  } catch (err) {
    print('Tenemos un error: $err');
  }
  
  
  print('Fin del programa');
}


Future<String> httpGet( String url ) async { //async siempre se usa con future
  
  await Future.delayed( const Duration(seconds: 1));
  
  throw 'Error en la petición';
  
//   return 'Tenemos un valor de la petición';
  
}