void main() {
  var myName = 'This variable is not used';

  print('Hello, $myName!');
  print('Hello, ${myName.toUpperCase()}');
  print('Hello, ${myName.length} characters long');
  print('Hello, ${myName.replaceAll('not ', '')}used');
}