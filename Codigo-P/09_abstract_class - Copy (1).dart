
// crear una clase WaterPlant que herede de EnergyPlant, en la cual sobre implemente el método
// consumeEnergy donde la energía restante es el 70% de la cantidad total. Ademas, modificar
//el metodo toString() para que devuelve el mensaje asi: tipo de planta: energía: energía restante, 
//e.g., wind : energía: 90.0


void main() {

 //final plant = EnergyPlant(energyLeft: 100, type: PlantType.wind); // No puede ser instanciada por ser la clase abstracta

  final windPlant = WindPlant( initialEnergy: 100 );
  final nuclearPlant = NuclearPlant( energyLeft: 100 );  
  print( 'wind: ${ chargePhone( windPlant ) }' );
  print( 'nuclear: ${ chargePhone( nuclearPlant ) }' );
  // PARTE NUEVA WATERPLANT
  final waterPlant = WaterPlant( initialEnergy: 10 );
  print( 'water: ${ chargePhone( waterPlant ) }' );

}

//
double chargePhone( EnergyPlant plant ) {
  if ( plant.energyLeft < 10 ) {
    throw Exception('Not enough energy');
  }
    plant.consumeEnergy(10);        //aquí sí se descuenta energía según la planta  
  return plant.energyLeft;
}

enum PlantType { nuclear, wind, water }  //enumeracion 

abstract class EnergyPlant {
  
  double energyLeft;
  final PlantType type; // nuclear, wind, water
  
  EnergyPlant({ 
    required this.energyLeft, 
    required this.type 
  });
  
  void consumeEnergy( double amount );  //no se implementa - Método abstracto
  
}

// extends o implements (Herencia)
class WindPlant extends EnergyPlant {
  
  WindPlant({ required double initialEnergy })
      : super( energyLeft: initialEnergy, type: PlantType.wind );
  
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= amount;
  }

  @override
  String toString() {
    return 'WindPlant, energía: $energyLeft';
  }
}


class NuclearPlant implements EnergyPlant {
  
  @override
  double energyLeft;
  
  @override
  final PlantType type = PlantType.nuclear;
  
  NuclearPlant({ required this.energyLeft });
  
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= (amount * 0.4);
  }

    @override
  String toString() {
    return 'NuclearPlant,  energía: $energyLeft';
  }
  
}
class WaterPlant extends EnergyPlant { // PARTE NUEVA si usa extan sol ousas lo que quiera y implement es todo 
  
  WaterPlant({ required double initialEnergy })
      : super( energyLeft: initialEnergy, type: PlantType.water );
  
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= (amount * 0.3);
  }

  @override
  String toString() {
    return 'WaterPlant, energía: $energyLeft';
  }
}


