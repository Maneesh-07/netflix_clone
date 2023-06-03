
class topShows {
  int? page;
  List<ResultsTvshows>? results;
  int? totalPages;
  int? totalResults;

  topShows({this.page, this.results, this.totalPages, this.totalResults});

  topShows.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <ResultsTvshows>[];
      json['results'].forEach((v) {
        results!.add(new ResultsTvshows.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class ResultsTvshows {
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  ResultsTvshows({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  ResultsTvshows.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  static List<ResultsTvshows> trendingFromSnapshot(List<dynamic> tvshowsSnapshot) {
    return tvshowsSnapshot
        .map((jsonData) => ResultsTvshows.fromJson(jsonData))
        .toList();
  }
}
