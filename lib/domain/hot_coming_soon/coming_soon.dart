class upcoming {
  Dates? dates;
  int? page;
  List<Resultscoming>? results;
  int? totalPages;
  int? totalResults;

  upcoming(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  upcoming.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Resultscoming>[];
      json['results'].forEach((v) {
        results!.add(new Resultscoming.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}


//
class Resultscoming {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  // double? voteAverage;
  int? voteCount;

  Resultscoming(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      // this.voteAverage,
      this.voteCount});

  Resultscoming.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    // voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  static List<Resultscoming> comingSoonFromSnapshot(
      List<dynamic> comingSoonSnapshot) {
    return comingSoonSnapshot
        .map((jsonData) => Resultscoming.fromJson(jsonData))
        .toList();
  }
}
