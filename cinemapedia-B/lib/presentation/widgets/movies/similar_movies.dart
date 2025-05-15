import 'package:cinemapedia_b/domain/entities/entities.dart';
import 'package:cinemapedia_b/presentation/providers/providers.dart';
import 'package:cinemapedia_b/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

class SimilarMovies extends ConsumerWidget {
  final int movieId;

  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recomendations(movies: movies),
      error: (error, stackTrace) =>
          const Text('No se pudo cargar películas similares'),
      loading: () => const CircularProgressIndicator(strokeWidth: 2),
    );
  }
}

class _Recomendations extends StatelessWidget {
  final List<Movie> movies;

  const _Recomendations({required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox();
    }

    return Container(
        margin: const EdgeInsetsDirectional.only(bottom: 50),
        child:
            MovieHorizontalListview(title: 'Recomendaciones', movies: movies));
  }
}
