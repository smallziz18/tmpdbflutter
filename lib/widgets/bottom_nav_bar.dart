import 'package:flutter/material.dart';
import 'package:tmpdbmoovieapp/screens/home.dart';
import 'package:tmpdbmoovieapp/screens/plus_screen.dart';
import 'package:tmpdbmoovieapp/screens/recherche_screen.dart';

// Un widget stateless pour le Bottom Navigation Bar
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Nombre d'onglets
      child: Scaffold(
        // Barre de navigation en bas de l'écran
        bottomNavigationBar: Container(
          color: Colors.black, // Couleur de fond de la barre de navigation
          height: 70, // Hauteur de la barre de navigation
          child: const TabBar(
            tabs: [
              // Onglet Accueil
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              // Onglet Rechercher
              Tab(
                icon: Icon(Icons.search),
                text: "chercher",
              ),
              // Onglet Nouveautés
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "Nouveautés",
              ),
            ],
            indicatorColor: Colors.transparent, // Couleur de l'indicateur de sélection
            labelColor: Colors.white, // Couleur du texte des onglets sélectionnés
            unselectedLabelColor: Color(0xff999999), // Couleur du texte des onglets non sélectionnés
          ),
        ),
        // Vue de contenu pour chaque onglet
        body: const TabBarView(
          children: [
            Home(), // Contenu de l'onglet Accueil
            Search(), // Contenu de l'onglet Rechercher
            PlusScreen(), // Contenu de l'onglet Nouveautés
          ],
        ),
      ),
    );
  }
}
