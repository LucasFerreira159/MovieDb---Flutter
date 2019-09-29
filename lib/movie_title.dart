import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {

  final Color mainColor;


  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Filmes',
        style: new TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
