import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmpdbmoovieapp/providers/moovie_provider.dart';
import 'package:tmpdbmoovieapp/screens/homescreen.dart';

void main() {
  runApp(
    // Fournir MoovieProvider à l'ensemble de l'application
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoovieProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Supprime le bandeau de débogage
      title: 'TMDB-Moovie-App', // Titre de l'application
      themeMode: ThemeMode.dark, // Mode de thème par défaut
      theme: ThemeData(
        // Définition du thème de l'application
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 24), // Style du texte large
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20), // Style du texte moyen
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(surface: Colors.black), // Palette de couleurs basée sur une graine
        fontFamily: GoogleFonts.ptSans().fontFamily, // Police de caractères personnalisée
        useMaterial3: true, // Utilisation de Material Design 3
      ),
      home: Homescreen(), // Définition de l'écran d'accueil
    );
  }
}
