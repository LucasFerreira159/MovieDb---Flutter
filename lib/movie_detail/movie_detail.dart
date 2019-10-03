import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetail extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(image_url + movie['poster_path'], fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: Container(
                      width: 400,
                      height: 400,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(image_url + movie['poster_path']),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      movie['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Arvo'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            movie['release_date'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Arvo'),
                          ), flex: 4,
                        ),
                        Expanded(
                          child: Text(
                            '${movie['vote_average']}/10',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Arvo'), textAlign: TextAlign.end,
                          ), flex: 1,
                        )
                      ],
                    ),
                  ),
                  new Text(movie['overview'],
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'Arvo'), textAlign: TextAlign.justify,),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
