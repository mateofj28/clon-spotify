import 'package:clon_spotify/data/model/album_model.dart';
import 'package:clon_spotify/data/model/artist_model.dart';

class Track {
  final String id;
  final String name;
  final int durationMs;
  final int trackNumber;
  final int discNumber;
  final bool explicit;
  final bool isPlayable;
  final bool isLocal;
  final String href;
  final String uri;
  final String? previewUrl;
  final String spotifyUrl;
  final String isrc;
  final int popularity;
  final List<ArtistModel> artists;
  final AlbumModel album;

  Track({
    required this.id,
    required this.name,
    required this.durationMs,
    required this.trackNumber,
    required this.discNumber,
    required this.explicit,
    required this.isPlayable,
    required this.isLocal,
    required this.href,
    required this.uri,
    required this.spotifyUrl,
    required this.isrc,
    required this.popularity,
    required this.artists,
    required this.album,
    this.previewUrl,
  });
}
