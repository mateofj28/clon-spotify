import 'package:clon_spotify/base/tasks/search_artist_usecase.dart';
import 'package:clon_spotify/core/constants/app_colors.dart';
import 'package:clon_spotify/data/service/artist_repo_impl.dart';
import 'package:clon_spotify/data/source/spotify_remote_datasource.dart';
import 'package:clon_spotify/presentation/page/artist_search_screen.dart';
import 'package:clon_spotify/presentation/provider/auth_provider.dart';
import 'package:clon_spotify/presentation/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  final remoteDataSource = SpotifyRemoteDataSource();
  final repository = ArtistRepositoryImpl(remoteDataSource);
  final useCase = SearchArtistUseCase(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider(useCase)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clon spotify',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.spotifyBackground,
          titleTextStyle: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        scaffoldBackgroundColor: AppColors.spotifyBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Aquí defines la fuente global con GoogleFonts.manrope
        textTheme: GoogleFonts.manropeTextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white)
            .copyWith(
              bodyLarge: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              bodyMedium: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              bodySmall: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      home: SearchScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spotifyBackground,
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text(
          'Welcome to the Spotify Clone!',
          style: GoogleFonts.manrope(color: Colors.white),
        ),
      ),
    );
  }
}
