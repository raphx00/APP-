import 'dart:io';       // IOException

void main() async {
  
  print('Inicio del programa');
  
  try {
    
    final value = await httpGet('https://fernando-herrera.com/cursos');
    print( 'éxito: $value' );
    
  } on HttpException catch (err) {  //1
    print('Tenemos un HttpException: $err');
    
  }on Exception catch(err) { //3
    print('Tenemos una Exception: $err');
  } 
  catch (err) {  //3
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    print('Fin del try y catch');
  }
  
  
  print('Fin del programa');
}


Future<String> httpGet( String url ) async {
  
  await Future.delayed( const Duration(seconds: 1));
  
  //throw Exception('No hay parámetros en el URL'); //1
    throw HttpException('Fallo en la conexión de red');  //2
//   throw 'Error en la petición';   //3
  
//   return 'Tenemos un valor de la petición';
  
}


