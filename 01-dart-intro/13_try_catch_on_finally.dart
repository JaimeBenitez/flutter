void main() async {
  
 print('Inicio del programa');
 try{
   final value = await httpGet('https://fernando-herrera.com/cursos');
   print( 'Exito: $value' );
   // Para controlar mensajes en errores especificos
 } on Exception catch(err){
   print('Tenemos una excepcion: $err');
 } catch(err){
   print('OOP!! algo terrible pasó: $err');
   //Finally s ejecuta aunque el catch o el on tengan efecto
 } finally {
   print('Fin del try/catch');
 }
 
 print('Fin del programa');
}

//Los future son las promesas.El delayed es como el set timeout
Future<String> httpGet(String url) async {
  await Future.delayed( const Duration(seconds: 1));
  
  throw Exception('No hay parametros en la URL');
  
 // throw 'Error en la peticion';
  
    //return 'Tenemos un valor de la peticion http';
}