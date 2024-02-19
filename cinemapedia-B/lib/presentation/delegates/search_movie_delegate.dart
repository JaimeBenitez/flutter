import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_b/config/helpers/human_formats.dart';
import 'package:cinemapedia_b/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?>{

  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoadingMovies = StreamController.broadcast();
  //Es como es setTimeout de JS
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies,
    required this.initialMovies
  }):super(
    searchFieldLabel: 'Buscar peliculas',

  );
  void clearStreams(){
    debouncedMovies.close();
  }
  void _onQueryChanged( String query ){
    isLoadingMovies.add(true);
    if( _debounceTimer?.isActive ?? false ) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500),() async {
      final movies = await searchMovies(query);
      initialMovies = movies;
      debouncedMovies.add(movies);
      isLoadingMovies.add(false);
    });
  }
  Widget buildResultsAndSuggestions(){
    return StreamBuilder(
      initialData: initialMovies,
      stream: debouncedMovies.stream, 
      builder:(context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder:(context, index) => _MovieItem(
            movie: movies[index], 
            onMovieSelected: (context, movie){
              clearStreams();
              close( context, movie );
            },
          )
        );
      },
      );
  }

  //Override opcional para cambiar el placeholder
  // @override
  // String get searchFieldLabel => 'Buscar pelicula';

  //Acciones de busqueda
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
     StreamBuilder(
      initialData: false,
      stream: isLoadingMovies.stream, 
      builder: (context, snapshot){
        
      return snapshot.data == false ?
      FadeIn(
        animate: query.isNotEmpty,
        // duration: const Duration(milliseconds: 200),
        child: IconButton(
          onPressed: () => query ='',
          icon: const Icon(Icons.clear)
        ),
      ) :
      SpinPerfect(
        duration: const Duration(seconds: 20),
        spins: 10,
        child: IconButton(
          onPressed: () => query ='',
          icon: const Icon(Icons.refresh_rounded)
        ),
      );
    
      })
    ];
  }

  //La parte del icono/inicio de la barra de busqueda
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: ()=> close(context, null), 
      icon: const Icon(Icons.arrow_back_ios_new_rounded)
    );
  }

  //Resultados cuando el usuario presiona enter
  @override
  Widget buildResults(BuildContext context) {
   return buildResultsAndSuggestions();
  }

  //Sugerencias mientras la persona está escribiendo
  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
     return buildResultsAndSuggestions();
  }

}

class _MovieItem extends StatelessWidget {

  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap:(){
        onMovieSelected(context,movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal:  10, vertical: 5),
        child: Row(
          children: [
            //Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder:(context, child, loadingProgress) => FadeIn(child: child),
                )
              )
            ),
            const SizedBox(width: 10),
            //Description
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( movie.title, style: textStyles.titleMedium),
                  ( movie.overview.length > 100)
                  ? Text( '${movie.overview.substring(0,100)}...')
                  : Text( movie.overview),
                  Row(
                    children: [
                      Icon( Icons.star_half_rounded, color: Colors.yellow.shade800),
                      const SizedBox( width: 5),
                      Text( 
                        HumanFormats.number(movie.voteAverage, 1), 
                      style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900) )
    
                    ])
                ],
              )
            )
          ],)
        ),
    );
  }
}