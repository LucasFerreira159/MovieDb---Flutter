import 'package:flutter/material.dart';
import 'package:flutter_movie/new_movie.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'movie_cell.dart';
import 'movie_title.dart';
import 'movies.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movies;
  Color mainColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.black87,
        leading: new Icon(
          Icons.arrow_back,
          color: mainColor,
        ),
        title: new Text(
          'Filmes',
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          new Icon(
            Icons.menu,
            color: mainColor,
          )
        ],
      ),
      body: new Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieTitle(Colors.white),
            Expanded(
                child: new ListView.builder(
                  physics: BouncingScrollPhysics(),
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (context, i) {
                return FlatButton(
                  child: MovieCell(movies, i),
                  padding: EdgeInsets.all(0.0),
                  color: Colors.white,
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewMovie()),
          );
        },
      ),
    );
  }

  Future getJson() async {
    String url =
        'http://api.themoviedb.org/3/discover/movie?api_key=3c6b7b5163f500336234a349b8b17a74&language=en-US';
    var response = await http.get(url);
    return moviesFromJson(response.body);
  }

  void getData() async {
    Movies data = await getJson();

    setState(() {
      movies = data.results;
    });
  }
}
