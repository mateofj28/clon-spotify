class SpotifyImage {
  final String url;
  final int height;
  final int width;

  SpotifyImage({
    required this.url,
    required this.height,
    required this.width,
  });

  factory SpotifyImage.fromJson(Map<String, dynamic> json) {
    return SpotifyImage(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}

class Artist {
  final String id;
  final String name;
  final String type;
  final String uri;
  final String href;
  final String spotifyUrl;
  final int popularity;
  final int followers;
  final List<String> genres;
  final List<SpotifyImage> images;

  Artist({
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
    required this.href,
    required this.spotifyUrl,
    required this.popularity,
    required this.followers,
    required this.genres,
    required this.images,
  });

}
