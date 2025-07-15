import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/data/services/tmdb_service.dart';

import '../models/credits.dart';
import '../models/movie.dart';

class TMDBRepository {

  final TMDBService service;

  const TMDBRepository({required this.service});

  Future<List<Movie>> getSearchResults(String query) async {
    final results = await service.getSearchResults(query);
    return results;
  }

  Future<MovieDetails> getMovie(int id) async {
    final result = await service.getMovieDetails(id);

    return result;
  }

  Future<Credits> getMovieCredits(int id) async {
    final credits = await service.getMovieCredits(id);

    return credits;
  }

  Future<List<Movie>> getFeatured() async {
    final movies = service.getFeaturedMovies();

    return movies;
  }
}