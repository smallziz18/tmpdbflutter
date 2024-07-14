import 'package:flutter/material.dart';
import 'package:tmpdbmoovieapp/common/utils.dart';
import 'package:tmpdbmoovieapp/models/moovie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endpoint;
const langue = "&language=fr-fr";

class ApiServices {
  // Méthode pour obtenir les films à venir
  Future<Moovie> getUpcommingMoovies() async {
    endpoint = "movie/upcoming"; 
    final url = "$baseUrl$endpoint$key$langue";

    debugPrint("Récupération des films à venir depuis l'URL : $url");

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      debugPrint("Statut de la réponse : ${response.statusCode}");

      if (response.statusCode == 200) {
        debugPrint("Corps de la réponse : ${response.body}");

        // Décodage de la réponse JSON
        final jsonResponse = json.decode(response.body);
        debugPrint("JSON décodé : $jsonResponse");

        // Conversion en objet Moovie
        final moovie = Moovie.fromJson(jsonResponse);
        debugPrint("Objet Moovie créé : $moovie");

        return moovie;
      } else {
        debugPrint(
            "Échec du chargement des films. Statut de la réponse : ${response.statusCode}");
        throw Exception("Échec du chargement des films");
      }
    } catch (e) {
      debugPrint("Erreur lors de la récupération des films : $e");
      throw Exception("Erreur lors de la récupération des films");
    }
  }
}
