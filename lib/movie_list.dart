import 'package:flutter/material.dart';
import 'package:flutter_movie/movie_state.dart';
import 'package:flutter_movie/new_movie.dart';
import 'package:provider/provider.dart';
import 'movie_cell.dart';
import 'movie_title.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Color mainColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          elevation: 0.3,
          centerTitle: true,
          backgroundColor: Colors.black87,
          title: new Text(
            'Filmes',
            style: new TextStyle(
                color: mainColor,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
              icon: new Icon(
                Icons.refresh,
                color: Colors.red,
              ),
              onPressed: () async {
                await Provider.of<MovieState>(context).getData();
              },
            ),
            )
          ],
        ),
        body: ItemList(),
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
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieState>(
      builder: (context, movieState, _) => Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieTitle(Colors.white),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount:
                    movieState.movies == null ? 0 : movieState.movies.length,
                itemBuilder: (context, i) {
                  return FlatButton(
                    child: MovieCell(movieState.movies, i),
                    padding: EdgeInsets.all(0.0),
                    color: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}