import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SpotifySearchInput extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SpotifySearchInput({Key? key, required this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty) onChanged(value);
        },
        cursorColor: AppColors.primaryGreen,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '¿Qué quieres escuchar?',
          prefixIcon: const Icon(Icons.search, color: Colors.black87),
          hintStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
