import 'package:clon_spotify/base/class/track.dart';
import 'package:clon_spotify/data/model/album_model.dart';
import 'package:clon_spotify/data/model/artist_model.dart';

class TrackModel extends Track {
  TrackModel({
    required super.id,
    required super.name,
    required super.durationMs,
    required super.trackNumber,
    required super.discNumber,
    required super.explicit,
    required super.isPlayable,
    required super.isLocal,
    required super.href,
    required super.uri,
    required super.spotifyUrl,
    required super.isrc,
    required super.popularity,
    required super.artists,
    required super.album,
    required previewUrl,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      durationMs: json['duration_ms'] ?? 0,
      trackNumber: json['track_number'] ?? 0,
      discNumber: json['disc_number'] ?? 0,
      explicit: json['explicit'] ?? false,
      isPlayable: json['is_playable'] ?? true,
      isLocal: json['is_local'] ?? false,
      href: json['href'] ?? '',
      uri: json['uri'] ?? '',
      spotifyUrl: json['external_urls']?['spotify'] ?? '',
      isrc: json['external_ids']?['isrc'] ?? '',
      popularity: json['popularity'] ?? 0,
      previewUrl: json['preview_url'],
      artists:
          (json['artists'] as List)
              .map((artist) => ArtistModel.fromJson(artist))
              .toList(),
      album: AlbumModel.fromJson(json['album']),
    );
  }
}
