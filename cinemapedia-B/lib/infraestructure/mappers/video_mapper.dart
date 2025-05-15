import 'package:cinemapedia_b/domain/entities/entities.dart';
import 'package:cinemapedia_b/infraestructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static movieDbVideoToEntity(Result moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}
