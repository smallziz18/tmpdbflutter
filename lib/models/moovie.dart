import 'dart:convert';

// Classe représentant un film
class Moovie {
    Dates dates; // Dates de sortie (maximum et minimum)
    int page; // Page actuelle des résultats
    List<Result> results; // Liste des résultats de films
    int totalPages; // Nombre total de pages de résultats
    int totalResults; // Nombre total de résultats

    Moovie({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    // Méthode permettant de créer une copie d'un objet Moovie avec des valeurs modifiées
    Moovie copyWith({
        Dates? dates,
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        Moovie(
            dates: dates ?? this.dates,
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    // Factory pour créer un objet Moovie à partir d'une chaîne JSON brute
    factory Moovie.fromRawJson(String str) => Moovie.fromJson(json.decode(str));

    // Méthode pour convertir un objet Moovie en chaîne JSON brute
    String toRawJson() => json.encode(toJson());

    // Factory pour créer un objet Moovie à partir d'un Map JSON
    factory Moovie.fromJson(Map<String, dynamic> json) => Moovie(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    // Méthode pour convertir un objet Moovie en Map JSON
    Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

// Classe représentant les dates de sortie d'un film
class Dates {
    DateTime maximum; // Date de sortie maximum
    DateTime minimum; // Date de sortie minimum

    Dates({
        required this.maximum,
        required this.minimum,
    });

    // Méthode permettant de créer une copie d'un objet Dates avec des valeurs modifiées
    Dates copyWith({
        DateTime? maximum,
        DateTime? minimum,
    }) => 
        Dates(
            maximum: maximum ?? this.maximum,
            minimum: minimum ?? this.minimum,
        );

    // Factory pour créer un objet Dates à partir d'une chaîne JSON brute
    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    // Méthode pour convertir un objet Dates en chaîne JSON brute
    String toRawJson() => json.encode(toJson());

    // Factory pour créer un objet Dates à partir d'un Map JSON
    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    // Méthode pour convertir un objet Dates en Map JSON
    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

// Classe représentant un résultat de film
class Result {
    bool adult; // Indique si le film est pour adultes
    String backdropPath; // Chemin de l'image de fond
    List<int> genreIds; // Liste des IDs de genres
    int id; // ID du film
    OriginalLanguage originalLanguage; // Langue originale du film
    String originalTitle; // Titre original du film
    String overview; // Description du film
    double popularity; // Popularité du film
    String posterPath; // Chemin de l'affiche du film
    DateTime releaseDate; // Date de sortie du film
    String title; // Titre du film
    bool video; // Indique si le film est une vidéo
    double voteAverage; // Note moyenne du film
    int voteCount; // Nombre de votes

    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    // Méthode permettant de créer une copie d'un objet Result avec des valeurs modifiées
    Result copyWith({
        bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        OriginalLanguage? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        DateTime? releaseDate,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        Result(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            genreIds: genreIds ?? this.genreIds,
            id: id ?? this.id,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            releaseDate: releaseDate ?? this.releaseDate,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    // Factory pour créer un objet Result à partir d'une chaîne JSON brute
    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    // Méthode pour convertir un objet Result en chaîne JSON brute
    String toRawJson() => json.encode(toJson());

    // Factory pour créer un objet Result à partir d'un Map JSON
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    // Méthode pour convertir un objet Result en Map JSON
    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

// Enumération pour les langues originales
enum OriginalLanguage {
    EN,
    ZH
}

// Classe pour gérer la conversion entre chaînes et valeurs d'énumération
final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "zh": OriginalLanguage.ZH
});

// Classe pour gérer les valeurs d'énumération et leur conversion inversée
class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
