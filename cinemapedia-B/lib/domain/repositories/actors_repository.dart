import 'package:cinemapedia_b/domain/entities/actor.dart';

abstract class ActorsRepository {

  Future<List<Actor>> getActorByMovie(String movieId);

}