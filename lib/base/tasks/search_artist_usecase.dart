// domain/usecases/search_artist_usecase.dart

import 'package:clon_spotify/data/repository/artist_repository.dart';



class SearchArtistUseCase {
  final ArtistRepository repository;

  SearchArtistUseCase(this.repository);

  Future<Map<String, dynamic>> call(String query) {
    return repository.searchAll(query);
  }
}
