void main(){
  
  final String pokemon = 'Ditto';
  final int hp = 100; 
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];
  
  //dynamic == null <-- acepta nulos asi que no tiene null safety
  //Pierde todas las restricciones, es un caos asi que mejor evitarlo siempre que sea posible
  
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = [1,2,3,4,5,6];
  errorMessage = {1,2,3,4,5,6};
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