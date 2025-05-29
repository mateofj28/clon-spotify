// domain/repositories/artist_repository.dart




abstract class ArtistRepository {
  Future<Map<String, dynamic>> searchAll(String query);
}
