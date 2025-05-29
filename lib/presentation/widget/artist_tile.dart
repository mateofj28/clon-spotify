import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:clon_spotify/data/model/artist_model.dart';
import 'package:flutter/material.dart';


class ArtistTile extends StatelessWidget {
  final ArtistModel artist;

  const ArtistTile({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: artist.images.isNotEmpty
          ? ClipOval(
              child: Image.network(
                artist.images[0].url,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          : const CircleAvatar(
              radius: 30,
              child: Icon(Icons.person),
            ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              artist.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.verified,
            color: Colors.blue,
            size: 16,
          ),
        ],
      ),
      subtitle: Text(
        'Artista',
        style: TextStyle(color: AppColors.lightGray),
      ),
    );
  }
}
