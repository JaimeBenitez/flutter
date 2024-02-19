import 'package:cinemapedia_b/domain/entities/movie.dart';
import 'package:cinemapedia_b/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final moviesSlideshowProvider = Provider<List<Movie>>((ref){

  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0,6);
});