import 'package:flutter/material.dart';
import 'package:tmpdbmoovieapp/screens/home.dart';
import 'package:tmpdbmoovieapp/screens/plus_screen.dart';
import 'package:tmpdbmoovieapp/screens/recherche_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "chercher",
                ),
                Tab(
                  icon: Icon(Icons.photo_library_outlined),
                  text: "Nouveautés",
                ),
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff999999),
            ),
          ),
          body: const TabBarView(
            children: [Home(), Search(), PlusScreen()],
          ),
        ));
  }
}
