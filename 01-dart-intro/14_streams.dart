void main(){
  
  emitNumbers().listen((value){
    print('Stream value: $value');
  });
  
  
}


Stream<int> emitNumbers(){
  
  return Stream.periodic( const Duration(seconds: 1), (value){
   // print('desde periodic $value');
    return value;
    //Take le dice cuantas emisiones realizar
  }).take(5);
    
}