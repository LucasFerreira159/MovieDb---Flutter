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

  @override
  Widget build(BuildContext context) {
    final imageButton = Material(
        elevation: 5.0,
        shape: CircleBorder(),
        color: Colors.white,
        child: InkWell(
          child: IconButton(
            icon: Icon(Icons.camera_alt),
            padding: EdgeInsets.all(50.0),
            iconSize: 70,
            onPressed: () {
              // open galery
            },
          ),
        ));

    final movieNameField = TextFormField(
      controller: _movieNameController,
      validator: (value) {
        if (value.isEmpty) {
          return "O nome do filme deve ser preenchido!";
        }

        return null;
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
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Ano',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );

    final movieDescriptionField = TextField(
      controller: _movieDescriptionController,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
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
            // Add to list
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
