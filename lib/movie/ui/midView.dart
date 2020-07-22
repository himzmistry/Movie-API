import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:movie/movie/model/movie_model.dart';

Widget midView(AsyncSnapshot<MovieModel> snapshot, context) {
  var movieTitle = snapshot.data.title;
  var movieDirector = snapshot.data.director;
  var runTime = snapshot.data.runtime;
  var poster = snapshot.data.poster;
  var rating = double.parse(snapshot.data.imdbRating);
  double finalRating = rating == null ? 1 : rating / 2;

  var midView = Container(
    child: new Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, left: 10.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 23.0, bottom: 8.0),
                        child: Text(
                          "$movieTitle",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Director: $movieDirector",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Time: $runTime",
                        style: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "$rating",
                              style: TextStyle(
                                  color: Colors.purple[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: RatingBar.readOnly(
                                initialRating: finalRating,
                                isHalfAllowed: true,
                                halfFilledIcon: Icons.star_half,
                                filledIcon: Icons.star,
                                emptyIcon: Icons.star_border,
                                filledColor: Colors.yellow,
                                emptyColor: Colors.grey,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            width: 390,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(1, 3),
                    blurRadius: 15.0,
                    //  spreadRadius: 1
                  ),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            width: 110,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(3, 1),
                    blurRadius: 15.0,
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(poster),
                  fit: BoxFit.cover,
                ),
                color: Colors.amber),
          ),
        ),
      ],
    ),
  );
  return midView;
}
