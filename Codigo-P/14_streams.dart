void main() {
  
  //emitNumbers(); no run //1
  emitNumbers().listen( (value) {
     print('Stream value: $value');
  });
  
  
} 


Stream<int> emitNumbers() {
  
  return Stream.periodic( const Duration(seconds: 1), (value){
//     print('desde periodic $value');  //1
    return value;
  }).take(5);
  // }); // infinito
}