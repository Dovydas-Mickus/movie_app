class Movie {
  final bool isAdlut;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLang;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAvg;
  final int voteCount;

  const Movie({
    required this.isAdlut,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLang,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAvg,
    required this.voteCount,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'isAdlut': this.isAdlut,
  //     'backdropPath': this.backdropPath,
  //     'genreIds': this.genreIds,
  //     'id': this.id,
  //     'originalLang': this.originalLang,
  //     'originalTitle': this.originalTitle,
  //     'overview': this.overview,
  //     'popularity': this.popularity,
  //     'posterPath': this.posterPath,
  //     'releaseDate': this.releaseDate,
  //     'title': this.title,
  //     'video': this.video,
  //     'voteAvg': this.voteAvg,
  //     'voteCount': this.voteCount,
  //   };
  // }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      isAdlut: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      id: map['id'] ?? 0,
      originalLang: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: (map['popularity'] ?? 0).toDouble(),
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAvg: (map['vote_average'] ?? 0).toDouble(),
      voteCount: map['vote_count'] ?? 0,
    );
  }

}