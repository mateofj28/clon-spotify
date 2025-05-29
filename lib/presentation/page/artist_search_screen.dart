import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:clon_spotify/data/model/album_model.dart';
import 'package:clon_spotify/data/model/artist_model.dart';
import 'package:clon_spotify/data/model/track_model.dart';
import 'package:clon_spotify/presentation/provider/search_provider.dart';
import 'package:clon_spotify/presentation/widget/album_tile.dart';
import 'package:clon_spotify/presentation/widget/artist_tile.dart';
import 'package:clon_spotify/presentation/widget/spotify_loading.dart';
import 'package:clon_spotify/presentation/widget/spotify_search_input.dart';
import 'package:clon_spotify/presentation/widget/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    final formatter = NumberFormat.decimalPattern();

    return Scaffold(
      appBar: AppBar(title: Text('Buscar en Spotify'), centerTitle: true),
      body: Column(
        children: [
          SpotifySearchInput(onChanged: (value) => provider.search(value)),

          if (provider.isLoading) SpotifyLoading(),
          Expanded(
            child: ListView(
              children:
                  provider.mixedResults.map((result) {
                    switch (result.type) {
                      case ResultType.artist:
                        final artist = result.data as ArtistModel;
                        return ArtistTile(artist: artist);

                      case ResultType.album:
                        final album = result.data as AlbumModel;
                        return AlbumTile(album: album);

                      case ResultType.track:
                        final track = result.data as TrackModel;
                        return TrackTile(track: track);
                    }
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
