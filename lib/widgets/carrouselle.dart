import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmpdbmoovieapp/providers/moovie_provider.dart';
import 'package:tmpdbmoovieapp/models/moovie.dart';

class MonCarousel extends StatelessWidget {
  const MonCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: Consumer<MoovieProvider>(
        builder: (context, moovieProvider, child) {
          return FutureBuilder<Moovie>(
            future: moovieProvider.futureMoovie,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                var data = snapshot.data!;
                return CarouselSlider.builder(
                  itemCount: data.results.length,
                  itemBuilder: (context, int index, int realIndex) {
                    var url = data.results[index].backdropPath;
                    return CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500$url',
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: size.width,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                );
              } else {
                return const Center(child: Text('Aucun film trouvé.'));
              }
            },
          );
        },
      ),
    );
  }
}
