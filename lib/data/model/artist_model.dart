import 'package:clon_spotify/base/class/artist.dart';

class ArtistModel extends Artist {
  ArtistModel({
    required super.name,
    required super.id,
    required super.type,
    required super.uri,
    required super.href,
    required super.spotifyUrl,
    required super.popularity,
    required super.followers,
    required super.genres,
    required super.images,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>?;

    return ArtistModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      uri: json['uri'] ?? '',
      href: json['href'] ?? '',
      spotifyUrl: json['external_urls']?['spotify'] ?? '',
      popularity: json['popularity'] ?? 0,
      followers: json['followers']?['total'] ?? 0,
      genres:
          (json['genres'] != null && json['genres'] is List)
              ? List<String>.from(json['genres'])
              : [],
      images:
          images != null
              ? images.map((img) => SpotifyImage.fromJson(img)).toList()
              : [],
    );
  }
}
