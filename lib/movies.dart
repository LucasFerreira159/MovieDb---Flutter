// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
    int page;
    int totalResults;
    int totalPages;
    List<Movie> results;

    Movies({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Movie {
    double popularity;
    int voteCount;
    bool video;
    String posterPath;
    int id;
    bool adult;
    String backdropPath;
    OriginalLanguage originalLanguage;
    String originalTitle;
    List<int> genreIds;
    String title;
    double voteAverage;
    String overview;
    DateTime releaseDate;

    Movie({
        this.popularity,
        this.voteCount,
        this.video,
        this.posterPath,
        this.id,
        this.adult,
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
    );

    Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    };
}

enum OriginalLanguage { EN, RU }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ru": OriginalLanguage.RU
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
