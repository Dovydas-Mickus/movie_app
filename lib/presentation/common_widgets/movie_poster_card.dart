import 'package:flutter/material.dart';
import 'package:movie_app/presentation/features/details/view/details.dart';
import '../../data/models/movie.dart';

class MoviePosterCard extends StatelessWidget {
  final bool isLarge;
  final Movie movie;

  const MoviePosterCard({super.key, required this.movie, required this.isLarge});

  @override
  Widget build(BuildContext context) {

    if (movie.posterPath == '') {
      return SizedBox(height: 0, width: 0,);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Details(id: movie.id)));
        },
        child: Container(
          width: 400,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Stack(
            children: [
              // Poster image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  height: 500,
                  'https://image.tmdb.org/t/p/w780${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),

              // Vignette overlay
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movie.title, style: TextStyle(color: Colors.white, fontSize: isLarge ? 20 : 14),),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
