import 'package:clon_spotify/base/class/album.dart';

class AlbumModel extends Album {
  AlbumModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.releaseDate,
    required super.artistName,
    required super.spotifyUrl,
    required super.totalTracks,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>?;

    return AlbumModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl:
          images != null && images.length > 2
              ? images[2]['url']
              : images != null && images.isNotEmpty
              ? images[0]['url']
              : '', // Imagen vacía si no hay imágenes
      releaseDate: json['release_date'] ?? '',
      artistName:
          (json['artists'] != null && json['artists'].isNotEmpty)
              ? json['artists'][0]['name']
              : '',
      spotifyUrl: json['external_urls']?['spotify'] ?? '',
      totalTracks: json['total_tracks'] ?? 0,
    );
  }
}
