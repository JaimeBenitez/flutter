import 'package:cinemapedia_b/domain/entities/movie.dart';
import 'package:cinemapedia_b/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia_b/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBTOEntity( MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' 
      : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fb3ef66312333.5691dd2253378.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' 
      : 'https://www.csaff.org/wp-content/uploads/csaff-no-poster.jpg',
    releaseDate: moviedb.releaseDate ?? DateTime.now(),
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  ) ;
  static Movie movieDetailsToEntity ( MovieDetails moviedb ) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' 
      : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fb3ef66312333.5691dd2253378.jpg',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' 
      : 'https://www.csaff.org/wp-content/uploads/csaff-no-poster.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );
}