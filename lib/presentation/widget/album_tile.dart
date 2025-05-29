import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:clon_spotify/data/model/album_model.dart';
import 'package:flutter/material.dart';


class AlbumTile extends StatelessWidget {
  final AlbumModel album;

  const AlbumTile({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: album.imageUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                album.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          : null,
      title: Text(
        album.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'Álbum',
        style: TextStyle(color: AppColors.lightGray),
      ),
    );
  }
}
