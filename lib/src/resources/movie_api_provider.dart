import 'dart:convert';

import 'package:bloc_app/src/models/item_model.dart';
import 'package:http/http.dart' as http;

class MovieApiProvider {
  final client = http.Client();
  // final _apiKey = '4c4291c6e34fa924180167210add7e3c';

  Future<ItemModel> fetchMovieList() async {
    String uri =
        "http://api.themoviedb.org/3/movie/popular?api_key=4c4291c6e34fa924180167210add7e3c";
    final response = await client.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      // print(response.statusCode);
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get data from the server');
    }
  }
}
