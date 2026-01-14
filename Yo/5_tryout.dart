void main() {
  dynamic variable = 'Hello World';
  variable = () => 'Hello from a variable';
  print( variable() );
}