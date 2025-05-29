import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:clon_spotify/data/model/track_model.dart';
import 'package:flutter/material.dart';


class TrackTile extends StatelessWidget {
  final TrackModel track;

  const TrackTile({Key? key, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: track.album.imageUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                track.album.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          : null,
      title: Text(
        '🎶 ${track.name}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'Canción • ${track.artists[0].name}',
        style: TextStyle(color: AppColors.lightGray),
      ),
    );
  }
}
