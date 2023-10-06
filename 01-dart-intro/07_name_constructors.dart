void main(){
  
 final Map<String, dynamic> rawJson = {
   'name': 'Spiderman',
   'power': 'Trepar paredes',
   'isAlive': true
 };
  
 
   final ironman = Hero.fromJson( rawJson );
  
 //  final ironman = Hero(
 //  isAlive: false,
 //  power: 'money',
 //  name: 'Tony Stark'
 // );
  
  print(ironman.toString());
  
}


class Hero {

  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  
  Hero.fromJson( Map<String,dynamic> json)
    : name = json['name'] ?? 'No name found',
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? 'No status found'; 
  
  @override
  String toString(){
    return '$name, $power, is alive: ${ isAlive ? 'YES!':'Nope'}';
   }
  
}