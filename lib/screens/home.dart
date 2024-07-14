import 'package:flutter/material.dart';
import 'package:tmpdbmoovieapp/common/utils.dart';
import 'package:tmpdbmoovieapp/models/moovie.dart';
import 'package:tmpdbmoovieapp/services/api_services.dart'; // Assurez-vous que ce chemin est correct

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: FutureBuilder<Moovie>(
        future: ApiServices().getUpcommingMoovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur : ${snapshot.error}",
                style: const TextStyle(color: Colors.black),
              ),
            );
          } else if (snapshot.hasData) {
            final moovie = snapshot.data!;
            return ListView.builder(
              itemCount: moovie.results.length,
              itemBuilder: (context, index) {
                final result = moovie.results[index];
                return ListTile(
                  title: Text(
                    result.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    result.overview,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Aucun film trouvé",
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
