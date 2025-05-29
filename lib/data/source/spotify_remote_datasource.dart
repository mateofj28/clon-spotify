// data/datasources/spotify_remote_data_source.dart
import 'dart:convert';

import 'package:http/http.dart' as http;


class SpotifyRemoteDataSource {

  final String _baseUrl = 'https://api.spotify.com/v1/search';
  final String _token = 'BQDj3egDItlKoQ5s9L23oVSa_zXYwuX0HTapCbWkvcyzbhDjEhcFdVRE-hsPnxxbJ8XUxZkIQ7WALXM2n3PWCk4VjPxnrzU89QO5GnRE4ltP-yfeTqnuPLzmXo_hHQEvfTyRUHQ9nuo';

  SpotifyRemoteDataSource();
 

  Future<Map<String, dynamic>> search(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$query&type=artist,album,track&limit=5&market=CO'),
      headers: {'Authorization': 'Bearer $_token'},
    );

    if (response.statusCode == 200) {
      
      return json.decode(response.body);
    } else {
      throw Exception('Error al buscar en Spotify');
    }
  }
}
