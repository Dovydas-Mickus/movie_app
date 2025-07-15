import 'package:flutter/material.dart';
import 'package:movie_app/presentation/common_widgets/movie_poster_card.dart';

import '../../../../data/models/movie.dart';

class Results extends StatelessWidget {
  final List<Movie> movies;

  const Results({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 16, // horizontal spacing between cards
          runSpacing: 16, // vertical spacing between rows
          children: movies.map((movie) => SizedBox(
            width: 400, // fixed width to control wrapping
            child: MoviePosterCard(movie: movie, isLarge: true,),
          )).toList(),
        ),
      ),
    );
  }
}
