import 'package:flutter/material.dart';
import 'package:flutter_movie/movie_list.dart';
import 'package:provider/provider.dart';

import 'movie_state.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => MovieState(),
          child: MaterialApp(
          home: MovieList(),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}
