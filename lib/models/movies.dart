class Movie {
  String title;
  String backdropPath;
  String overview;
  String posterPath;
  String releaseDate;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });
//  this is a get request: 
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }

}

