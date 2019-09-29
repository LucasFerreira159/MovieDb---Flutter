import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = Colors.white;
  var img_url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                  margin: EdgeInsets.all(16),
                  child: Container(
                    width: 120,
                    height: 170,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(img_url + movies[i]['poster_path']),
                        fit: BoxFit.cover),
                    /*boxShadow: [
                      new BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 5.0))
                    ]*/
                  )),
            ),
            new Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: new Column(
                children: [
                  new Text(
                    movies[i]['title'],
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movies[i]['overview'],
                    maxLines: 3,
                    style: new TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
