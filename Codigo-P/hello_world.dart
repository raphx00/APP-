void main() {
  var myName = 'World';

  print('Hello, $myName!');
  print('Hello, ${myName.toUpperCase()}');
  print('Hello, ${myName.length} characters long');
  print('Hello, ${myName.replaceAll('not ', '')}used');
}