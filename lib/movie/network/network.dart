import 'dart:convert';

import 'package:movie/movie/model/movie_model.dart';
import 'package:http/http.dart';
import 'package:movie/movie/util/movie_util.dart';

class Network {
  Future<MovieModel> getMovieName({String movieName}) async {
    var finalUrl =
        "http://www.omdbapi.com/?t=" + movieName + "&apikey=" + Util.appId + "";

    final response = await get(Uri.encodeFull(finalUrl));
    print("Url: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("Body: ${response.body}");
      return MovieModel.fromJson(jsonDecode(response.body));
      // Map<String, dynamic> responseMap = json.decode(response.body);
      // MovieModel model = MovieModel.fromJson(responseMap);

    } else {
      throw Exception("Bad Reuqest");
    }
  }
}
