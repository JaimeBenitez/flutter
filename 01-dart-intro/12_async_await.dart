void main() async {
  
 print('Inicio del programa');
 try{
   final value = await httpGet('https://fernando-herrera.com/cursos');
   print( value );
 } catch(err){
   print('Tenemos un error: $err');
 }
 
 print('Fin del programa');
}

//Los future son las promesas.El delayed es como el set timeout
Future<String> httpGet(String url) async {
  await Future.delayed( const Duration(seconds: 1));
  
  throw 'Error en la peticion';
  
    //return 'Tenemos un valor de la peticion http';
}