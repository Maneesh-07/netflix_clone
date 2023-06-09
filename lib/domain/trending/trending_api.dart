import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix/Infrastructure/api_keys.dart';
import 'package:netflix/domain/trending/trending_models.dart';

class Apihandler1 {
  static Future<List<Resultstrending>> fetchTrendingMovies() async {
    const url = 'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        tempList.add(v);
      }
      log(tempList.toString());
    }

    return Resultstrending.trendingFromSnapshot(tempList);
  }
}
