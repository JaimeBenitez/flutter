void main(){
  
  final Hero wolverine = Hero('Logan', 'Regeneración');
  print( wolverine.toString() );
  print(wolverine.name);
  print(wolverine.power);
  
}


class Hero {
  String name;
  String power;
  //Esta es la mejor forma de constructor
  Hero(this.name, this.power);
  //Forma lenta
 // Hero( String pName, String pPower)
 // : name = pName,
 // power = pPower;

 @override
  String toString(){
    return '$name - $power';
  }
  
}

 