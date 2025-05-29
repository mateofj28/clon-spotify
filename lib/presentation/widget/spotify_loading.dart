import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpotifyLoading extends StatelessWidget {
  const SpotifyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          strokeWidth: 3.5,
          color: AppColors.primaryGreen, // Verde Spotify
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
      ),
    );
  }
}
