//Explicacion de los mixins: https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3


void main() {

  final flipper = Delfin();
  flipper.nadar();
  
  final batman = Murcielago();
  batman.caminar();
  batman.volar();
  
  
}




abstract class Animal {}
abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print('estoy volando!');
}

mixin Caminante {
  void caminar() => print('estoy caminando!');
}

mixin Nadador {
  void nadar() => print('estoy nadando!');
}

class Delfin extends Mamifero with Nadador {} //con with utilizo el mixin
class Murcielago extends Mamifero with Volador, Caminante {}
class Gato extends Mamifero with Caminante {}

// implementar Paloma, Pato, Tiburon, PezVolador









