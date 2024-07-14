import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tmpdbmoovieapp/models/moovie.dart';
import 'package:tmpdbmoovieapp/services/api_services.dart';

class MoovieProvider extends ChangeNotifier {
  Future<Moovie>? _futureMoovie; // Future pour les films à venir
  Future<Moovie>? _futureNowPlaying; // Future pour les films à l'affiche
  String? _errorMessage; // Message d'erreur potentiel

  Future<Moovie>? _topMoovie;

  // Constructeur pour initialiser les films au lancement
  MoovieProvider() {
    fetchMoovies();
    fetchNowPlaying();
    fetchTopMoovie(); // Récupérer les films à l'affiche
  }

  // Getters
  Future<Moovie>? get futureMoovie => _futureMoovie;
  Future<Moovie>? get futureNowPlaying =>
      _futureNowPlaying; // Getter pour les films à l'affiche
  Future<Moovie>? get futureTopMoovie => _topMoovie;
  String? get errorMessage => _errorMessage;

  // Méthode pour récupérer les films à venir
  void fetchMoovies() {
    _futureMoovie = ApiServices().getUpcommingMoovies();
    _futureMoovie!.then((_) {
      _errorMessage = null; // Réinitialiser le message d'erreur
      notifyListeners();
    }).catchError((error) {
      _errorMessage = error.toString(); // Mettre à jour le message d'erreur
      notifyListeners();
    });
  }

  // Méthode pour récupérer les films à l'affiche
  void fetchNowPlaying() {
    _futureNowPlaying = ApiServices().getNowplaying(); // Appelle la méthode API
    _futureNowPlaying!.then((_) {
      _errorMessage = null; // Réinitialiser le message d'erreur
      notifyListeners();
    }).catchError((error) {
      _errorMessage = error.toString(); // Mettre à jour le message d'erreur
      notifyListeners();
    });
  }

  // Méthode pour recharger les films
  void reloadMoovies() {
    fetchMoovies();
    fetchNowPlaying(); // Recharger les films à l'affiche
  }

  void fetchTopMoovie() {
    _topMoovie = ApiServices().getTopRated();
    _topMoovie!.then((_) {
      _errorMessage = null; // Réinitialiser le message d'erreur
      notifyListeners();
    }).catchError((error) {
      _errorMessage = error.toString(); // Mettre à jour le message d'erreur
      notifyListeners();
    });
  }
}
