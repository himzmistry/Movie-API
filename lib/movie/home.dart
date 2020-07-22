import 'package:flutter/material.dart';
import 'package:movie/movie/model/movie_model.dart';
import 'package:movie/movie/ui/midView.dart';

import 'network/network.dart';

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  Future<MovieModel> movieObject;
  String _movieName = "Avatar";

  void initState() {
    super.initState();
    movieObject = Network().getMovieName(movieName: _movieName);
    movieObject.then((movie) {
      print(movie.year);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        textFieldView(),
        Container(
          child: FutureBuilder<MovieModel>(
              future: movieObject,
              builder:
                  (BuildContext context, AsyncSnapshot<MovieModel> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                       midView(snapshot,context),
                      ],
                       
                        ),
                  );
                } else {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
        ),
      ],
    ));
  }

  Widget textFieldView() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
          ),
          contentPadding: EdgeInsets.all(13),
        ),
        onSubmitted: (value) => {
          setState(() {
            _movieName = value;
            movieObject = Network().getMovieName(movieName: _movieName);
          })
        },
      ),
    ));
  }
}
