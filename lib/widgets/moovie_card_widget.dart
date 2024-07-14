import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmpdbmoovieapp/common/utils.dart';
import 'package:tmpdbmoovieapp/models/moovie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tmpdbmoovieapp/providers/moovie_provider.dart';

class MoovieCardWidget extends StatelessWidget {
  final String headlineText;
  final Future<Moovie>? future;

  const MoovieCardWidget({
    super.key,
    required this.headlineText,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Moovie>(
      future: future, // Utiliser le futur passé en paramètre
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitPouringHourGlassRefined(
              color: Colors.black,
              size: 50,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Center(
                child: Text(
                  "Erreur : ${snapshot.error}",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  Provider.of<MoovieProvider>(context, listen: false)
                      .reloadMoovies();
                },
                color: Colors.black,
              ),
            ],
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data!.results;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                // Centrer le texte
                child: Text(
                  headlineText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200, // Hauteur fixe pour le défilement horizontal
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "$imageUrl${data[index].posterPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
    );
  }
}
