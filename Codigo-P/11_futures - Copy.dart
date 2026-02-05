void main() {     //sin await no espera!!
  
  print('Inicio del programa');
  
  httpGet('https://usfq.edu.ec')      //Se inicia la tarea asincrónica
    .then(                          //Puede llegar bien (then)
      (value){
        print( value );
      })
    .catchError( (err) {            //O fallar (catchError)
    print('Error: $err');
  });
  
  print('Fin del programa');
}


Future<String> httpGet( String url ){
  
  return Future.delayed( const Duration(seconds: 2), () {
   
    //throw 'Error en la petición http';
    
     return 'Respuesta de la petición http';
    
  });
  
}