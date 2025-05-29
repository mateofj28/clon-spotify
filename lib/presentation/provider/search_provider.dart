// presentation/providers/artist_provider.dart

import 'package:clon_spotify/base/tasks/search_artist_usecase.dart';
import 'package:clon_spotify/data/model/album_model.dart';
import 'package:clon_spotify/data/model/artist_model.dart';
import 'package:clon_spotify/data/model/track_model.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  final SearchArtistUseCase cases;

  SearchProvider(this.cases);

  List<ArtistModel> artists = [];
  List<AlbumModel> albums = [];
  List<TrackModel> tracks = [];
  List<SearchResult> mixedResults = [];

  bool isLoading = false;

  Future<void> search(String query) async {
    print("estamos ejecutando el provider");

    isLoading = true;
    notifyListeners();

    try {
      final result = await cases.call(query);

      artists = result['artists'];
      albums = result['albums'];
      tracks = result['tracks'];

      mixedResults = [
        ...artists.map((a) => SearchResult(type: ResultType.artist, data: a)),
        ...albums.map((a) => SearchResult(type: ResultType.album, data: a)),
        ...tracks.map((t) => SearchResult(type: ResultType.track, data: t)),
      ]..shuffle(); // Mezclar los resultados

    } catch (e) {
      print("Error al buscar $query: $e");
      artists = [];
      albums = [];
      tracks = [];
    }

    isLoading = false;
    notifyListeners();
  }
}

enum ResultType { artist, album, track }

class SearchResult {
  final ResultType type;
  final dynamic data;

  SearchResult({required this.type, required this.data});
}
