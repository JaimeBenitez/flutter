void main(){
  
  print(greetEveryone());
  
  print('Suma ${ addTwoNumbers(10,2)}');

  print( greetPerson( name: 'Calvo', message: 'Hi'));
  
}
//Ojo, a diferencia de TS/JS, en Dart no se pueden elaborar las funciones flecha, deben
//retornar directamente un valor
String greetEveryone() => 'Hello everyone!';

int addTwoNumbers( int a, int b ) => a + b;

int addTwoNumbersOptional( int a, [ int b = 0 ] ){ 
  
  //Si hay b b=b, si no b=0
  //b = b ?? 0;
  //b ??= 0;
  
  return a + b;
}

//Con llaves se convierten en opcionales los parametros. Required hace al parametro obligatorio
String greetPerson({ required String name, String message = 'Hola' }){
  return '$message, $name';
}