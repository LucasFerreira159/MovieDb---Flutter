import 'dart:io';
import 'package:flutter_movie/movie_list.dart';
import 'package:flutter_movie/movies.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class NewMovie extends StatefulWidget {
  @override
  _NewMovieState createState() => _NewMovieState();
}

class _NewMovieState extends State<NewMovie> {
  final _formKey = GlobalKey<FormState>();
  final _movieNameController = TextEditingController();
  final _movieYearController = TextEditingController();
  final _movieScoreController = TextEditingController();
  final _movieDescriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Movie movie = Movie();
  File _image;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _movieYearController.text = selectedDate.day.toString() +
            "/" +
            selectedDate.month.toString() +
            "/" +
            selectedDate.year.toString();
        movie.releaseDate = selectedDate;
      });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
        movie.posterPath = _image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageButton = InkWell(
      onTap: () => getImage(),
      child: Container(
        width: 150,
        height: 250,
        child: _image == null
            ? Image.asset('lib/assets/add_icon.png')
            : Image.file(
                _image,
                fit: BoxFit.fill,
              ),
      ),
    );

    final movieNameField = TextFormField(
      controller: _movieNameController,
      validator: (value) {
        if (value.isEmpty) {
          return "O nome do filme deve ser preenchido!";
        }

        return null;
      },
      onChanged: (value) {
        movie.title = value;
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Nome',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final movieScoreField = TextFormField(
      controller: _movieScoreController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Nota',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final movieYearField = TextFormField(
      controller: _movieYearController,
      keyboardType: TextInputType.number,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Ano de Lançamento',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final movieDescriptionField = TextField(
      controller: _movieDescriptionController,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      onChanged: (value) => movie.overview = value,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Descrição',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );

    final addButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff192376),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        elevation: 50.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            movieState.addMovie(movie);
            Navigator.of(context).pop();
          }
        },
        child: Text('Adicionar novo filme',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        title: Text(
          'Novo filme',
          style: new TextStyle(
              color: Colors.red,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                imageButton,
                SizedBox(
                  height: 25.0,
                ),
                movieNameField,
                SizedBox(
                  height: 25.0,
                ),
                movieYearField,
                SizedBox(
                  height: 25.0,
                ),
                movieScoreField,
                SizedBox(
                  height: 25.0,
                ),
                movieDescriptionField,
                SizedBox(
                  height: 25.0,
                ),
                addButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
