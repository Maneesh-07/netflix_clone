import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/models/popular/popularmodel.dart';

class Apihandler {
  static Future<List<Results>> fetchPopularMovies() async {
    const apiKey = 'ce67f1a6cb358f3908b618579e03c76b';
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }
    }
    return Results.popularFromSnapshot(tempList);
  }
}
