void main() {
  
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  //final abilities = ['impostor'];
  final sprites = <String>['ditto/front.png','ditto/back.png'];
  
// dynamic == null  //dynamic es cualquier tipo de dato
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = [1,2,3,4,5,6]; //listado de numeros
  errorMessage = { 1,2,3,4,5,6 }; // set de datos
  errorMessage = () => true;
  errorMessage = null;
    
  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
  """);
  
  
}