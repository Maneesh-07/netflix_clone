import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix/Infrastructure/api_keys.dart';
import 'package:netflix/domain/toprated/toprated_tvshow.dart';

class Apihandler2 {
  static Future<List<ResultsTvshows>> fetchTvShowsMovies() async {
    const url = 'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    List tempList = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the jsonData as per your requirements
      print(jsonData);

      for (var v in jsonDecode(response.body)['results']) {
        log('damn $v');

        tempList.add(v);
      }
    }
    log('damn having problem $tempList');
    return ResultsTvshows.trendingFromSnapshot(tempList);
  }
}
