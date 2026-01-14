void main() {
  
 // final Hero wolverine = new Hero(name: 'Logan',power: 'Regeneración');
 Hero  wolverine = Hero(name: 'Logan',power: 'Regeneración');  //2
//Hero  wolverine = Hero(name: 'Logan');  //2 cuando no se manda poder
 //Hero  wolverine = Hero('Logan','Regeneración'); //1

  
  print( wolverine);
  print( wolverine.name );
  print( wolverine.power );
  
}
class Hero {
  String name;
  String power;

  //  Hero( String pName, String pPower ) //1
  //    : name = pName,
  //      power = pPower;

  Hero({                          //2
    required this.name, 
    this.power = 'Sin poder'
  });
 
  
   @override
  String toString() {
    return '$name - $power';
  }
  
}









