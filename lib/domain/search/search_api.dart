import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/Infrastructure/api_keys.dart';
import 'package:netflix/domain/search/search_model.dart';

class ApihandlerForSearch {
  static Future<List<ResultsSearch>> fetchSearchMovies(String searchQuerry) async {
    final url = 'https://api.themoviedb.org/3/search/movie?query=$searchQuerry&api_key=$apiKey';

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
    return ResultsSearch.searchFromSnapshot(tempList);
  }
}
