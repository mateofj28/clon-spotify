// data/repositories/artist_repository_impl.dart

import 'package:clon_spotify/data/model/album_model.dart';
import 'package:clon_spotify/data/model/artist_model.dart';
import 'package:clon_spotify/data/model/track_model.dart';
import 'package:clon_spotify/data/repository/artist_repository.dart';
import 'package:clon_spotify/data/source/spotify_remote_datasource.dart';



class ArtistRepositoryImpl extends ArtistRepository {
  final SpotifyRemoteDataSource dataSource;

  ArtistRepositoryImpl(this.dataSource);

  
  
  @override
  Future<Map<String, dynamic>> searchAll(String query) async {
    final json = await dataSource.search(query);
    print("this is a json");
    print(json);
    return {
      'artists': (json['artists']['items'] as List)
          .map((e) => ArtistModel.fromJson(e))
          .toList(),
      'albums': (json['albums']['items'] as List)
          .map((e) => AlbumModel.fromJson(e))
          .toList(),
      'tracks': (json['tracks']['items'] as List)
          .map((e) => TrackModel.fromJson(e))
          .toList(),
    };
  }
}
