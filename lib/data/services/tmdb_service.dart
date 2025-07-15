import 'dart:convert'; // for jsonDecode
import 'package:http/http.dart' as http;
import 'package:movie_app/core/api/api_keys.dart';
import 'package:movie_app/data/models/movie_details.dart';

import '../models/credit_person.dart';
import '../models/credits.dart';
import '../models/movie.dart';

class TMDBService {
  final String apiKey = tmdbApiKey;
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getSearchResults(String query) async {
    final uri = Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List results = json['results'];
      return results.map((movieJson) => Movie.fromMap(movieJson)).toList();
    } else {
      throw Exception('Failed to load search results: ${response.statusCode}');
    }
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    final uri = Uri.parse('$baseUrl/movie/$id?api_key=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      final json = jsonDecode(response.body);
      final result = MovieDetails.fromJson(json);
      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie details');
    }
  }

  Future<Credits> getMovieCredits(int movieId) async {
    final uri = Uri.parse('$baseUrl/movie/$movieId/credits?api_key=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List castList = json['cast'];
      final List crewList = json['crew'];

      final cast = castList.map((e) => CreditPerson.fromMap(e)).toList();
      final crew = crewList.map((e) => CreditPerson.fromMap(e)).toList();

      return Credits(cast: cast, crew: crew);
    } else {
      throw Exception('Failed to load movie credits');
    }
  }

  Future<List<Movie>> getFeaturedMovies() async {
    final Uri uri = Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List results = json['results'];
      return results.map((movieJson) => Movie.fromMap(movieJson)).toList();
    } else {
      throw Exception('Failed to load search results: ${response.statusCode}');
    }
  }
}
