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

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // Décodage de la réponse JSON
        final jsonResponse = json.decode(response.body);

        // Conversion en objet Moovie
        final moovie = Moovie.fromJson(jsonResponse);

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

  Future<Moovie> getNowplaying() async {
    endpoint = "movie/upcoming";
    final url = "$baseUrl$endpoint$key$langue";

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // Décodage de la réponse JSON
        final jsonResponse = json.decode(response.body);

        // Conversion en objet Moovie
        final moovie = Moovie.fromJson(jsonResponse);

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

  Future<Moovie> getTopRated() async {
    endpoint = "movie/top_rated";
    final url = "$baseUrl$endpoint$key$langue";

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // Décodage de la réponse JSON
        final jsonResponse = json.decode(response.body);

        // Conversion en objet Moovie
        final moovie = Moovie.fromJson(jsonResponse);

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
