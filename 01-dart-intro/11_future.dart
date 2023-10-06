void main(){
  
 print('Inicio del programa');
  
 httpGet('https://fernando-herrera.com/cursos').then( (value){
   print(value);
 }).catchError((err){
   print('Error: $err');
 });
 print('Fin del programa');
}

//Los future son las promesas.El delayed es como el set timeout
Future<String> httpGet(String url){
  return Future.delayed( const Duration(seconds: 1), (){
    throw 'Error en la peticion http';
    //return 'Respuesta de la peticion http';
  });
}