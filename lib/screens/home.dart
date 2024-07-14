import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmpdbmoovieapp/common/utils.dart';
import 'package:tmpdbmoovieapp/providers/moovie_provider.dart';
import 'package:tmpdbmoovieapp/widgets/carrouselle.dart';
import 'package:tmpdbmoovieapp/widgets/moovie_card_widget.dart'; 

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final moovieProvider = Provider.of<MoovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          width: 120,
        ),
        actions: [
          InkWell(
            onTap: () {
              // Action de recherche
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MonCarousel(), // Ajout du carrousel ici
            SizedBox(
              height: 259,
              child: MoovieCardWidget(
                future: moovieProvider.futureNowPlaying!,
                headlineText: "Films à l'affiche",
              ),
            ),
            SizedBox(
              height: 259,
              child: MoovieCardWidget(
                future: moovieProvider.futureMoovie!,
                headlineText: "Films à venir",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
