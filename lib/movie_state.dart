import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'movies.dart';

class MovieState extends ChangeNotifier {
  List<Movie> _movies = List();

  List<Movie> get movies => _movies;

  set movies(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  Future<List<Movie>> getData() async {
    String url =
        'http://api.themoviedb.org/3/discover/movie?api_key=3c6b7b5163f500336234a349b8b17a74&language=en-US';
    var response = await http.get(url);
    movies = moviesFromJson(response.body).results;
    return _movies;
  }
}