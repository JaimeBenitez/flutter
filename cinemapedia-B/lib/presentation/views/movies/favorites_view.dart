import 'package:cinemapedia_b/presentation/providers/storage/favorites_movies_provider.dart';
import 'package:cinemapedia_b/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
//init
//solo las primeras diez

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline_sharp,
                  color: colors.primary, size: 60),
              Text(
                'Ooooops!!!',
                style: TextStyle(fontSize: 30, color: colors.primary),
              ),
              const Text('No tienes peliculas favoritas',
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              FilledButton.tonal(
                  onPressed: () => context.go('/home/0'),
                  child: const Text('Empieza a buscar'))
            ]),
      );
    }

    return Scaffold(
        body: MovieMasonry(
      movies: favoriteMovies,
      loadNextPage: loadNextPage,
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
